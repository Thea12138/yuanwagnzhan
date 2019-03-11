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
import com.spring.springmvc.service.SoftwareWorksService;

@Controller
public class SoftwareWorksController extends BaseController {

	@Autowired
	SoftwareWorksService service;

	/**
	 * 获取软件著作列表 入参： pageno --当前页码 pagerow --每页显示数量 SoftwareWorksTitle --软著名称
	 * CopyrightOwner --著作权人 RegistrationNo --登记号 InstituteID --选择的研究所/部门的ID 出参：
	 * rows --总记录数 list {SoftwareWorksID, InstituteID,Seq,SoftwareWorksTitle,
	 * CopyrightOwner, RegistrationNo}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadSoftwareWorksList.do", method = RequestMethod.POST)
	public Map<String, Object> GetList(@RequestParam int pageno,
			@RequestParam int pagerow, @RequestParam String SoftwareWorksTitle,
			@RequestParam String CopyrightOwner,
			@RequestParam String RegistrationNo, @RequestParam int InstituteID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetList(pageno, pagerow, SoftwareWorksTitle,
					CopyrightOwner, RegistrationNo, InstituteID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 增加软件著作 form表单提交 参数： InstituteID -- 下拉框选择部门 SoftwareWorksTitle --软著名称
	 * CopyrightOwner --著作权人 RegistrationNo --登记号 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "AddSoftwareWorks.do", method = RequestMethod.POST)
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
	 * 修改软件著作 form表单提交 参数： SoftwareWorksID --奖励ID InstituteID -- 下拉框选择部门
	 * SoftwareWorksTitle --软著名称 CopyrightOwner --著作权人 RegistrationNo --登记号
	 * UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "EditSoftwareWorks.do", method = RequestMethod.POST)
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
	 * 删除软件著作 入参： SoftwareWorksID --奖励ID userid --当前登录人员ID 出参： exec_code
	 * fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "DelSoftwareWorks.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int SoftwareWorksID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelData(SoftwareWorksID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取软件著作信息 入参： SoftwareWorksID --奖励ID
	 **/
	@ResponseBody
	@RequestMapping(value = "GetSoftwareWorksByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int SoftwareWorksID)
			throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInfoByID(SoftwareWorksID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
