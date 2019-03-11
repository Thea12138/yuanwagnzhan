package com.spring.springmvc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.core.BaseController;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.service.BriefingService;

@Controller
public class BriefingController extends BaseController {

	@Autowired
	BriefingService briefingservice;

	/**
	 * 获取院务行业情报简报列表 入参： pageno --当前页码 pagerow --每页显示数量 出参： rows --总记录数 list
	 * {BriefingID,BriefingTitle：标题,Synopsis：简介,LinkAddress：内容页,
	 * PublishDate：发布日期,CreateBy：创建人}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadBriefingList.do", method = RequestMethod.POST)
	public Map<String, Object> LoadBriefingList(@RequestParam int pageno,
			@RequestParam int pagerow) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = briefingservice.LoadBriefingList(pageno, pagerow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/** XXXXXXXX 要替换成院务行业情报简报前端展示html页面的名称 ***/
	private static final String page_show_PAGE = "XinWenDongTai/xwdt_hyqbjb_show";

	/**
	 * 获取行业情报简报内容html 入参： BriefingID
	 **/
	@RequestMapping(value = "BriefingShow.do", method = RequestMethod.GET)
	public String page_show_PAGE(Model mo, @RequestParam int BriefingID) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = briefingservice.GetBriefingShowById(BriefingID);
		mo.addAllAttributes(map);
		return page_show_PAGE;
	}

	/*************** Start*******后台方法 ***********************/

	/**
	 * 增加行业情报简报 form表单提交 参数： Title --标题 BriefingCategory --类型 LinkAddress --内容页
	 * Synopsis --简介 PublishDate --发布日期 CreateBy --创建人 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "AddBriefing.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AddData(HttpServletRequest request,
			HttpServletResponse response) throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = briefingservice.AddData(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;

	}

	/**
	 * 修改行业情报简报 form表单提交 参数： BriefingID Title --标题 LinkAddress --内容页 Synopsis
	 * --简介 PublishDate --发布日期 CreateBy --创建人 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "EditBriefing.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> EditData(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = briefingservice.EditData(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 删除行业情报简报 入参： briefingid --ID userid --当前登录人员ID
	 **/
	@ResponseBody
	@RequestMapping(value = "DelBriefing.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int briefingid,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = briefingservice.DelData(briefingid, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取行业情报简报信息 入参： BriefingID --ID
	 **/
	@RequestMapping(value = "GetBriefingByID.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> GetInfoByID(int BriefingID) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = briefingservice.GetInfoByID(BriefingID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/*************** end*******后台方法 ***********************/
}
