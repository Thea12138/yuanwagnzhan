package com.spring.springmvc.controller;

import com.spring.core.BaseController;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.RecruitDomain;
import com.spring.springmvc.service.RecruitService;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


//招贤纳士
@Controller
public class RecruitController extends BaseController {

    @Autowired
    private RecruitService service;

    private static final Logger logger = Logger.getLogger(RecruitController.class);

    Map<String, Object> getSuccessMap(){
        Map<String, Object> map = new HashMap<>();
        map.put("code", 1);
        map.put("message", "success!");
        return map;
    }

    //列表
    @RequestMapping(value = "listRecruit.do")
    @ResponseBody
    public Map<String, Object> listRecruit() throws DAOException {
        Map map = new HashMap();
        List<Map<String, Object>> list = service.listRecruit();
        map.put("rows", list.size());
        map.put("list", list);
        map.put("exec_code", 1);
        map.put("fail_code", -1);
        return map;
    }

    //增加
    @RequestMapping(value = "insertRecruit.do")
    @ResponseBody
    public Map<String, Object> insertRecruit(@RequestParam String recruitName, @RequestParam String recruitUnit, @RequestParam Short recruitPerson,
                             @RequestParam String recruitResponsibility , @RequestParam String recruitRequire) throws DAOException {
        RecruitDomain recruitDomain = new RecruitDomain(null, recruitName, recruitUnit, recruitPerson, recruitResponsibility, recruitRequire);
        Map map = new HashMap();
        int result = service.insertRecruit(recruitDomain);
        if (result != 0) {
            map.put("exec_code", 1);
            map.put("fail_code", -1);
        } else {
            map.put("exec_code", 0);
            map.put("fail_code", 1);
        }
        return map;
    }

    //删除
    @RequestMapping(value = "deleteRecruit.do")
    @ResponseBody
    public Map<String, Object> deleteRecruit(@RequestParam int id) throws DAOException {
        Map map = new HashMap();
        int result = service.deleteRecruit(id);
        map.put("exec_code", result);
        map.put("fail_code", -1);
        return map;
    }

    @RequestMapping(value = "updateRecruit.do")
    @ResponseBody
    public Map<String, Object> updateRecruit(@RequestParam int id, @RequestParam String recruitName, @RequestParam String recruitUnit, @RequestParam Short recruitPerson,
                                             @RequestParam String recruitResponsibility , @RequestParam String recruitRequire) throws DAOException {
        RecruitDomain recruitDomain = new RecruitDomain(id, recruitName, recruitUnit, recruitPerson, recruitResponsibility, recruitRequire);
        Map map = new HashMap();
        int result = service.updateRecruit(recruitDomain);
        if (result != 0) {
            map.put("exec_code", 1);
            map.put("fail_code", -1);
        } else {
            map.put("exec_code", 0);
            map.put("fail_code", 1);
        }
        return map;
    }

    @RequestMapping(value = "getRecruit.do")
    @ResponseBody
    public Map<String, Object> getRecruit(@RequestParam int id) throws DAOException {
        Map result = service.getRecruit(id);
        Map map = result == null ? new HashMap() : result;
        map.put("exec_code", 1);
        map.put("fail_code", -1);
        return map;
    }
}
