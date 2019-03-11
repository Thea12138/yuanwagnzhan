package com.spring.springmvc.controller;

import java.io.IOException;
import java.util.HashMap;
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
import com.spring.springmvc.service.TemplateService;

@Controller
public class TemplateController extends BaseController {

	@Autowired
	TemplateService service;

	/**
	 * 前端获取模版列表 入参： pageno --当前页码 pagerow --每页显示数量 TemplateTitle --模版名称 FileUrl
	 * --文件路径 Status --模版状态 Memo --描述 CreateDate --创建时间 CreateBy --创建人 出参： rows
	 * --总记录数 list {TemplateID
	 * ,TemplateTitle：模版名称,FileUrl：文件路径,Status：模版状态,Memo：
	 * 描述,CreateDate:创建时间,CreateBy：创建人}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadTemplateViewList.do", method = RequestMethod.POST)
	public Map<String, Object> GetViewList(@RequestParam int pageno,
			@RequestParam int pagerow) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetViewList(pageno, pagerow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取模版列表 入参： pageno --当前页码 pagerow --每页显示数量 TemplateTitle --模版名称 FileUrl
	 * --文件路径 Status --模版状态 Memo --描述 CreateDate --创建时间 CreateBy --创建人 出参： rows
	 * --总记录数 list {TemplateID
	 * ,TemplateTitle：模版名称,FileUrl：文件路径,Status：模版状态,Memo：
	 * 描述,CreateDate:创建时间,CreateBy：创建人}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadTemplateList.do", method = RequestMethod.POST)
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
	 * 增加模版 form表单提交 参数： InstituteID -- 下拉框选择部门 TemplateTitle --模版名称 FileUrl
	 * --文件路径 Status --模版状态 Memo --描述 CreateDate --创建时间 CreateBy --创建人 UserID
	 * --当前登录人员ID
	 **/
	@RequestMapping(value = "AddTemplate.do", method = RequestMethod.POST)
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
	 * 修改模版 form表单提交 参数： TemplateID --模版ID InstituteID -- 下拉框选择部门 TemplateTitle
	 * --模版名称 FileUrl --文件路径 Status --模版状态 Memo --描述 CreateDate --创建时间 CreateBy
	 * --创建人 UserID --当前登录人员ID 出参： exec_code fail_code: M01T001E001
	 * 模版已启用，不能修改;M01T001E002 模版已作废，不能修改
	 **/
	@RequestMapping(value = "EditTemplate.do", method = RequestMethod.POST)
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
	 * 删除模版 入参： TemplateID --模版ID userid --当前登录人员ID 出参： exec_code fail_code:
	 * M01T001E001 模版已启用，不能删除;M01T001E002 模版已作废，不能删除
	 **/
	@ResponseBody
	@RequestMapping(value = "DelTemplate.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int TemplateID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelData(TemplateID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 启用模版 入参： TemplateID --模版ID userid --当前登录人员ID 出参： exec_code fail_code:
	 * M01T001E001 模版已启用;M01T001E002 模版已作废
	 **/
	@ResponseBody
	@RequestMapping(value = "EnabledTemplate.do", method = RequestMethod.POST)
	public Map<String, Object> EnabledTemplate(@RequestParam int TemplateID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.EnabledTemplate(TemplateID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 作废模版 入参： TemplateID --模版ID userid --当前登录人员ID 出参： exec_code fail_code:
	 * M01T001E001 模版已启用;M01T001E002 模版已作废
	 **/
	@ResponseBody
	@RequestMapping(value = "InvalidTemplate.do", method = RequestMethod.POST)
	public Map<String, Object> InvalidTemplate(@RequestParam int TemplateID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.InvalidTemplate(TemplateID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取模版信息 入参： TemplateID --模版ID
	 **/
	@ResponseBody
	@RequestMapping(value = "GetTemplateByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int TemplateID) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInfoByID(TemplateID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 下载模版 入参： TemplateID --模版ID
	 **/
	@ResponseBody
	@RequestMapping(value = "DownTemplateByID.do", method = RequestMethod.POST)
	public Map<String, Object> DownTemplateByID(int TemplateID)
			throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DownTemplateByID(TemplateID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
