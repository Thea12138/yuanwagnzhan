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
import com.spring.springmvc.domain.TemplateDomain;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class TemplateDao extends BaseDao {

	@Autowired
	LogDao dao;

	public int GetListCount() {

		String str = " where IsActive='1' ";

		String sql = "select count(*) from QAII_Template " + str;

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public int GetListCount(String Status) {

		String str = " where IsActive='1' and Status='" + Status + "' ";

		String sql = "select count(*) from QAII_Template " + str;

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetViewList(int pageno, int pagerow) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount("2");

		String str = " where IsActive='1' and Status='2' ";

		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "select TemplateID,TemplateTitle,"
					+ "CONCAT('fileload/Template/',TemplateID,'/',FileUrl) as FileUrl"
					+ ",Status,Memo,CreateDate,CreateBy from QAII_Template "
					+ str
					+ " and TemplateID not in "
					+ "( select t.TemplateID from (select TemplateID from QAII_Template "
					+ str + " order by TemplateTitle limit 0," + start
					+ ") as t) order by TemplateTitle limit 0," + pagerow + ";";
		} else {
			sql = "select TemplateID,TemplateTitle,"
					+ "CONCAT('fileload/Template/',TemplateID,'/',FileUrl) as FileUrl"
					+ ",Status,Memo,CreateDate,CreateBy from QAII_Template "
					+ str + " order by TemplateTitle limit 0," + pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Map<String, Object>> GetList(int pageno, int pagerow) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount();

		String str = " where IsActive='1' ";

		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "select TemplateID,TemplateTitle,"
					+ "CONCAT('fileload/Template/',TemplateID,'/',FileUrl) as FileUrl"
					+ ",Status,Memo,CreateDate,CreateBy from QAII_Template "
					+ str
					+ " and TemplateID not in "
					+ "( select t.TemplateID from (select TemplateID from QAII_Template "
					+ str + " order by CreateDate desc limit 0," + start
					+ ") as t) order by CreateDate desc limit 0," + pagerow
					+ ";";
		} else {
			sql = "select TemplateID,TemplateTitle,"
					+ "CONCAT('fileload/Template/',TemplateID,'/',FileUrl) as FileUrl"
					+ ",Status,Memo,CreateDate,CreateBy from QAII_Template "
					+ str + " order by CreateDate desc limit 0," + pagerow
					+ ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetInfoByID(int TemplateID) {
		String sql = "select TemplateID,TemplateTitle,"
				+ "CONCAT('fileload/Template/',TemplateID,'/',FileUrl) as FileUrl"
				+ ",Status,Memo,CreateDate,CreateBy "
				+ "from QAII_Template where TemplateID= :TemplateID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("TemplateID", TemplateID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> DownTemplateByID(int TemplateID) {
		String sql = "select TemplateID,"
				+ "CONCAT('fileload/Template/',TemplateID,'/',FileUrl) as FileUrl "
				+ " from QAII_Template where TemplateID= :TemplateID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("TemplateID", TemplateID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int AddData(TemplateDomain domain, String userid) {

		String sql = " insert into  QAII_Template(TemplateTitle,FileUrl,Status,Memo,CreateDate,CreateBy,IsActive) "
				+ " values (:TemplateTitle,:FileUrl,:Status,:Memo,:CreateDate,:CreateBy,'1');";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("TemplateTitle",
				domain.getTemplateTitle());
		((MapSqlParameterSource) params).addValue("FileUrl",
				domain.getFileUrl());
		((MapSqlParameterSource) params).addValue("Status", "1");
		((MapSqlParameterSource) params).addValue("Memo", domain.getMemo());
		((MapSqlParameterSource) params).addValue("CreateDate",
				domain.getCreateDate());
		((MapSqlParameterSource) params).addValue("CreateBy",
				domain.getCreateBy());

		try {
			// 执行insert
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(TemplateID) as MaxID from QAII_Template ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("模版下载");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("QAII_Template");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(TemplateDomain domain, String userid) {
		String sql = "";
		SqlParameterSource params = new MapSqlParameterSource();
		if (domain.getFileUrl() == "") {
			sql = " update QAII_Template set TemplateTitle=:TemplateTitle,"
					+ "Memo=:Memo,CreateDate=:CreateDate,CreateBy=:CreateBy "
					+ " where TemplateID=:TemplateID and IsActive='1' ";
		} else {
			sql = " update QAII_Template set TemplateTitle=:TemplateTitle,"
					+ "FileUrl=:FileUrl,Memo=:Memo,CreateDate=:CreateDate,CreateBy=:CreateBy "
					+ " where TemplateID=:TemplateID and IsActive='1' ";
			((MapSqlParameterSource) params).addValue("FileUrl",
					domain.getFileUrl());
		}
		((MapSqlParameterSource) params).addValue("TemplateID",
				domain.getTemplateID());
		((MapSqlParameterSource) params).addValue("TemplateTitle",
				domain.getTemplateTitle());
		((MapSqlParameterSource) params).addValue("Memo", domain.getMemo());
		((MapSqlParameterSource) params).addValue("CreateDate",
				domain.getCreateDate());
		((MapSqlParameterSource) params).addValue("CreateBy",
				domain.getCreateBy());

		try {
			// 执行insert
			int result = ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("模版下载");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("QAII_Template");
			log.setDataID(String.valueOf(domain.getTemplateID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int TemplateID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update QAII_Template set IsActive='0' ");
		sqlstr.append("  where TemplateID=:TemplateID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("TemplateID", TemplateID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("模版下载");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("QAII_Template");
			log.setDataID(String.valueOf(TemplateID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EnabledTemplate(int TemplateID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update QAII_Template set Status='2' ");
		sqlstr.append("  where TemplateID=:TemplateID and IsActive='1' ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("TemplateID", TemplateID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("模版下载");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("启用");
			log.setTableName("QAII_Template");
			log.setDataID(String.valueOf(TemplateID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int InvalidTemplate(int TemplateID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update QAII_Template set Status='3' ");
		sqlstr.append("  where TemplateID=:TemplateID and IsActive='1' ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("TemplateID", TemplateID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("模版下载");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("作废");
			log.setTableName("QAII_Template");
			log.setDataID(String.valueOf(TemplateID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Map<String, Object> GetStatus(int TemplateID) {

		String sql = "select Status from QAII_Template  where TemplateID=:TemplateID "
				+ " and IsActive='1' ";

		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("TemplateID", TemplateID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int IsExist(int TemplateID) {
		String sql = "select count(*) from QAII_Template where TemplateTitle = "
				+ " (select TemplateTitle from QAII_Template where TemplateID="
				+ TemplateID
				+ ") "
				+ " and IsActive='1' and Status='2' and TemplateID<>"
				+ TemplateID;

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

}
