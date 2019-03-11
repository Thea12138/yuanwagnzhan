package com.spring.springmvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.BaseService;
import com.spring.springmvc.dao.AcademicWorksDao;
import com.spring.springmvc.domain.AcademicWorksDomain;
import com.spring.util.ConstantUtil;

@Service
public class AcademicWorksService extends BaseService {

	@Autowired
	AcademicWorksDao dao;

	public Map<String, Object> GetList(int pageno, int pagerow,
			String AcademicWorksTitle, String AcademicWorksType, String Author,
			String PublishDate, String PublishPlace) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetListCount(AcademicWorksTitle, AcademicWorksType,
					Author, PublishDate, PublishPlace);
			list = dao.GetList(pageno, pagerow, AcademicWorksTitle,
					AcademicWorksType, Author, PublishDate, PublishPlace);
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
				AcademicWorksDomain domain = new AcademicWorksDomain();

				domain.setAcademicWorksTitle(request
						.getParameter("AcademicWorksTitle") == null ? ""
						: request.getParameter("AcademicWorksTitle").trim());
				domain.setAcademicWorksType(request
						.getParameter("AcademicWorksType") == null ? ""
						: request.getParameter("AcademicWorksType").trim());
				domain.setAuthor(request.getParameter("Author") == null ? ""
						: request.getParameter("Author").trim());
				domain.setPublishDate(request.getParameter("PublishDate") == null ? ""
						: request.getParameter("PublishDate").trim());
				domain.setPublishPlace(request.getParameter("PublishPlace") == null ? ""
						: request.getParameter("PublishPlace").trim());

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
				AcademicWorksDomain domain = new AcademicWorksDomain();

				domain.setAcademicWorksID(Integer.parseInt(request
						.getParameter("AcademicWorksID")));
				domain.setAcademicWorksTitle(request
						.getParameter("AcademicWorksTitle") == null ? ""
						: request.getParameter("AcademicWorksTitle").trim());
				domain.setAcademicWorksType(request
						.getParameter("AcademicWorksType") == null ? ""
						: request.getParameter("AcademicWorksType").trim());
				domain.setAuthor(request.getParameter("Author") == null ? ""
						: request.getParameter("Author").trim());
				domain.setPublishDate(request.getParameter("PublishDate") == null ? ""
						: request.getParameter("PublishDate").trim());
				domain.setPublishPlace(request.getParameter("PublishPlace") == null ? ""
						: request.getParameter("PublishPlace").trim());

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

	public Map<String, Object> DelData(int AcademicWorksID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = dao.DelData(AcademicWorksID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int AcademicWorksID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetInfoByID(AcademicWorksID);
			map.put("AcademicWorksID",
					row.get("AcademicWorksID") == null
							|| "".equals(row.get("AcademicWorksID").toString()) ? 0
							: Integer.parseInt(row.get("AcademicWorksID")
									.toString()));
			map.put("Seq",
					row.get("Seq") == null
							|| "".equals(row.get("Seq").toString()) ? "" : row
							.get("Seq").toString());
			map.put("AcademicWorksTitle", row.get("AcademicWorksTitle") == null
					|| "".equals(row.get("AcademicWorksTitle").toString()) ? ""
					: row.get("AcademicWorksTitle").toString());
			map.put("AcademicWorksType", row.get("AcademicWorksType") == null
					|| "".equals(row.get("AcademicWorksType").toString()) ? ""
					: row.get("AcademicWorksType").toString());
			map.put("Author",
					row.get("Author") == null
							|| "".equals(row.get("Author").toString()) ? ""
							: row.get("Author").toString());
			map.put("PublishDate",
					row.get("PublishDate") == null
							|| "".equals(row.get("PublishDate").toString()) ? ""
							: row.get("PublishDate").toString());
			map.put("PublishPlace",
					row.get("PublishPlace") == null
							|| "".equals(row.get("PublishPlace").toString()) ? ""
							: row.get("PublishPlace").toString());

			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
