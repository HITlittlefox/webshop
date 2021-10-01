package com.example.webshop.entity;


public class Category {
    private Long category_id;
    private String name;
    private Integer parent_id;
    private Integer level;

    public Long getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Long category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Category(Long category_id, String name, Integer parent_id, Integer level) {
        this.category_id = category_id;
        this.name = name;
        this.parent_id = parent_id;
        this.level = level;
    }

    public Category() {
    }
}
