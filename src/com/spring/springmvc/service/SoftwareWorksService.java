package com.spring.springmvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.BaseService;
import com.spring.springmvc.dao.SoftwareWorksDao;
import com.spring.springmvc.domain.SoftwareWorksDomain;
import com.spring.util.ConstantUtil;

@Service
public class SoftwareWorksService extends BaseService {

	@Autowired
	SoftwareWorksDao dao;

	public Map<String, Object> GetList(int pageno, int pagerow,
			String SoftwareWorksTitle, String CopyrightOwner,
			String RegistrationNo, int InstituteID) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetListCount(SoftwareWorksTitle, CopyrightOwner,
					RegistrationNo, InstituteID);
			list = dao.GetList(pageno, pagerow, SoftwareWorksTitle,
					CopyrightOwner, RegistrationNo, InstituteID);
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
				SoftwareWorksDomain domain = new SoftwareWorksDomain();

				domain.setInstituteID(Integer.parseInt(request
						.getParameter("InstituteID")));
				domain.setSoftwareWorksTitle(request
						.getParameter("SoftwareWorksTitle") == null ? ""
						: request.getParameter("SoftwareWorksTitle").trim());
				domain.setCopyrightOwner(request.getParameter("CopyrightOwner") == null ? ""
						: request.getParameter("CopyrightOwner").trim());
				domain.setRegistrationNo(request.getParameter("RegistrationNo") == null ? ""
						: request.getParameter("RegistrationNo").trim());

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
				SoftwareWorksDomain domain = new SoftwareWorksDomain();

				domain.setSoftwareWorksID(Integer.parseInt(request
						.getParameter("SoftwareWorksID")));
				domain.setInstituteID(Integer.parseInt(request
						.getParameter("InstituteID")));
				domain.setSoftwareWorksTitle(request
						.getParameter("SoftwareWorksTitle") == null ? ""
						: request.getParameter("SoftwareWorksTitle").trim());
				domain.setCopyrightOwner(request.getParameter("CopyrightOwner") == null ? ""
						: request.getParameter("CopyrightOwner").trim());
				domain.setRegistrationNo(request.getParameter("RegistrationNo") == null ? ""
						: request.getParameter("RegistrationNo").trim());

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

	public Map<String, Object> DelData(int SoftwareWorksID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				int result = dao.DelData(SoftwareWorksID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int SoftwareWorksID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetInfoByID(SoftwareWorksID);
			map.put("SoftwareWorksID",
					row.get("SoftwareWorksID") == null
							|| "".equals(row.get("SoftwareWorksID").toString()) ? 0
							: Integer.parseInt(row.get("SoftwareWorksID")
									.toString()));
			map.put("InstituteID",
					row.get("InstituteID") == null
							|| "".equals(row.get("InstituteID").toString()) ? ""
							: row.get("InstituteID").toString());
			map.put("Seq",
					row.get("Seq") == null
							|| "".equals(row.get("Seq").toString()) ? "" : row
							.get("Seq").toString());
			map.put("SoftwareWorksTitle", row.get("SoftwareWorksTitle") == null
					|| "".equals(row.get("SoftwareWorksTitle").toString()) ? ""
					: row.get("SoftwareWorksTitle").toString());
			map.put("CopyrightOwner",
					row.get("CopyrightOwner") == null
							|| "".equals(row.get("CopyrightOwner").toString()) ? ""
							: row.get("CopyrightOwner").toString());
			map.put("RegistrationNo",
					row.get("RegistrationNo") == null
							|| "".equals(row.get("RegistrationNo").toString()) ? ""
							: row.get("RegistrationNo").toString());

			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
