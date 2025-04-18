package com.ecommerce.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    @GetMapping("/rownum/{row}")
    public List<Product> getProductsRowNum(Long row) {
        return productService.getProductsRowNum(row);
    }

    @GetMapping("/mfg")
    public List<String> getMfgCodes() {
        return productService.getMfgCodes();
    }

    @GetMapping("/mfg/{exp}")
    public List<String> getMfgCodes(@PathVariable String exp) {
        return productService.findProductByRegex(exp);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable Long id) {
        return productService.getProductById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
