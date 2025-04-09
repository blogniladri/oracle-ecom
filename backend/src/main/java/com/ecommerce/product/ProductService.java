package com.ecommerce.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Product> getAllProducts() {
        String sql = "SELECT id, name, description, price, image_url, stock_quantity FROM products";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getLong("id"));
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getBigDecimal("price"));
            product.setImageUrl(rs.getString("image_url"));
            product.setStockQuantity(rs.getInt("stock_quantity"));
            return product;
        });
    }

    public List<Product> getProductsRowNum(Long row) {
        String sql = "SELECT * FROM products WHERE ROWNUM <= ?";
        return jdbcTemplate.query(sql, new Object[]{row}, (rs, rowNum) -> {
            Product product = new Product();
            product.setId(rs.getLong("id"));
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getBigDecimal("price"));
            product.setImageUrl(rs.getString("image_url"));
            product.setStockQuantity(rs.getInt("stock_quantity"));
            return product;
        });
    }

    public List<String> getMfgCodes() {
        String sql = "SELECT DISTINCT(SUBSTR(name, 1, 3)) AS mfg_code FROM products";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            return rs.getString("mfg_code");
        });
    }


    public List<String> findProductByRegex(String pattern) {
        String sql = "SELECT name FROM products WHERE REGEXP_LIKE(name, ?)";
        return jdbcTemplate.query(sql, new Object[]{pattern}, (rs, rowNum) -> {
            return rs.getString("name");
        });
    }

    public Optional<Product> getProductById(Long id) {
        String sql = "SELECT id, name, description, price, image_url, stock_quantity FROM products WHERE id = ?";
        try {
            Product product = jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> {
                Product p = new Product();
                p.setId(rs.getLong("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setImageUrl(rs.getString("image_url"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                return p;
            });
            return Optional.ofNullable(product);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    public boolean updateStock(Long productId, int quantity) {
        String sql = "UPDATE products SET stock_quantity = stock_quantity - ? WHERE id = ? AND stock_quantity >= ?";
        int updated = jdbcTemplate.update(sql, quantity, productId, quantity);
        return updated > 0;
    }
}
