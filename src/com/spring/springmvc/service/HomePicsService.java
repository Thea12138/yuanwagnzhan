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
import com.spring.springmvc.dao.HomePicsDao;
import com.spring.springmvc.domain.HomePicsDomain;
import com.spring.util.ConstantUtil;
import com.spring.util.ImportFile;

@Service
public class HomePicsService extends BaseService {

	@Autowired
	HomePicsDao dao;

	public Map<String, Object> GetHomeList() {
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> list1 = dao.GetHomeList("1");// 1.领导视察
			List<Map<String, Object>> list2 = dao.GetHomeList("2");// 2.重点项目
			List<Map<String, Object>> list3 = dao.GetHomeList("3");// 3.产品方案
			map.put("rows", rows);
			map.put("list1", list1);
			map.put("list2", list2);
			map.put("list3", list3);
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
				String path = "fileload/HomePics/";// 图片存在地方

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

				String picName = "";
				MultipartFile thumbPicture = multipartRequest.getFile("PicUrl");
				if (!thumbPicture.getOriginalFilename().equals("")) {
					picName = thumbPicture.getOriginalFilename();
				}

				HomePicsDomain domain = new HomePicsDomain();

				domain.setDisplayType(request.getParameter("DisplayType") == null ? ""
						: request.getParameter("DisplayType").trim());
				domain.setTitle(request.getParameter("Title") == null ? ""
						: request.getParameter("Title").trim());
				domain.setPicUrl(picName);
				domain.setMemo(request.getParameter("Memo") == null ? ""
						: request.getParameter("Memo").trim());
				domain.setEndShowTime(request.getParameter("EndShowTime") == null ? ""
						: request.getParameter("EndShowTime").trim());
				domain.setCreateDate(request.getParameter("CreateDate") == null ? ""
						: request.getParameter("CreateDate").trim());
				domain.setCreateBy(request.getParameter("CreateBy") == null ? ""
						: request.getParameter("CreateBy").trim());

				int result = dao
						.AddData(domain, request.getParameter("UserID"));

				if (thumbPicture != null) {
					ImportFile upfile = new ImportFile();
					upfile.deleteDirectory(path);
					upfile.addHomePic(thumbPicture, path, result);// 上传首页图片
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
				String path = "fileload/HomePics/";// 图片存在地方

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

				String picName = "";
				MultipartFile thumbPicture = multipartRequest.getFile("PicUrl");
				if (thumbPicture != null) {
					if (!thumbPicture.getOriginalFilename().equals("")) {
						picName = thumbPicture.getOriginalFilename();
					}
				}

				HomePicsDomain domain = new HomePicsDomain();

				domain.setHomePicsID(Integer.parseInt(request
						.getParameter("HomePicsID")));
				domain.setDisplayType(request.getParameter("DisplayType") == null ? ""
						: request.getParameter("DisplayType").trim());
				domain.setTitle(request.getParameter("Title") == null ? ""
						: request.getParameter("Title").trim());
				domain.setPicUrl(picName);
				domain.setMemo(request.getParameter("Memo") == null ? ""
						: request.getParameter("Memo").trim());
				domain.setEndShowTime(request.getParameter("EndShowTime") == null ? ""
						: request.getParameter("EndShowTime").trim());
				domain.setCreateDate(request.getParameter("CreateDate") == null ? ""
						: request.getParameter("CreateDate").trim());
				domain.setCreateBy(request.getParameter("CreateBy") == null ? ""
						: request.getParameter("CreateBy").trim());

				int result = dao.EditData(domain,
						request.getParameter("UserID"));

				if (thumbPicture != null) {
					ImportFile upfile = new ImportFile();
					upfile.deleteDirectory(path);
					upfile.addHomePic(thumbPicture, path, Integer
							.parseInt(request.getParameter("HomePicsID")));// 上传首页图片
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

	public Map<String, Object> DelData(int HomePicsID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = dao.DelData(HomePicsID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int HomePicsID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetInfoByID(HomePicsID);
			map.put("HomePicsID",
					row.get("HomePicsID") == null
							|| "".equals(row.get("HomePicsID").toString()) ? 0
							: Integer
									.parseInt(row.get("HomePicsID").toString()));
			map.put("DisplayType",
					row.get("DisplayType") == null
							|| "".equals(row.get("DisplayType").toString()) ? ""
							: row.get("DisplayType").toString());
			map.put("Title",
					row.get("Title") == null
							|| "".equals(row.get("Title").toString()) ? ""
							: row.get("Title").toString());
			map.put("PicUrl",
					row.get("PicUrl") == null
							|| "".equals(row.get("PicUrl").toString()) ? ""
							: row.get("PicUrl").toString());
			map.put("Memo",
					row.get("Memo") == null
							|| "".equals(row.get("Memo").toString()) ? "" : row
							.get("Memo").toString());
			map.put("EndShowTime",
					row.get("EndShowTime") == null
							|| "".equals(row.get("EndShowTime").toString()) ? ""
							: row.get("EndShowTime").toString());
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

}
