package com.spring.springmvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.BaseService;
import com.spring.springmvc.dao.PatentDao;
import com.spring.springmvc.domain.PatentDomain;
import com.spring.util.ConstantUtil;

@Service
public class PatentService extends BaseService {

	@Autowired
	PatentDao dao;

	public Map<String, Object> GetList(int pageno, int pagerow,
			String PatentTitle, String PatentType, String PatentRight,
			String PatentNo) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetListCount(PatentTitle, PatentType, PatentRight,
					PatentNo);
			list = dao.GetList(pageno, pagerow, PatentTitle, PatentType,
					PatentRight, PatentNo);
			map.put("rows", rows);
			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> AddData(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				PatentDomain domain = new PatentDomain();

				domain.setPatentTitle(request.getParameter("PatentTitle") == null ? ""
						: request.getParameter("PatentTitle").trim());
				domain.setPatentType(request.getParameter("PatentType") == null ? ""
						: request.getParameter("PatentType").trim());
				domain.setPatentRight(request.getParameter("PatentRight") == null ? ""
						: request.getParameter("PatentRight").trim());
				domain.setPatentNo(request.getParameter("PatentNo") == null ? ""
						: request.getParameter("PatentNo").trim());

				int result = dao
						.AddData(domain, request.getParameter("UserID"));
				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> EditData(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				PatentDomain domain = new PatentDomain();

				domain.setPatentID(Integer.parseInt(request
						.getParameter("PatentID")));
				domain.setSeq(request.getParameter("Seq") == null ? ""
						: request.getParameter("Seq").trim());
				domain.setPatentTitle(request.getParameter("PatentTitle") == null ? ""
						: request.getParameter("PatentTitle").trim());
				domain.setPatentType(request.getParameter("PatentType") == null ? ""
						: request.getParameter("PatentType").trim());
				domain.setPatentRight(request.getParameter("PatentRight") == null ? ""
						: request.getParameter("PatentRight").trim());
				domain.setPatentNo(request.getParameter("PatentNo") == null ? ""
						: request.getParameter("PatentNo").trim());

				int result = dao.EditData(domain,
						request.getParameter("UserID"));
				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> DelData(int PatentID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				int result = dao.DelData(PatentID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int PatentID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetInfoByID(PatentID);
			map.put("PatentID",
					row.get("PatentID") == null
							|| "".equals(row.get("PatentID").toString()) ? 0
							: Integer.parseInt(row.get("PatentID").toString()));
			map.put("Seq",
					row.get("Seq") == null
							|| "".equals(row.get("Seq").toString()) ? "" : row
							.get("Seq").toString());
			map.put("PatentTitle",
					row.get("PatentTitle") == null
							|| "".equals(row.get("PatentTitle").toString()) ? ""
							: row.get("PatentTitle").toString());
			map.put("PatentType",
					row.get("PatentType") == null
							|| "".equals(row.get("PatentType").toString()) ? ""
							: row.get("PatentType").toString());
			map.put("PatentRight",
					row.get("PatentRight") == null
							|| "".equals(row.get("PatentRight").toString()) ? ""
							: row.get("PatentRight").toString());
			map.put("PatentNo",
					row.get("PatentNo") == null
							|| "".equals(row.get("PatentNo").toString()) ? ""
							: row.get("PatentNo").toString());

			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
