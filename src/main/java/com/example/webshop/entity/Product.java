package com.example.webshop.entity;

/**
 * @author fudon
 * @version 1.0
 * @date 2021-10-02 13:32
 */
public class Product {

    private Long productId;
    private String name;
    private String des;
    private Integer price;
    private Integer categoryId;
    private String src;

    public Product() {
    }

    public Product(Long productId, String name, String des, Integer price, Integer categoryId, String src) {
        this.productId = productId;
        this.name = name;
        this.des = des;
        this.price = price;
        this.categoryId = categoryId;
        this.src = src;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + this.productId +
                ", name='" + this.name + '\'' +
                ", des='" + this.des + '\'' +
                ", price=" + this.price +
                ", categoryId=" + this.categoryId +
                '}';
    }

    public Long getProductId() {
        return this.productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return this.des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public Integer getPrice() {
        return this.price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getCategoryId() {
        return this.categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }
}
