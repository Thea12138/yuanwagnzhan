package com.spring.springmvc.controller;

import com.spring.springmvc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private ProductService service;

    public int insertProduct(HttpServletRequest request){
        return service.insertProduct(request);
    }
    public int deleteProduct(){
        return 0;
    }
    public int updateProduct(HttpServletRequest request){
        return service.updateProduct(request);
    }

    @RequestMapping("listProduct.do")
    @ResponseBody
    public List<Map<String, Object>> listProduct(){
        return service.listProduct();
    }

    @RequestMapping("getProduct.do")
    @ResponseBody
    public Map<String, Object> getProduct(@RequestParam("productName") String productName){
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            map = service.getProduct(productName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}
