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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.core.BaseController;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.service.CareersService;

@Controller
public class CareersController extends BaseController {

	@Autowired
	CareersService service;

	private static final String zxns_frame_PAGE = "ZhaoXianNaShi/zxns_frame";
	private static final String zxns_content_PAGE = "ZhaoXianNaShi/zxns_content";

	@RequestMapping(value = "zxnsframe.do")
	public String zxns_frame(Model mo) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = service.GetRecruitmentRecommend();
		mo.addAttribute("list", list);
		return zxns_frame_PAGE;
	}

	@ResponseBody
	@RequestMapping(value = "RecruitmentAll.do")
	public List<Map<String, Object>> RecruitmentAll() {
		return service.RecruitmentAll();
	}

	@RequestMapping(value = "RecruitmentByID.do", method = RequestMethod.GET)
	public String zxns_content(Model mo, @RequestParam int RecruitmentID) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = service.GetRecruitmentById(RecruitmentID);
		mo.addAllAttributes(map);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list = service.GetRecruitmentRecommend();
		mo.addAttribute("list", list);
		return zxns_content_PAGE;
	}

	@ResponseBody
	@RequestMapping(value = "GetCareers.do", method = RequestMethod.POST)
	public Map<String, Object> GetCareers(@RequestParam int pageno,
			@RequestParam int pagerow) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = service.GetCareers(pageno, pagerow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping(value = "AddCareers.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AddCareers(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.AddCareers(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping(value = "EditCareers.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> EditCareers(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.EditCareers(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	@RequestMapping(value = "AddCareers1.do", method = RequestMethod.POST)
	@ResponseBody
	public String AddCareers1(HttpServletRequest request, String pageName) {

		try {
			service.AddCareers(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/Management.do?pagename=" + pageName;
	}

	@RequestMapping(value = "EditCareers1.do", method = RequestMethod.POST)
	@ResponseBody
	public String EditCareers1(HttpServletRequest request, String pageName) {

		try {
			service.EditCareers(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/Management.do?pagename=" + pageName;
	}

	@ResponseBody
	@RequestMapping(value = "DelCareers.do", method = RequestMethod.POST)
	public Map<String, Object> DelCareers(int RecruitmentID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelCareers(RecruitmentID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "GetCareersByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetCareersByID(int RecruitmentID)
			throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetCareersByID(RecruitmentID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/* start 后台方法 */
	/*
	 * 添加申请信息
	 * 
	 * @author CaoRC
	 * 
	 * @param apply
	 * 
	 * @return
	 * 
	 * @throws DAOException
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "Apply.do", method = RequestMethod.POST)
	public String add(HttpServletRequest rt) throws IOException, DAOException {
		service.add(rt);
		return "redirect:lxwm_zxns.do";
	}

	@RequestMapping(value = "AddApply.do", method = RequestMethod.POST)
	public String AddApply(HttpServletRequest rt, HttpServletResponse response,
			String pageName) throws IOException, DAOException {
		service.AddApply(rt);
		return "redirect:/Management.do?pagename=" + pageName;

	}

	@RequestMapping(value = "EditApply.do", method = RequestMethod.POST)
	public String EditApply(HttpServletRequest rt,
			HttpServletResponse response, String pageName) throws IOException,
			DAOException {
		service.EditApply(rt);
		return "redirect:/Management.do?pagename=" + pageName;

	}

	@ResponseBody
	@RequestMapping(value = "LoadApplication.do", method = RequestMethod.POST)
	public Map<String, Object> GetApplication(@RequestParam int pageno,
			@RequestParam int pagerow) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetApplication(pageno, pagerow);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@RequestMapping(value = "DownLoadApplication.do", method = RequestMethod.GET)
	@ResponseBody
	public int DownLoadApplication(HttpServletRequest rt,
			HttpServletResponse response,
			@RequestParam("ApplicationID") String ApplicationID)
			throws IOException, DAOException {
		int result = service.DownLoadApplication(rt, response, ApplicationID);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "GetApplicationByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetApplicationByID(int ApplicationID)
			throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetApplicationByID(ApplicationID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/* end 后台方法 */
}
