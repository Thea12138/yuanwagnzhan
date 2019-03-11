package com.spring.springmvc.dao;

import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.spring.core.BaseDao;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class LogDao extends BaseDao {

	public int GetListCount() {
		String sql = "select count(*) from Log ";

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
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
			sql = "select  a.LogID,a.Module,b.AccountNo,a.CreateTime,a.Operating from Log a "
					+ "left join QAII_Account b on a.AccountID = b.AccountID"
					+ "where  a.LogID not in ( select t.LogID from (select LogID from Log order by LogID desc limit 0,"
					+ start
					+ ") as t) order by a.LogID desc limit 0,"
					+ pagerow + ";";
		} else {
			sql = "select  a.LogID,a.Module,b.AccountNo,a.CreateTime,a.Operating from Log a "
					+ " left join QAII_Account b on a.AccountID = b.AccountID "
					+ " order by a.LogID desc limit 0," + pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int AddData(LogDomain domain) {

		String sql = " insert into  Log(AccountID,Module,CreateTime,Operating,TableName,DataID) ";
		sql = sql
				+ " values (:AccountID,:Module,:CreateTime,:Operating,:TableName,:DataID);";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AccountID",
				domain.getAccountID());
		((MapSqlParameterSource) params).addValue("Module", domain.getModule());
		((MapSqlParameterSource) params).addValue("CreateTime",
				domain.getCreateTime());
		((MapSqlParameterSource) params).addValue("Operating",
				domain.getOperating());
		((MapSqlParameterSource) params).addValue("TableName",
				domain.getTableName());
		((MapSqlParameterSource) params).addValue("DataID", domain.getDataID());

		try {
			// 执行insert
			int result = ExecParamSql(sql, params);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
