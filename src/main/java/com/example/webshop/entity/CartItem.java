package com.example.webshop.entity;


import com.example.webshop.entity.Product;

public class CartItem {
    private Product product;

    private int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
