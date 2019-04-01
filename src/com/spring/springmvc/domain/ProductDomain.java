package com.spring.springmvc.domain;

public class ProductDomain {
    private int id;

    private String productName;

    private String productUrl;

    private String productIntroduce;

    private String productCategory;

    private String productUnit1;

    private String productUnit2;

    private String productUnit3;

    private String productUnit4;

    private String createBy;

    private String createDate;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductUrl() {
        return productUrl;
    }

    public void setProductUrl(String productUrl) {
        this.productUrl = productUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductIntroduce() {
        return productIntroduce;
    }

    public void setProductIntroduce(String productIntroduce) {
        this.productIntroduce = productIntroduce;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductUnit1() {
        return productUnit1;
    }

    public void setProductUnit1(String productUnit1) {
        this.productUnit1 = productUnit1;
    }

    public String getProductUnit2() {
        return productUnit2;
    }

    public void setProductUnit2(String productUnit2) {
        this.productUnit2 = productUnit2;
    }

    public String getProductUnit3() {
        return productUnit3;
    }

    public void setProductUnit3(String productUnit3) {
        this.productUnit3 = productUnit3;
    }

    public String getProductUnit4() {
        return productUnit4;
    }

    public void setProductUnit4(String productUnit4) {
        this.productUnit4 = productUnit4;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }
}
