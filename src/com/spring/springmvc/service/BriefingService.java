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
import com.spring.springmvc.dao.BriefingDao;
import com.spring.springmvc.domain.BriefingDomain;
import com.spring.util.ConstantUtil;
import com.spring.util.ImportFile;

@Service
public class BriefingService extends BaseService {

	@Autowired
	BriefingDao briefingdao;

	public Map<String, Object> LoadBriefingList(int pageno, int pagerow) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = briefingdao.GetListCount();
			list = briefingdao.LoadBriefingList(pageno, pagerow);
			map.put("rows", rows);
			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetBriefingShowById(int BriefingId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = briefingdao.GetBriefingShowById(BriefingId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/*************** Start*******后台方法 ***********************/
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
				String path = "fileload/html/Briefing/";// 文件存在地方

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile htmlAttachment = multipartRequest
						.getFile("LinkAddress");

				String linkname = htmlAttachment.getOriginalFilename();

				BriefingDomain briefing = new BriefingDomain();
				briefing.setTitle(request.getParameter("Title") == null ? ""
						: request.getParameter("Title").trim());
				briefing.setSynopsis(request.getParameter("Synopsis") == null ? ""
						: request.getParameter("Synopsis").trim());
				briefing.setPublishDate(request.getParameter("PublishDate") == null ? ""
						: request.getParameter("PublishDate").trim());
				briefing.setCreateBy(request.getParameter("CreateBy") == null ? ""
						: request.getParameter("CreateBy").trim());
				briefing.setLinkAddress(linkname);

				int result = briefingdao.AddData(briefing,
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
				String strRealPath = this.getClass().getResource("/").getFile();
				strRealPath = URLDecoder.decode(strRealPath, "UTF-8")
						.substring(1);
				strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
				String path = "fileload/html/Briefing/";// 文件存在地方

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile htmlAttachment = multipartRequest
						.getFile("LinkAddress");
				String linkname = "";
				if (htmlAttachment != null) {
					linkname = htmlAttachment.getOriginalFilename();
				}

				BriefingDomain briefing = new BriefingDomain();
				briefing.setBriefingID(request.getParameter("BriefingID") == null ? 0
						: Integer.parseInt(request.getParameter("BriefingID")
								.trim()));
				briefing.setTitle(request.getParameter("Title") == null ? ""
						: request.getParameter("Title").trim());
				briefing.setSynopsis(request.getParameter("Synopsis") == null ? ""
						: request.getParameter("Synopsis").trim());
				briefing.setPublishDate(request.getParameter("PublishDate") == null ? ""
						: request.getParameter("PublishDate").trim());
				briefing.setCreateBy(request.getParameter("CreateBy") == null ? ""
						: request.getParameter("CreateBy").trim());
				briefing.setLinkAddress(linkname);

				int result = briefingdao.EditData(briefing,
						request.getParameter("UserID"));

				/*
				 * path = path +
				 * Integer.parseInt(request.getParameter("BriefingID")) + "/";
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

	public Map<String, Object> DelData(int BriefingID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = briefingdao.DelData(BriefingID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int BriefingID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = briefingdao.GetInfoByID(BriefingID);

			String linkname = row.get("LinkAddress").toString();
			linkname = linkname.substring(0, linkname.lastIndexOf("."));
			ImportFile upfile = new ImportFile();
			String dir = "fileload/html/Briefing/" + row.get("BriefingID")
					+ "/" + linkname + "/";
			List<String> picturesList = upfile.getFileNames(dir);

			map.put("BriefingID",
					row.get("BriefingID") == null
							|| "".equals(row.get("BriefingID").toString()) ? 0
							: Integer
									.parseInt(row.get("BriefingID").toString()));
			map.put("Title",
					row.get("Title") == null
							|| "".equals(row.get("Title").toString()) ? ""
							: row.get("Title").toString());
			map.put("CreateBy",
					row.get("CreateBy") == null
							|| "".equals(row.get("CreateBy").toString()) ? ""
							: row.get("CreateBy").toString());
			map.put("PublishDate",
					row.get("PublishDate") == null
							|| "".equals(row.get("PublishDate").toString()) ? ""
							: row.get("PublishDate").toString());
			map.put("LinkAddress",
					row.get("LinkAddress") == null
							|| "".equals(row.get("LinkAddress").toString()) ? ""
							: row.get("LinkAddress").toString());
			map.put("Synopsis",
					row.get("Synopsis") == null
							|| "".equals(row.get("Synopsis").toString()) ? ""
							: row.get("Synopsis").toString());

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
