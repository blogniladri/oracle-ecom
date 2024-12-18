package com.ecommerce.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<CartItem> getCartItems() {
        String sql = "SELECT c.product_id, c.quantity, p.name, p.price, p.image_url " +
                    "FROM cart_items c " +
                    "JOIN products p ON c.product_id = p.id";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            CartItem item = new CartItem();
            item.setProductId(rs.getLong("product_id"));
            item.setQuantity(rs.getInt("quantity"));
            item.setName(rs.getString("name"));
            item.setPrice(rs.getBigDecimal("price"));
            item.setImageUrl(rs.getString("image_url"));
            return item;
        });
    }

    @Transactional
    public void addToCart(Long productId, int quantity) {
        String checkSql = "SELECT quantity FROM cart_items WHERE product_id = ?";
        List<Integer> existing = jdbcTemplate.query(checkSql, 
            new Object[]{productId},
            (rs, rowNum) -> rs.getInt("quantity"));

        if (existing.isEmpty()) {
            String insertSql = "INSERT INTO cart_items (product_id, quantity) VALUES (?, ?)";
            jdbcTemplate.update(insertSql, productId, quantity);
        } else {
            String updateSql = "UPDATE cart_items SET quantity = quantity + ? WHERE product_id = ?";
            jdbcTemplate.update(updateSql, quantity, productId);
        }
    }

    @Transactional
    public void updateQuantity(Long productId, int quantity) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE product_id = ?";
        jdbcTemplate.update(sql, quantity, productId);
    }

    @Transactional
    public void removeFromCart(Long productId) {
        String sql = "DELETE FROM cart_items WHERE product_id = ?";
        jdbcTemplate.update(sql, productId);
    }

    @Transactional
    public void clearCart() {
        String sql = "DELETE FROM cart_items";
        jdbcTemplate.update(sql);
    }
}