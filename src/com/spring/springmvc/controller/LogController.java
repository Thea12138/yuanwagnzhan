package com.spring.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.core.BaseController;
import com.spring.springmvc.service.LogService;

@Controller
public class LogController extends BaseController {
	@Autowired
	LogService service;

	@ResponseBody
	@RequestMapping(value = "LoadLogList.do", method = RequestMethod.POST)
	public Map<String, Object> GetList(@RequestParam int pageno,
			@RequestParam int pagerow) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetList(pageno, pagerow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
