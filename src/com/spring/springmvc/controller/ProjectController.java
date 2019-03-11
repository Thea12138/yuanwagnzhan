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
import com.spring.springmvc.service.ProjectService;

@Controller
public class ProjectController extends BaseController {

	@Autowired
	ProjectService Projectservice;

	/**
	 * 获取院务重点项目列表 入参： pageno --当前页码 pagerow --每页显示数量 ProjectCategory --重点项目分类：
	 * 出参： rows --总记录数 list
	 * {ProjectID,InstituteID,ProjectCategory,ProjectTitle：标题,LinkAddress：内容页,
	 * PublicDate：创建日期}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadProjectList.do", method = RequestMethod.POST)
	public Map<String, Object> LoadProjectList(@RequestParam int pageno,
			@RequestParam int pagerow, @RequestParam String ProjectCategory) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = Projectservice.GetList(pageno, pagerow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/** XXXXXXXX 要替换成院务重点项目前端展示html页面的名称 ***/
	private static final String page_show_PAGE = "KeYanHuoDong/kyhd_zdxm_show";

	/**
	 * 获取重点项目内容html 入参： ProjectID
	 **/
	@RequestMapping(value = "ProjectShow.do", method = RequestMethod.GET)
	public String page_show_PAGE(Model mo, @RequestParam int ProjectID) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = Projectservice.GetProjectShowById(ProjectID);
		mo.addAllAttributes(map);
		return page_show_PAGE;
	}

	/*************** Start*******后台方法 ***********************/

	/**
	 * 增加重点项目 form表单提交 参数： ProjectID InstituteID --选择部门ID ProjectTitle --标题
	 * ProjectCategory --类型 LinkAddress --内容页 picturesList --图片 PublicDate
	 * --创建日期 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "AddProject.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AddProject(HttpServletRequest request,
			HttpServletResponse response) throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = Projectservice.AddProject(request, "1");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;

	}

	/**
	 * 修改重点项目 form表单提交 参数： ProjectID InstituteID --选择部门ID ProjectTitle --标题
	 * ProjectCategory --类型 LinkAddress --内容页 picturesList --图片 PublicDate
	 * --创建日期 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "EditProject.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> EditProject(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = Projectservice.EditProject(request, "1");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 删除重点项目 入参： Projectid --ID userid --当前登录人员ID
	 **/
	@ResponseBody
	@RequestMapping(value = "DelProject.do", method = RequestMethod.POST)
	public Map<String, Object> DelProject(@RequestParam int Projectid,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = Projectservice.DelProject(Projectid, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取重点项目信息 入参： Projectid --ID
	 **/
	@ResponseBody
	@RequestMapping(value = "GetProjectByProjectID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int Projectid) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = Projectservice.GetInfoByID(Projectid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/*************** end*******后台方法 ***********************/
}
