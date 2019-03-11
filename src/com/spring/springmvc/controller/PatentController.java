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
import com.spring.springmvc.service.PatentService;

@Controller
public class PatentController extends BaseController {

	@Autowired
	PatentService service;

	/**
	 * 获取专利成果列表 入参： pageno --当前页码 pagerow --每页显示数量 PatentTitle --专利名称 PatentType
	 * --专利类型 PatentRight --专利权人 PatentNo --专利号 出参： rows --总记录数 list {PatentID
	 * ,Seq,PatentTitle, PatentType, PatentRight, PatentNo}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadPatentList.do", method = RequestMethod.POST)
	public Map<String, Object> GetList(@RequestParam int pageno,
			@RequestParam int pagerow, @RequestParam String PatentTitle,
			@RequestParam String PatentType, @RequestParam String PatentRight,
			@RequestParam String PatentNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetList(pageno, pagerow, PatentTitle, PatentType,
					PatentRight, PatentNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 增加专利成果 form表单提交 参数： InstituteID -- 下拉框选择部门 PatentTitle --专利名称 PatentType
	 * --专利类型 PatentRight --专利权 PatentNo --专利号 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "AddPatent.do", method = RequestMethod.POST)
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
	 * 修改专利成果 form表单提交 参数： PatentID --奖励ID InstituteID -- 下拉框选择部门 PatentTitle
	 * --专利名称 PatentType --专利类型 PatentRight --专利权 PatentNo --专利号 UserID
	 * --当前登录人员ID
	 **/
	@RequestMapping(value = "EditPatent.do", method = RequestMethod.POST)
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
	 * 删除专利成果 入参： PatentID --奖励ID userid --当前登录人员ID 出参： exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "DelPatent.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int PatentID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelData(PatentID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取专利成果信息 入参： PatentID --奖励ID
	 **/
	@ResponseBody
	@RequestMapping(value = "GetPatentByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int PatentID) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInfoByID(PatentID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
