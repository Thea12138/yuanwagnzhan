package com.spring.springmvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.core.BaseService;
import com.spring.spring.exception.realize.AlertException;
import com.spring.spring.exception.realize.DAOException;
import com.spring.spring.exception.realize.MessageException;
import com.spring.spring.exception.realize.ServiceException;
import com.spring.springmvc.dao.AccountDao;
import com.spring.springmvc.domain.AccountDomain;
import com.spring.util.ConstantUtil;

@Service
public class AccountService extends BaseService {

	@Autowired
	AccountDao dao;

	public Map<String, Object> CheckAccount(String AccountNo, String Password) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.CheckAccount(AccountNo, Password);
			if (row != null && row.size() > 0) {
				map.put("AccountID",
						row.get("AccountID") == null
								|| "".equals(row.get("AccountID").toString()) ? 0
								: Integer.parseInt(row.get("AccountID")
										.toString()));
				map.put("exec_code", 1);
				map.put("fail_code", -1);
			} else {
				map.put("AccountID", 0);
				map.put("exec_code", 0);
				map.put("fail_code", 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> changePassword(String AccountNo,
			String OldPassword, String NewPassword) throws DAOException,
			AlertException, MessageException, ServiceException {

		HashMap<String, Object> map = new HashMap<String, Object>();

		try {
			if (dao.ChangePwd(AccountNo, OldPassword, NewPassword) == 0) {
				map.put("State", ConstantUtil.EXEC_FAIL);
				map.put("FailCode", ConstantUtil.User_Old_Error);
				return map;
			}
			map.put("State", ConstantUtil.EXEC_SUCCESS);
			map.put("FailCode", ConstantUtil.FAILCODE_SUCCESS);
			return map;
		} catch (Exception e) {
			map.put("State", ConstantUtil.EXEC_FAIL);
			map.put("FailCode", ConstantUtil.DB_FAIL);
		}
		return map;
	}

	public Map<String, Object> GetList(int pageno, int pagerow) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = dao.GetListCount();
			list = dao.GetList(pageno, pagerow);
			map.put("rows", rows);
			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> AddData(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				AccountDomain domain = new AccountDomain();

				domain.setAccountNo(request.getParameter("AccountNo") == null ? ""
						: request.getParameter("AccountNo").trim());
				domain.setPassword(request.getParameter("Password") == null ? ""
						: request.getParameter("Password").trim());
				domain.setMemo(request.getParameter("Memo") == null ? ""
						: request.getParameter("Memo").trim());
				domain.setIsSystem(request.getParameter("IsSystem") == null ? ""
						: request.getParameter("IsSystem").trim());

				int result = dao
						.AddData(domain, request.getParameter("UserID"));

				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> EditData(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				AccountDomain domain = new AccountDomain();

				domain.setAccountID(Integer.parseInt(request
						.getParameter("AccountID")));
				domain.setAccountNo(request.getParameter("AccountNo") == null ? ""
						: request.getParameter("AccountNo").trim());
				domain.setPassword(request.getParameter("Password") == null ? ""
						: request.getParameter("Password").trim());
				domain.setMemo(request.getParameter("Memo") == null ? ""
						: request.getParameter("Memo").trim());
				domain.setIsSystem(request.getParameter("IsSystem") == null ? ""
						: request.getParameter("IsSystem").trim());

				int result = dao.EditData(domain,
						request.getParameter("UserID"));

				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> DelData(int AccountID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = dao.DelData(AccountID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int AccountID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = dao.GetInfoByID(AccountID);
			map.put("AccountID",
					row.get("AccountID") == null
							|| "".equals(row.get("AccountID").toString()) ? 0
							: Integer.parseInt(row.get("AccountID").toString()));
			map.put("AccountNo",
					row.get("AccountNo") == null
							|| "".equals(row.get("AccountNo").toString()) ? ""
							: row.get("AccountNo").toString());
			map.put("Password",
					row.get("Password") == null
							|| "".equals(row.get("Password").toString()) ? ""
							: row.get("Password").toString());
			map.put("Memo",
					row.get("Memo") == null
							|| "".equals(row.get("Memo").toString()) ? "" : row
							.get("Memo").toString());
			map.put("IsSystem",
					row.get("IsSystem") == null
							|| "".equals(row.get("IsSystem").toString()) ? ""
							: row.get("IsSystem").toString());

			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInstitute() {
		List<Map<String, Object>> list = null;

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			list = dao.GetInstitute();
			map.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
