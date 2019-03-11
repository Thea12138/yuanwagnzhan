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
import com.spring.springmvc.service.AcademicWorksService;

@Controller
public class AcademicWorksController extends BaseController {

	@Autowired
	AcademicWorksService service;

	/**
	 * 获取学术著作列表 入参： pageno --当前页码 pagerow --每页显示数量 AcademicWorksTitle --名称
	 * AcademicWorksType --类型 Author --作者 PublishDate --发表（出版）时间 PublishPlace
	 * --刊物/出版社/会议名称 出参： rows --总记录数 list {AcademicWorksID
	 * ,Seq,AcademicWorksTitle, AcademicWorksType, Author, PublishDate,
	 * PublishPlace}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadAcademicWorksList.do", method = RequestMethod.POST)
	public Map<String, Object> GetList(@RequestParam int pageno,
			@RequestParam int pagerow, @RequestParam String AcademicWorksTitle,
			@RequestParam String AcademicWorksType,
			@RequestParam String Author, @RequestParam String PublishDate,
			@RequestParam String PublishPlace) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetList(pageno, pagerow, AcademicWorksTitle,
					AcademicWorksType, Author, PublishDate, PublishPlace);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 增加学术著作 form表单提交 参数： InstituteID -- 下拉框选择部门 AcademicWorksTitle --名称
	 * AcademicWorksType --类型 Author --作者 PublishDate --发表（出版）时间 PublishPlace
	 * --刊物/出版社/会议名称 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "AddAcademicWorks.do", method = RequestMethod.POST)
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
	 * 修改学术著作 form表单提交 参数： AcademicWorksID --ID InstituteID -- 下拉框选择部门
	 * AcademicWorksTitle --名称 AcademicWorksType --类型 Author --作者 PublishDate
	 * --发表（出版）时间 PublishPlace --刊物/出版社/会议名称 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "EditAcademicWorks.do", method = RequestMethod.POST)
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
	 * 删除学术著作 入参： AcademicWorksID --奖励ID userid --当前登录人员ID 出参： exec_code
	 * fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "DelAcademicWorks.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int AcademicWorksID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelData(AcademicWorksID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取学术著作信息 入参： AcademicWorksID --奖励ID
	 **/
	@ResponseBody
	@RequestMapping(value = "GetAcademicWorksByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int AcademicWorksID)
			throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInfoByID(AcademicWorksID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
