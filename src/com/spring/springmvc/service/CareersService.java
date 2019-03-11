package com.spring.springmvc.service;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.core.BaseService;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.dao.CareersDao;
import com.spring.springmvc.domain.ApplyDomain;
import com.spring.springmvc.domain.CareersDomain;
import com.spring.util.ConstantUtil;
import com.spring.util.ImportFile;

@Service
public class CareersService extends BaseService {

	@Autowired
	CareersDao dao;

	public List<Map<String, Object>> RecruitmentAll() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = dao.RecruitmentAll();
		return list;
	}

	public Map<String, Object> GetRecruitmentById(int RecruitmentID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = dao.GetRecruitmentById(RecruitmentID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public List<Map<String, Object>> GetRecruitmentRecommend() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			list = dao.GetRecruitmentRecommend();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetCareers(int pageno, int pagerow) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetCareersCount();
			list = dao.GetCareers(pageno, pagerow);
			map.put("rows", rows);
			map.put("list", list);
			map.put("pageno", pageno);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> AddCareers(HttpServletRequest request)
			throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				CareersDomain domain = new CareersDomain();

				domain.setJobTitle(request.getParameter("JobTitle") == null ? ""
						: request.getParameter("JobTitle").trim());
				domain.setPublicDate(request.getParameter("PublicDate").trim());
				domain.setVacancies(request.getParameter("Vacancies") == null ? 0
						: Integer.parseInt(request.getParameter("Vacancies")));
				domain.setDescription(request.getParameter("Description") == null ? ""
						: request.getParameter("Description").trim());
				domain.setQualifications(request.getParameter("Qualifications") == null ? ""
						: request.getParameter("Qualifications").trim());
				domain.setRecommend(request.getParameterValues("Recommend") == null ? false
						: true);
				int result = dao.AddCareers(domain,
						request.getParameter("UserID"));
				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}

		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> EditCareers(HttpServletRequest request)
			throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				CareersDomain domain = new CareersDomain();
				domain.setRecruitmentID(request.getParameter("RecruitmentID") == null ? 0
						: Integer.parseInt(request
								.getParameter("RecruitmentID")));
				domain.setPublicDate(request.getParameter("PublicDate").trim());
				domain.setJobTitle(request.getParameter("JobTitle") == null ? ""
						: request.getParameter("JobTitle").trim());
				domain.setVacancies(request.getParameter("Vacancies") == null ? 0
						: Integer.parseInt(request.getParameter("Vacancies")));
				domain.setDescription(request.getParameter("Description") == null ? ""
						: request.getParameter("Description").trim());
				domain.setQualifications(request.getParameter("Qualifications") == null ? ""
						: request.getParameter("Qualifications").trim());
				domain.setRecommend(request.getParameterValues("Recommend") == null ? false
						: true);

				int result = dao.EditCareers(domain,
						request.getParameter("UserID"));
				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}

		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> DelCareers(int RecruitmentID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = dao.DelCareers(RecruitmentID, userid);
				map.put("exec_code", result);
				map.put("fail_code", "-1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetCareersByID(int RecruitmentID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetCareersByID(RecruitmentID);
			map.put("RecruitmentID",
					row.get("RecruitmentID") == null
							|| "".equals(row.get("RecruitmentID").toString()) ? 0
							: Integer.parseInt(row.get("RecruitmentID")
									.toString()));
			map.put("JobTitle",
					row.get("JobTitle") == null
							|| "".equals(row.get("JobTitle").toString()) ? ""
							: row.get("JobTitle").toString());
			map.put("Vacancies",
					row.get("Vacancies") == null
							|| "".equals(row.get("Vacancies").toString()) ? ""
							: row.get("Vacancies").toString());
			map.put("PublicDate",
					row.get("PublicDate") == null
							|| "".equals(row.get("PublicDate").toString()) ? ""
							: row.get("PublicDate").toString());
			map.put("Description",
					row.get("Description") == null
							|| "".equals(row.get("Description").toString()) ? ""
							: row.get("Description").toString());
			map.put("Qualifications",
					row.get("Qualifications") == null
							|| "".equals(row.get("Qualifications").toString()) ? ""
							: row.get("Qualifications").toString());
			map.put("Recommend",
					row.get("Recommend") == null
							|| "".equals(row.get("Recommend").toString()) ? ""
							: row.get("Recommend").toString());
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/* start 后台方法 */
	/**
	 * 添加申请信息
	 * 
	 * @author CaoRC
	 * @param apply
	 * @return
	 * @throws DAOException
	 */
	public void add(HttpServletRequest rt) {

		ApplyDomain apply = new ApplyDomain();
		Date ApplicationDate = new Date();
		apply.setApplicationDate(ApplicationDate);
		apply.setRecruitmentID(rt.getParameter("RecruitmentID") == null ? 0
				: Integer.parseInt(rt.getParameter("RecruitmentID")));
		apply.setFullName(rt.getParameter("FullName") == null ? "" : rt
				.getParameter("FullName").trim());
		apply.setPhone(rt.getParameter("Phone") == null ? "" : rt.getParameter(
				"Phone").trim());
		apply.setMailbox(rt.getParameter("Mailbox") == null ? "" : rt
				.getParameter("Mailbox").trim());
		apply.setWorkExperience(rt.getParameter("WorkExperience") == null ? ""
				: rt.getParameter("WorkExperience").trim());
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) rt;
		MultipartFile Attachment = multipartRequest.getFile("Attachment");
		apply.setAttachment(Attachment.getOriginalFilename());
		try {
			dao.add(apply);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		ImportFile upfile = new ImportFile();
		try {
			// 获得文件：
			upfile.add(Attachment, "applyAttachment/", apply.getRecruitmentID());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加申请信息
	 * 
	 * @author CaoRC
	 * @param apply
	 * @return
	 * @throws DAOException
	 */
	public void AddApply(HttpServletRequest rt) {

		ApplyDomain apply = new ApplyDomain();
		Date ApplicationDate = new Date();
		apply.setApplicationDate(ApplicationDate);
		apply.setRecruitmentID(0);
		apply.setFullName(rt.getParameter("FullName") == null ? "" : rt
				.getParameter("FullName").trim());
		apply.setPhone(rt.getParameter("Phone") == null ? "" : rt.getParameter(
				"Phone").trim());
		apply.setMailbox(rt.getParameter("Mailbox") == null ? "" : rt
				.getParameter("Mailbox").trim());
		apply.setWorkExperience(rt.getParameter("WorkExperience") == null ? ""
				: rt.getParameter("WorkExperience").trim());
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) rt;
		MultipartFile Attachment = multipartRequest.getFile("Attachment");
		apply.setAttachment(Attachment.getOriginalFilename());
		try {
			dao.add(apply);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		ImportFile upfile = new ImportFile();
		try {
			// 获得文件：
			upfile.add(Attachment, "applyAttachment/", apply.getRecruitmentID());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 修改申请信息
	 * 
	 * @author CaoRC
	 * @param apply
	 * @return
	 * @throws DAOException
	 */
	public void EditApply(HttpServletRequest rt) {

		ApplyDomain apply = new ApplyDomain();
		Date ApplicationDate = new Date();
		apply.setApplicationDate(ApplicationDate);
		apply.setApplicationID(rt.getParameter("ApplicationID") == null ? 0
				: Integer.parseInt(rt.getParameter("ApplicationID")));
		apply.setRecruitmentID(rt.getParameter("RecruitmentID") == null ? 0
				: Integer.parseInt(rt.getParameter("RecruitmentID")));
		apply.setFullName(rt.getParameter("FullName") == null ? "" : rt
				.getParameter("FullName").trim());
		apply.setPhone(rt.getParameter("Phone") == null ? "" : rt.getParameter(
				"Phone").trim());
		apply.setMailbox(rt.getParameter("Mailbox") == null ? "" : rt
				.getParameter("Mailbox").trim());
		apply.setWorkExperience(rt.getParameter("WorkExperience") == null ? ""
				: rt.getParameter("WorkExperience").trim());
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) rt;
		MultipartFile Attachment = multipartRequest.getFile("Attachment");
		apply.setAttachment(Attachment.getOriginalFilename());
		try {
			dao.EditApply(apply);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		ImportFile upfile = new ImportFile();
		try {
			// 获得文件：
			upfile.add(Attachment, "applyAttachment/", apply.getRecruitmentID());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Map<String, Object> GetApplication(int pageno, int pagerow) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetApplicationCount();
			list = dao.GetApplication(pageno, pagerow);
			map.put("rows", rows);
			map.put("list", list);
			map.put("pageno", pageno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public int DownLoadApplication(HttpServletRequest rt,
			HttpServletResponse response, String ApplicationID) {
		try {

			int result = dao.DownLoadApplication(rt, response, ApplicationID);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	public Map<String, Object> GetApplicationByID(int ApplicationID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetApplicationByID(ApplicationID);
			map.put("ApplicationID",
					row.get("ApplicationID") == null
							|| "".equals(row.get("ApplicationID").toString()) ? 0
							: Integer.parseInt(row.get("ApplicationID")
									.toString()));
			map.put("FullName",
					row.get("FullName") == null
							|| "".equals(row.get("FullName").toString()) ? ""
							: row.get("FullName").toString());
			map.put("Mailbox",
					row.get("Mailbox") == null
							|| "".equals(row.get("Mailbox").toString()) ? ""
							: row.get("Mailbox").toString());
			map.put("Phone",
					row.get("Phone") == null
							|| "".equals(row.get("Phone").toString()) ? ""
							: row.get("Phone").toString());
			map.put("WorkExperience",
					row.get("WorkExperience") == null
							|| "".equals(row.get("WorkExperience").toString()) ? ""
							: row.get("WorkExperience").toString());
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
