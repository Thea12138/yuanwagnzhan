package com.spring.springmvc.dao;

import com.spring.core.BaseDao;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.ProductDomain;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDao extends BaseDao {

    public int insertProduct(ProductDomain domain){
        String sql = "insert into qaii_product(product_name, product_url, product_introduce, product_category, " +
                "product_unit1, product_unit2, product_unit3, product_unit4, creat_by, creat_date) " +
                "values(:name, :url, :introduce, :category, :unit1, :unit2, :unit3, :unit4, :creater, :date)";
        SqlParameterSource paramers = new MapSqlParameterSource();
        //paramers

        return 0;
    }

    public int deleteProduct(){
        String sql = "delete from qaii_product where id = :id";
        return 0;
    }

    public int updateProduct(ProductDomain domain){
        String sql = "update qaii_product " +
                "set product_introduce = :introduce, product_category = :category, product_unit1 = :unit1, " +
                "product_unit2 = :unit2, product_unit3 = :unit3, product_unit4 =　:unit4, creater = :creater, date = :date";
        return 0;
    }

    public List<Map<String, Object>> listProduct(){
        List<Map<String, Object>> list = null;
        SqlParameterSource paramers = new MapSqlParameterSource();
        String sql = "select * from qaii_product";
        try {
            list = queryForList(sql, paramers);
        } catch (DAOException e) {

            e.printStackTrace();
        }
        return list;
    }

    public Map<String, Object> getProduct(String productName){
        Map<String, Object> map = new HashMap<String, Object>();
        String sql = "select * from qaii_product where product_name = :productName";
        SqlParameterSource paramers = new MapSqlParameterSource();
        ((MapSqlParameterSource) paramers).addValue("productName", productName);
        try {
            map = queryForMap(sql, paramers);
        } catch (DAOException e) {

            e.printStackTrace();
        }
        return map;
    }
}
