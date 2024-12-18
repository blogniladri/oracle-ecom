package com.ecommerce.order;

import com.ecommerce.cart.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class OrderService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private CartService cartService;

    @Transactional
    public void createOrder(OrderRequest request) {
        // Create order
        String orderSql = "INSERT INTO orders (name, address, city, phone, status) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(orderSql, 
            request.getName(),
            request.getAddress(),
            request.getCity(),
            request.getPhone(),
            "PENDING"
        );

        // Get the created order ID
        Long orderId = jdbcTemplate.queryForObject(
            "SELECT orders_seq.CURRVAL FROM dual", Long.class);

        // Get cart items
        String cartSql = "SELECT c.product_id, c.quantity, p.price " +
                        "FROM cart_items c " +
                        "JOIN products p ON c.product_id = p.id";
        
        List<Map<String, Object>> cartItems = jdbcTemplate.queryForList(cartSql);

        // Create order items and update stock
        for (Map<String, Object> item : cartItems) {
            String insertOrderItemSql = 
                "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(insertOrderItemSql,
                orderId,
                item.get("product_id"),
                item.get("quantity"),
                item.get("price")
            );

            // Update product stock
            String updateStockSql = 
                "UPDATE products SET stock_quantity = stock_quantity - ? WHERE id = ?";
            jdbcTemplate.update(updateStockSql,
                item.get("quantity"),
                item.get("product_id")
            );
        }

        // Clear the cart
        cartService.clearCart();
    }
}