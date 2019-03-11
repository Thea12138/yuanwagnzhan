package com.spring.springmvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.BaseService;
import com.spring.springmvc.dao.LogDao;

@Service
public class LogService extends BaseService {

	@Autowired
	LogDao dao;

	public Map<String, Object> GetList(int pageno, int pagerow) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetListCount();
			list = dao.GetList(pageno, pagerow);
			map.put("rows", rows);
			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
