package com.spring.springmvc.service;

import com.spring.springmvc.dao.ProductDao;
import com.spring.springmvc.domain.ProductDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductDao dao;

    public int insertProduct(HttpServletRequest request){

        ProductDomain domain = new ProductDomain();
        bindProductData(domain, request);
        return dao.insertProduct(domain);
    }
    public int deleteProduct(){
        return 0;
    }
    public int updateProduct(HttpServletRequest request){

        ProductDomain domain = new ProductDomain();
        bindProductData(domain, request);

        return dao.updateProduct(domain);
    }

    public List<Map<String, Object>> listProduct(){
        return dao.listProduct();
    }

    public Map<String, Object> getProduct(String productName){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            map = dao.getProduct(productName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    private void bindProductData(ProductDomain domain, HttpServletRequest request) {
        domain.setProductName(request.getParameter("productName"));
        domain.setProductUrl(request.getParameter("productUrl"));
        domain.setProductIntroduce(request.getParameter("productIntroduce"));
        domain.setProductCategory(request.getParameter("productCategory"));
        domain.setProductUnit1(request.getParameter("productUnit1"));
        domain.setProductUnit2(request.getParameter("productUnit2"));
        domain.setProductUnit3(request.getParameter("productUnit3"));
        domain.setProductUnit4(request.getParameter("productUnit4"));
        domain.setCreateBy(request.getParameter("CreateBy"));
        domain.setCreateDate(request.getParameter("createDate"));
    }
}
