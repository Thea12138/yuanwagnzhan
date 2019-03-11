package com.spring.springmvc.service;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.core.BaseService;
import com.spring.springmvc.dao.TemplateDao;
import com.spring.springmvc.domain.TemplateDomain;
import com.spring.util.ConstantUtil;
import com.spring.util.ImportFile;

@Service
public class TemplateService extends BaseService {

	@Autowired
	TemplateDao dao;

	public Map<String, Object> GetViewList(int pageno, int pagerow) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetListCount("2");
			list = dao.GetViewList(pageno, pagerow);
			map.put("rows", rows);
			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

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

	public Map<String, Object> AddData(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {

				String strRealPath = this.getClass().getResource("/").getFile();
				strRealPath = URLDecoder.decode(strRealPath, "UTF-8")
						.substring(1);
				strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
				String path = "fileload/Template/";// 文件存在地方

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile htmlAttachment = multipartRequest
						.getFile("FileUrl");

				String linkname = htmlAttachment.getOriginalFilename();

				TemplateDomain domain = new TemplateDomain();

				domain.setTemplateTitle(request.getParameter("TemplateTitle") == null ? ""
						: request.getParameter("TemplateTitle").trim());
				domain.setFileUrl(linkname);
				domain.setMemo(request.getParameter("Memo") == null ? ""
						: request.getParameter("Memo").trim());
				domain.setCreateDate(request.getParameter("CreateDate") == null ? ""
						: request.getParameter("CreateDate").trim());
				domain.setCreateBy(request.getParameter("CreateBy") == null ? ""
						: request.getParameter("CreateBy").trim());

				int result = dao
						.AddData(domain, request.getParameter("UserID"));

				path = path + result + "/";

				ImportFile upfile = new ImportFile();
				upfile.deleteDirectory(path);
				upfile.add(htmlAttachment, path);// 上传html;

				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
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
				Map<String, Object> row = dao.GetStatus(Integer
						.parseInt(request.getParameter("TemplateID")));
				String status = (row.get("Status") == null
						|| "".equals(row.get("Status").toString()) ? "" : row
						.get("Status").toString());
				if (status == "2") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsEnable);
				} else if (status == "3") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsInvalid);
				} else {

					String strRealPath = this.getClass().getResource("/")
							.getFile();
					strRealPath = URLDecoder.decode(strRealPath, "UTF-8")
							.substring(1);
					strRealPath = strRealPath
							.replaceAll("WEB-INF/classes/", "");
					String path = "fileload/Template/";// 文件存在地方

					MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
					MultipartFile htmlAttachment = multipartRequest
							.getFile("FileUrl");
					String linkname = "";
					if (htmlAttachment != null) {
						linkname = htmlAttachment.getOriginalFilename();
					}

					TemplateDomain domain = new TemplateDomain();

					domain.setTemplateID(Integer.parseInt(request
							.getParameter("TemplateID")));
					domain.setTemplateTitle(request
							.getParameter("TemplateTitle") == null ? ""
							: request.getParameter("TemplateTitle").trim());
					domain.setFileUrl(linkname);
					domain.setMemo(request.getParameter("Memo") == null ? ""
							: request.getParameter("Memo").trim());
					domain.setCreateDate(request.getParameter("CreateDate") == null ? ""
							: request.getParameter("CreateDate").trim());
					domain.setCreateBy(request.getParameter("CreateBy") == null ? ""
							: request.getParameter("CreateBy").trim());

					int result = dao.EditData(domain,
							request.getParameter("UserID"));
					if (htmlAttachment != null) {
						path = path
								+ Integer.parseInt(request
										.getParameter("TemplateID")) + "/";
						ImportFile upfile = new ImportFile();
						upfile.deleteDirectory(path);
						upfile.add(htmlAttachment, path);// 上传html;
					}
					if (result != 0) {
						map.put("exec_code", 1);
						map.put("fail_code", -1);
					} else {
						map.put("exec_code", 0);
						map.put("fail_code", 1);
					}
				}
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> DelData(int TemplateID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				Map<String, Object> row = dao.GetStatus(TemplateID);
				String status = (row.get("Status") == null
						|| "".equals(row.get("Status").toString()) ? "" : row
						.get("Status").toString());
				if (status == "2") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsEnable);
				} else if (status == "3") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsInvalid);
				} else {
					int result = dao.DelData(TemplateID, userid);
					map.put("exec_code", result);
					map.put("fail_code", -1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> EnabledTemplate(int TemplateID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				Map<String, Object> row = dao.GetStatus(TemplateID);
				String status = (row.get("Status") == null
						|| "".equals(row.get("Status").toString()) ? "" : row
						.get("Status").toString());
				if (status == "2") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsEnable);
				} else if (status == "3") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsInvalid);
				} else {
					int isExist = dao.IsExist(TemplateID);
					if (isExist != 0) {
						map.put("exec_code", 0);
						map.put("fail_code", ConstantUtil.Template_IsExist);
					} else {
						int result = dao.EnabledTemplate(TemplateID, userid);
						map.put("exec_code", result);
						map.put("fail_code", -1);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> InvalidTemplate(int TemplateID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				Map<String, Object> row = dao.GetStatus(TemplateID);
				String status = (row.get("Status") == null
						|| "".equals(row.get("Status").toString()) ? "" : row
						.get("Status").toString());
				if (status == "2") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsEnable);
				} else if (status == "3") {
					map.put("exec_code", 0);
					map.put("fail_code", ConstantUtil.Template_IsInvalid);
				} else {
					int result = dao.InvalidTemplate(TemplateID, userid);
					map.put("exec_code", result);
					map.put("fail_code", -1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int TemplateID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetInfoByID(TemplateID);
			map.put("TemplateID",
					row.get("TemplateID") == null
							|| "".equals(row.get("TemplateID").toString()) ? 0
							: Integer
									.parseInt(row.get("TemplateID").toString()));
			map.put("TemplateTitle",
					row.get("TemplateTitle") == null
							|| "".equals(row.get("TemplateTitle").toString()) ? ""
							: row.get("TemplateTitle").toString());
			map.put("FileUrl",
					row.get("FileUrl") == null
							|| "".equals(row.get("FileUrl").toString()) ? ""
							: row.get("FileUrl").toString());
			map.put("Status",
					row.get("Status") == null
							|| "".equals(row.get("Status").toString()) ? ""
							: row.get("Status").toString());
			map.put("Memo",
					row.get("Memo") == null
							|| "".equals(row.get("Memo").toString()) ? "" : row
							.get("Memo").toString());
			map.put("CreateDate",
					row.get("CreateDate") == null
							|| "".equals(row.get("CreateDate").toString()) ? ""
							: row.get("CreateDate").toString());
			map.put("CreateBy",
					row.get("CreateBy") == null
							|| "".equals(row.get("CreateBy").toString()) ? ""
							: row.get("CreateBy").toString());

			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> DownTemplateByID(int TemplateID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.DownTemplateByID(TemplateID);

			ImportFile upfile = new ImportFile();
			String dir = "fileload/Template/" + row.get("TemplateID") + "/";
			String filename = upfile.getFileName(dir);

			if (filename != "") {
				map.put("FileUrl",
						row.get("FileUrl") == null
								|| "".equals(row.get("FileUrl").toString()) ? ""
								: row.get("FileUrl").toString());

				map.put("exec_code", 1);
				map.put("fail_code", -1);
			} else {
				map.put("exec_code", 0);
				map.put("fail_code", 1);
			}
		} catch (Exception e) {
			map.put("exec_code", 0);
			map.put("fail_code", 1);
			e.printStackTrace();
		}
		return map;
	}

}
