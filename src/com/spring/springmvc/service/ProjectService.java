package com.spring.springmvc.service;

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
import com.spring.springmvc.dao.ProjectDao;
import com.spring.springmvc.domain.ProjectDomain;
import com.spring.util.ConstantUtil;
import com.spring.util.ImportFile;

@Service
public class ProjectService extends BaseService {

	@Autowired
	ProjectDao kygzdao;

	// 重点项目
	public Map<String, Object> GetList(int pageno, int pagerow) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = kygzdao.GetListCount(1);
			list = kygzdao.GetList(pageno, pagerow);
			map.put("rows", rows);
			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetProjectShowById(int ProjectID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = kygzdao.GetKeyProjectShowById(ProjectID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/*************** Start*******后台方法 ***********************/
	public Map<String, Object> AddProject(HttpServletRequest request,
			String projectType) {
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
				String path = "fileload/html/ResearchWork/";// 文件存在地方
				switch (projectType) {
				case "1":
					path = path + "KeyProject/";
					break;
				case "2":
					path = path + "AchievementsTransformation/";
					break;
				}
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile htmlAttachment = multipartRequest
						.getFile("LinkAddress");

				String linkname = htmlAttachment.getOriginalFilename();

				ProjectDomain project = new ProjectDomain();
				project.setProjectCategory(projectType);
				project.setProjectTitle(request.getParameter("ProjectTitle") == null ? ""
						: request.getParameter("ProjectTitle").trim());

				project.setPublicDate(request.getParameter("PublicDate").trim());

				project.setLinkAddress(linkname);

				int result = kygzdao.AddProject(project,
						request.getParameter("UserID"));

				// path = path + result + "/";

				String name = linkname.substring(0, linkname.lastIndexOf("."));

				String pathPicture = path + name + "/";// 图片存放地方

				ImportFile upfile = new ImportFile();
				upfile.add(htmlAttachment, path);// 上传html;

				List<MultipartFile> picturesList = multipartRequest
						.getFiles("picturesList");
				if (picturesList != null && picturesList.size() > 0) {
					upfile.add(picturesList, pathPicture);// 上传图片
				}
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

	public Map<String, Object> EditProject(HttpServletRequest request,
			String projectType) {
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
				String path = "fileload/html/ResearchWork/";// 文件存在地方
				switch (projectType) {
				case "1":
					path = path + "KeyProject/";
					break;
				case "2":
					path = path + "AchievementsTransformation/";
					break;
				}
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile htmlAttachment = multipartRequest
						.getFile("LinkAddress");

				String linkname = "";
				if (htmlAttachment != null) {
					linkname = htmlAttachment.getOriginalFilename();
				}

				ProjectDomain project = new ProjectDomain();
				project.setProjectID(request.getParameter("ProjectID") == null ? 0
						: Integer.parseInt(request.getParameter("ProjectID")
								.trim()));
				project.setProjectCategory(projectType);
				project.setProjectTitle(request.getParameter("ProjectTitle") == null ? ""
						: request.getParameter("ProjectTitle").trim());

				project.setPublicDate(request.getParameter("PublicDate").trim());

				project.setLinkAddress(linkname);

				int result = kygzdao.EditProject(project,
						request.getParameter("UserID"));

				/*
				 * path = path +
				 * Integer.parseInt(request.getParameter("ProjectID")) + "/";
				 */

				if (linkname == "") {
					linkname = request.getParameter("editlink").toString();
				}
				String name = linkname.substring(0, linkname.lastIndexOf("."));

				String pathPicture = path + name + "/";// 图片存放地方

				List<MultipartFile> picturesList = multipartRequest
						.getFiles("picturesList");

				ImportFile upfile = new ImportFile();
				if (htmlAttachment != null) {
					if (picturesList != null && picturesList.size() > 0) {
						upfile.deleteDirectory(path);
					}
					upfile.add(htmlAttachment, path);// 上传html;
				}

				if (picturesList != null && picturesList.size() > 0) {
					upfile.deleteDirectory(pathPicture);
					upfile.add(picturesList, pathPicture);// 上传图片
				}

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

	public Map<String, Object> DelProject(int ProjectID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = kygzdao.DelProject(ProjectID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int ProjectID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = kygzdao.GetInfoByID(ProjectID);

			String linkname = row.get("LinkAddress").toString();

			map.put("LinkAddress", linkname);

			linkname = linkname.substring(0, linkname.lastIndexOf("."));
			ImportFile upfile = new ImportFile();
			/*
			 * String dir = "fileload/html/ResearchWork/KeyProject/" +
			 * row.get("ProjectID") + "/" + linkname + "/";
			 */
			String dir = "fileload/html/ResearchWork/KeyProject/" + linkname
					+ "/";
			List<String> picturesList = upfile.getFileNames(dir);

			map.put("ProjectID",
					row.get("ProjectID") == null
							|| "".equals(row.get("ProjectID").toString()) ? 0
							: Integer.parseInt(row.get("ProjectID").toString()));
			map.put("ProjectTitle",
					row.get("ProjectTitle") == null
							|| "".equals(row.get("ProjectTitle").toString()) ? ""
							: row.get("ProjectTitle").toString());
			map.put("PublicDate",
					row.get("PublicDate") == null
							|| "".equals(row.get("PublicDate").toString()) ? ""
							: row.get("PublicDate").toString());
			map.put("picturesList", picturesList);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/*************** end*******后台方法 ***********************/
}
