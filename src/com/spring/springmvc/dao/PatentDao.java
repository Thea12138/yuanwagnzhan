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
import com.spring.springmvc.domain.PatentDomain;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class PatentDao extends BaseDao {

	@Autowired
	LogDao dao;

	public String SearchParam(String PatentTitle, String PatentType,
			String PatentRight, String PatentNo) {

		String s1 = "";
		if (PatentTitle.trim() != "") {
			s1 = " and PatentTitle like '%" + PatentTitle + "%' ";
		}
		String s2 = "";
		if (PatentType.trim() != "") {
			s2 = " and PatentType = '" + PatentType + "' ";
		}
		String s3 = "";
		if (PatentRight.trim() != "") {
			s3 = " and PatentRight like '%" + PatentRight + "%' ";
		}
		String s4 = "";
		if (PatentNo.trim() != "") {
			s4 = " and PatentNo ='" + PatentNo + "' ";
		}

		String str = s1 + s2 + s3 + s4;

		return str;
	}

	public int GetListCount(String PatentTitle, String PatentType,
			String PatentRight, String PatentNo) {

		String str = SearchParam(PatentTitle, PatentType, PatentRight, PatentNo);

		str = " where IsActive='1' " + str;

		String sql = "select count(*) from qaii_patent " + str;

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetList(int pageno, int pagerow,
			String PatentTitle, String PatentType, String PatentRight,
			String PatentNo) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount(PatentTitle, PatentType, PatentRight, PatentNo);

		String str = SearchParam(PatentTitle, PatentType, PatentRight, PatentNo);

		str = " where IsActive='1' " + str;

		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "select PatentID,Seq,PatentTitle,PatentType,PatentRight,PatentNo from qaii_patent"
					+ str
					+ " and PatentID not in "
					+ "( select t.PatentID from (select PatentID from qaii_patent "
					+ str
					+ " order by -Seq desc limit 0,"
					+ start
					+ ") as t) order by -Seq desc limit 0," + pagerow + ";";
		} else {
			sql = "select PatentID,Seq,PatentTitle,PatentType,PatentRight,PatentNo from qaii_patent "
					+ str + " order by -Seq desc limit 0," + pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetInfoByID(int PatentID) {
		String sql = "select PatentID,Seq,PatentTitle,PatentType,PatentRight,PatentNo "
				+ "from qaii_patent where PatentID= :PatentID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("PatentID", PatentID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int AddData(PatentDomain domain, String userid) {

		String sql = " insert into  qaii_patent(Seq,PatentTitle,PatentType,PatentRight,PatentNo,IsActive) "
				+ " values (:Seq,:PatentTitle,:PatentType,:PatentRight,:PatentNo,'1');";

		int c = GetListCount("", "", "", "");

		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("Seq", c + 1);
		((MapSqlParameterSource) params).addValue("PatentTitle",
				domain.getPatentTitle());
		((MapSqlParameterSource) params).addValue("PatentType",
				domain.getPatentType());
		((MapSqlParameterSource) params).addValue("PatentRight",
				domain.getPatentRight());
		((MapSqlParameterSource) params).addValue("PatentNo",
				domain.getPatentNo());

		try {
			// 执行insert
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(PatentID) as MaxID from qaii_patent ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("专利成果");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("qaii_patent");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(PatentDomain domain, String userid) {

		String sql = " update qaii_patent set PatentTitle=:PatentTitle,"
				+ "PatentType=:PatentType,PatentRight=:PatentRight,PatentNo=:PatentNo "
				+ " where PatentID=:PatentID and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("PatentID",
				domain.getPatentID());
		((MapSqlParameterSource) params).addValue("PatentTitle",
				domain.getPatentTitle());
		((MapSqlParameterSource) params).addValue("PatentType",
				domain.getPatentType());
		((MapSqlParameterSource) params).addValue("PatentRight",
				domain.getPatentRight());
		((MapSqlParameterSource) params).addValue("PatentNo",
				domain.getPatentNo());

		try {
			// 执行insert
			int result = ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("专利成果");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("qaii_patent");
			log.setDataID(String.valueOf(domain.getPatentID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int PatentID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update qaii_patent set IsActive='0' ");
		sqlstr.append("  where PatentID=:PatentID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("PatentID", PatentID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("专利成果");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("qaii_patent");
			log.setDataID(String.valueOf(PatentID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
