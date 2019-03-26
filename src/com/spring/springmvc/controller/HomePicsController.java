package com.spring.springmvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.core.BaseController;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.service.HomePicsService;

@Controller
public class HomePicsController extends BaseController {

	@Autowired
	HomePicsService service;

	/**
	 * 首页展示：获取首页轮播大图 出参： list1 {HomePicsID,Title：名称,PicUrl：图片,Memo：描述} //领导视察
	 * list2 {HomePicsID,Title：名称,PicUrl：图片,Memo：描述} //重点项目 list3
	 * {HomePicsID,Title：名称,PicUrl：图片,Memo：描述} //产品方案
	 * exec_code：exec_code=1表示执行成功，exec_code!=1表示执行失败
	 * fail_code：fail_code=-1表示没有异常，fail_code!=-1表示有异常
	 **/
	//主页轮播图接口
	@ResponseBody
	@RequestMapping(value = "GetHomeList.do", method = RequestMethod.POST)
	public Map<String, Object> GetHomeList() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetHomeList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 后台维护列表：获取首页轮播大图列表 入参： pageno --当前页码 pagerow --每页显示数量 出参： rows --总记录数 list
	 * {HomePicsID ,DisplayType：分类（1.领导视察、2.重点项目、3.产品方案）,
	 * Title：名称,PicUrl：图片,Memo：描述,EndShowTime：展示截止日期
	 * CreateDate：创建日期,CreateBy：创建人}
	 * exec_code：exec_code=1表示执行成功，exec_code!=1表示执行失败
	 * fail_code：fail_code=-1表示没有异常，fail_code!=-1表示有异常
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadHomePicsList.do", method = RequestMethod.POST)
	public Map<String, Object> GetList(@RequestParam int pageno,
			@RequestParam int pagerow) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetList(pageno, pagerow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 增加首页轮播大图 form表单提交 参数： DisplayType --分类：1.领导视察、2.重点项目、3.产品方案 Title --名称
	 * PicUrl --图片 Memo --描述 EndShowTime --展示截止日期 CreateDate --创建日期 CreateBy
	 * --创建人 UserID --当前登录人员ID 出参： exec_code fail_code
	 **/
	@RequestMapping(value = "AddHomePics.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AddData(HttpServletRequest request,
			HttpServletResponse response) throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.AddData(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;

	}

	/**
	 * 修改首页轮播大图 form表单提交 参数： HomePicsID --ID DisplayType
	 * --分类：1.领导视察、2.重点项目、3.产品方案 Title --名称 PicUrl --图片 Memo --描述 EndShowTime
	 * --展示截止日期 CreateDate --创建日期 CreateBy --创建人 UserID --当前登录人员ID 出参： exec_code
	 * fail_code
	 **/
	@RequestMapping(value = "EditHomePics.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> EditData(HttpServletRequest request,
			HttpServletResponse response) throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.EditData(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;

	}

	/**
	 * 删除首页轮播大图 入参： HomePicsID --ID userid --当前登录人员ID 出参： exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "DelHomePics.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int HomePicsID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelData(HomePicsID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取首页轮播大图信息 入参： HomePicsID --ID 出参： exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "GetHomePicsByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int HomePicsID) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInfoByID(HomePicsID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	//新版院网站轮播图接口
	@RequestMapping("listHomePicture.do")
	@ResponseBody
	List listHomePicture() throws DAOException {
		List result = new ArrayList();

		return service.listHomePicture();
	}

}
