package com.spring.springmvc.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.spring.core.BaseDao;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.AccountDomain;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class AccountDao extends BaseDao {

	@Autowired
	LogDao dao;

	public Map<String, Object> CheckAccount(String AccountNo, String Password)
			throws DAOException {
		String sql = "select AccountID from  QAII_Account where AccountNo=:AccountNo and Password=:Password and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params)
				.addValue("AccountNo", AccountNo.trim());
		((MapSqlParameterSource) params).addValue("Password", Password.trim());

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int ChangePwd(String AccountNo, String OldPassword,
			String NewPassword) throws DAOException {

		try {

			String strSql = "";
			strSql = "update QAII_Account set Password=:NewPassword";
			strSql = strSql
					+ " where AccountNo = ( select AccountNo  from (select AccountNo  from  QAII_Account where AccountNo=:AccountNo and Password=:OldPassword) as ac ) ";
			MapSqlParameterSource params = new MapSqlParameterSource();
			params.addValue("AccountNo", AccountNo);
			params.addValue("NewPassword", NewPassword);
			params.addValue("OldPassword", OldPassword);
			return ExecParamSql(strSql.toString(), params);

		} catch (Exception e) {
			e.printStackTrace();
			throw new DAOException(e);
		}
	}

	public int GetListCount() {
		String sql = "select count(*) from QAII_Account where IsActive='1' ";

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetList(int pageno, int pagerow) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount();
		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "select  AccountNo,Password,Memo,IsSystem from QAII_Account where IsActive='1' and AccountID not in "
					+ "( select t.AccountID from (select AccountID from QAII_Account where IsActive='1' order by AccountID desc limit 0,"
					+ start
					+ ") as t) order by AccountID desc limit 0,"
					+ pagerow + ";";
		} else {
			sql = "select  AccountNo,Password,Memo,IsSystem from QAII_Account where IsActive='1' order by AccountID desc limit 0,"
					+ pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetInfoByID(int AccountID) {
		String sql = "select AccountNo,Password,Memo,IsSystem from QAII_Account where AccountID= :AccountID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AccountID", AccountID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	public int AddData(AccountDomain domain, String userid) {

		String sql = " insert into  QAII_Account(AccountNo,Password,Memo,IsSystem,IsActive) "
				+ " values (:AccountNo,:Password,:Memo,:IsSystem,'1');";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AccountNo",
				domain.getAccountNo());
		((MapSqlParameterSource) params).addValue("Password",
				domain.getPassword());
		((MapSqlParameterSource) params).addValue("Memo", domain.getMemo());
		((MapSqlParameterSource) params).addValue("IsSystem",
				domain.getIsSystem());

		try {
			// 执行insert
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(AccountID) as MaxID from QAII_Account ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("用户管理");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("QAII_Account");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(AccountDomain domain, String userid) {

		String sql = " update QAII_Account set AccountNo=:AccountNo,Password=:Password,Memo=:Memo,IsSystem=:IsSystem "
				+ " where AccountID=:AccountID and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AccountID",
				domain.getAccountID());
		((MapSqlParameterSource) params).addValue("AccountNo",
				domain.getAccountNo());
		((MapSqlParameterSource) params).addValue("Password",
				domain.getPassword());
		((MapSqlParameterSource) params).addValue("Memo", domain.getMemo());
		((MapSqlParameterSource) params).addValue("IsSystem",
				domain.getIsSystem());

		try {
			// 执行insert
			int result = ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("用户管理");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("QAII_Account");
			log.setDataID(String.valueOf(domain.getAccountID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int AccountID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update QAII_Account  set IsActive='0' ");
		sqlstr.append("  where AccountID=:AccountID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AccountID", AccountID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("用户管理");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("QAII_Account");
			log.setDataID(String.valueOf(AccountID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			// Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Map<String, Object>> GetInstitute() {

		List<Map<String, Object>> list = null;
		String sql = "select * from QAII_Institute where IsActive='1' ";

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}
}
