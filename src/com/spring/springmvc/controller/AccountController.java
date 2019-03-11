package com.spring.springmvc.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.core.BaseController;
import com.spring.spring.exception.interfaces.AlertExceptionable;
import com.spring.spring.exception.interfaces.DAOExceptionable;
import com.spring.spring.exception.interfaces.MessageExceptionable;
import com.spring.spring.exception.realize.ControllerException;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.AccountDomain;
import com.spring.springmvc.service.AccountService;
import com.spring.util.UtilCookie;

@Controller
public class AccountController extends BaseController {

	@Autowired
	AccountService service;

	/**
	 * 检查账号密码 form表单提交 参数： AccountNo --账号 Password --密码 出参： AccountID --账号ID
	 * exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "CheckAccount.do", method = RequestMethod.POST)
	public Map<String, Object> CheckAccount(AccountDomain account,
			HttpSession hs, HttpServletRequest rt, HttpServletResponse re)
			throws DAOException, ControllerException {
		Map<String, Object> map = new HashMap<String, Object>();

		try {

			map = service.CheckAccount(account.getAccountNo(),
					account.getPassword());
		} catch (Exception e) {
			if (e instanceof DAOExceptionable) {
			} else
				throw new ControllerException("系统执行Service期间发生不明异常", e);
		}
		return map;
	}

	@RequestMapping(value = "AccountLogin.do", method = RequestMethod.POST)
	public String LoginIn(AccountDomain account, HttpSession hs,
			HttpServletRequest rt, HttpServletResponse re) {
		try {

			String Rememb = rt.getParameter("Rememb") == null ? "0" : rt
					.getParameter("Rememb");
			if (Rememb.equals("on")) {
				Cookie ck1 = UtilCookie.createCookie("AccountNo",
						account.getAccountNo(), 72000000);
				Cookie ck2 = UtilCookie.createCookie("Password",
						account.getPassword(), 72000000);
				re.addCookie(ck1);
				re.addCookie(ck2);
			} else {
				Cookie[] cookies = rt.getCookies();
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("AccountNo")
							|| cookie.getName().equals("Password")) {
						String cookieName = cookie.getName();
						Cookie newCookie = new Cookie(cookieName, null);
						newCookie.setMaxAge(0);
						newCookie.setPath("/");
						re.addCookie(newCookie);
					}
				}
			}

			hs.setAttribute("AccountDomain", account);
			return "redirect:Management.do";

		} catch (Exception e) {
			if (e instanceof AlertExceptionable) {
				// 返回原页面，并提示
			} else if (e instanceof MessageExceptionable) {
			}
		}
		return null;
	}

	@RequestMapping(value = "changePassword.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changePassword(String AccountNo,
			String OldPassword, String NewPassword) throws DAOException,
			ControllerException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {

			map = service.changePassword(AccountNo, OldPassword, NewPassword);
		} catch (Exception e) {
			if (e instanceof DAOExceptionable) {
			} else
				throw new ControllerException("系统执行Service期间发生不明异常", e);
		}
		return map;
	}

	@RequestMapping(value = "AccountLogout.do")
	public void userLogout(HttpServletRequest rt) throws DAOException {

		try {

			HttpSession httpsession = rt.getSession();
			httpsession.invalidate();

		} catch (Exception e) {
			throw new DAOException(e);
		}
	}

	/**
	 * 获取账号列表 入参： pageno --当前页码 pagerow --每页显示数量 出参： rows --总记录数 list
	 * {AccountID,
	 * AccountNo：账号,Password：密码,Memo：备注,GetTime：IsSystem：1表示系统账号，0表示非系统账号}
	 * exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadAccountList.do", method = RequestMethod.POST)
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
	 * 增加账号 form表单提交 参数： AccountNo：账号 Password：密码 Memo：备注
	 * IsSystem：1表示系统账号，0表示非系统账号 出参： exec_code fail_code
	 **/
	@RequestMapping(value = "AddAccount.do", method = RequestMethod.POST)
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
	 * 修改账号 form表单提交 参数： AccountNo：账号 Password：密码 Memo：备注
	 * IsSystem：1表示系统账号，0表示非系统账号 出参： exec_code fail_code
	 **/
	@RequestMapping(value = "EditAccount.do", method = RequestMethod.POST)
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
	 * 删除账号 入参： AccountID --账号ID userid --当前登录人员ID 出参： exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "DelAccount.do", method = RequestMethod.POST)
	public Map<String, Object> DelData(@RequestParam int AccountID,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.DelData(AccountID, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取账号信息 入参： AccountID --账号ID 出参： exec_code fail_code
	 **/
	@ResponseBody
	@RequestMapping(value = "GetAccountByID.do", method = RequestMethod.POST)
	public Map<String, Object> GetInfoByID(int AccountID) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInfoByID(AccountID);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取研究所/部门 出参： list{InstituteID,InstituteName}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadInstitute.do", method = RequestMethod.POST)
	public Map<String, Object> GetInstitute() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.GetInstitute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
