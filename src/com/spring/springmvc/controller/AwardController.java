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
import com.spring.springmvc.service.AwardService;

@Controller
public class AwardController extends BaseController {

	@Autowired
	AwardService service;

	/**
	 * 获取科研奖励列表 入参： pageno --当前页码 pagerow --每页显示数量 AwardTitle --奖励名称 GrantUnit
	 * --授予单位 GetTime --获得时间 Winners --获奖人员 出参： rows --总记录数 list {AwardID
	 * ,Seq：序号,AwardTitle：奖励名称,GrantUnit：授予单位,GetTime：获得时间,Winners：获奖人员}
	 * exec_code：exec_code=1表示执行成功，exec_code!=1表示执行失败
	 * fail_code：fail_code=-1表示没有异常，fail_code!=-1表示有异常
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadAwardList.do", method = RequestMethod.POST)
	public Map<String, Object> GetList(@RequestParam int pageno,
			@RequestParam int pagerow, @RequestParam String AwardTitle,
			@RequestParam String GrantUnit, @RequestParam String GetTime,
			@RequestParam String Winners) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetList(pageno, pagerow, AwardTitle, GrantUnit,
					GetTime, Winners);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 增加科研奖励 form表单提交 参数： InstituteID -- 下拉框选择部门 AwardTitle --奖励名称 GrantUnit
	 * --授予单位 GetTime --获得时间 Winners --获奖人员 UserID --当前登录人员ID 出参： exec_code
	 * fail_code
	 **/
	@RequestMapping(value = "AddAward.do", method = RequestMethod.POST)
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
	 * 修改科研奖励 form表单提交 参数： AwardID --奖励ID InstituteID -- 下拉框选择部门 AwardTitle
	 * --奖励名称 GrantUnit --授予单位 GetTime --获得时间 Winners --获奖人员 UserID --当前登录人员ID
	 * 出参： exec_code fail_code
	 **/
	@RequestMapping(value = "EditAward.do", method = RequestMethod.POST)
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
	 * 删除科研奖励 入参： AwardID --奖励ID userid --当前登录人员ID 出参： exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "DelAward.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int AwardID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelData(AwardID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取科研奖励信息 入参： AwardID --奖励ID 出参： exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "GetAwardByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int AwardID) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInfoByID(AwardID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
