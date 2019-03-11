package com.spring.springmvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.BaseService;
import com.spring.springmvc.dao.AwardDao;
import com.spring.springmvc.domain.AwardDomain;
import com.spring.util.ConstantUtil;

@Service
public class AwardService extends BaseService {

	@Autowired
	AwardDao dao;

	public Map<String, Object> GetList(int pageno, int pagerow,
			String AwardTitle, String GrantUnit, String GetTime, String Winners) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetListCount(AwardTitle, GrantUnit, GetTime, Winners);
			list = dao.GetList(pageno, pagerow, AwardTitle, GrantUnit, GetTime,
					Winners);
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
				AwardDomain domain = new AwardDomain();

				domain.setAwardTitle(request.getParameter("AwardTitle") == null ? ""
						: request.getParameter("AwardTitle").trim());
				domain.setGrantUnit(request.getParameter("GrantUnit") == null ? ""
						: request.getParameter("GrantUnit").trim());
				domain.setGetTime(request.getParameter("GetTime") == null ? ""
						: request.getParameter("GetTime").trim());
				domain.setWinners(request.getParameter("Winners") == null ? ""
						: request.getParameter("Winners").trim());

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
				AwardDomain domain = new AwardDomain();

				domain.setAwardID(Integer.parseInt(request
						.getParameter("AwardID")));
				domain.setAwardTitle(request.getParameter("AwardTitle") == null ? ""
						: request.getParameter("AwardTitle").trim());
				domain.setGrantUnit(request.getParameter("GrantUnit") == null ? ""
						: request.getParameter("GrantUnit").trim());
				domain.setGetTime(request.getParameter("GetTime") == null ? ""
						: request.getParameter("GetTime").trim());
				domain.setWinners(request.getParameter("Winners") == null ? ""
						: request.getParameter("Winners").trim());

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

	public Map<String, Object> DelData(int AwardID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = dao.DelData(AwardID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int AwardID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetInfoByID(AwardID);
			map.put("AwardID",
					row.get("AwardID") == null
							|| "".equals(row.get("AwardID").toString()) ? 0
							: Integer.parseInt(row.get("AwardID").toString()));
			map.put("Seq",
					row.get("Seq") == null
							|| "".equals(row.get("Seq").toString()) ? "" : row
							.get("Seq").toString());
			map.put("AwardTitle",
					row.get("AwardTitle") == null
							|| "".equals(row.get("AwardTitle").toString()) ? ""
							: row.get("AwardTitle").toString());
			map.put("GrantUnit",
					row.get("GrantUnit") == null
							|| "".equals(row.get("GrantUnit").toString()) ? ""
							: row.get("GrantUnit").toString());
			map.put("GetTime",
					row.get("GetTime") == null
							|| "".equals(row.get("GetTime").toString()) ? ""
							: row.get("GetTime").toString());
			map.put("Winners",
					row.get("Winners") == null
							|| "".equals(row.get("Winners").toString()) ? ""
							: row.get("Winners").toString());

			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
