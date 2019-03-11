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
import com.spring.springmvc.domain.AwardDomain;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class AwardDao extends BaseDao {

	@Autowired
	LogDao dao;

	public String SearchParam(String AwardTitle, String GrantUnit,
			String GetTime, String Winners) {

		String s1 = "";
		if (AwardTitle.trim() != "") {
			s1 = " and AwardTitle like '%" + AwardTitle + "%' ";
		}
		String s2 = "";
		if (GrantUnit.trim() != "") {
			s2 = " and GrantUnit like '%" + GrantUnit + "%' ";
		}
		String s3 = "";
		if (GetTime.trim() != "") {
			s3 = " and GetTime = '" + GetTime + "' ";
		}
		String s4 = "";
		if (Winners.trim() != "") {
			s4 = " and Winners like '%" + Winners + "%' ";
		}

		String str = s1 + s2 + s3 + s4;

		return str;
	}

	public int GetListCount(String AwardTitle, String GrantUnit,
			String GetTime, String Winners) {

		String str = SearchParam(AwardTitle, GrantUnit, GetTime, Winners);

		str = " where IsActive='1' " + str;

		String sql = "select count(*) from qaii_award " + str;

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetList(int pageno, int pagerow,
			String AwardTitle, String GrantUnit, String GetTime, String Winners) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount(AwardTitle, GrantUnit, GetTime, Winners);

		String str = SearchParam(AwardTitle, GrantUnit, GetTime, Winners);

		str = " where IsActive='1' " + str;

		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "select AwardID,Seq,AwardTitle,GrantUnit,GetTime,Winners from qaii_award "
					+ str
					+ " and AwardID not in "
					+ "( select t.AwardID from (select AwardID from qaii_award "
					+ str
					+ " order by -Seq desc limit 0,"
					+ start
					+ ") as t) order by -Seq desc limit 0," + pagerow + ";";
		} else {
			sql = "select AwardID,Seq,AwardTitle,GrantUnit,GetTime,Winners from qaii_award "
					+ str + " order by -Seq desc limit 0," + pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetInfoByID(int AwardID) {
		String sql = "select AwardID,Seq,AwardTitle,GrantUnit,GetTime,Winners "
				+ "from qaii_award where AwardID= :AwardID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AwardID", AwardID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int AddData(AwardDomain domain, String userid) {

		String sql = " insert into  qaii_award(Seq,AwardTitle,GrantUnit,GetTime,Winners,IsActive) "
				+ " values (:Seq,:AwardTitle,:GrantUnit,:GetTime,:Winners,'1');";

		int c = GetListCount("", "", "", "");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("Seq", c + 1);
		((MapSqlParameterSource) params).addValue("AwardTitle",
				domain.getAwardTitle());
		((MapSqlParameterSource) params).addValue("GrantUnit",
				domain.getGrantUnit());
		((MapSqlParameterSource) params).addValue("GetTime",
				domain.getGetTime());
		((MapSqlParameterSource) params).addValue("Winners",
				domain.getWinners());

		try {
			// 执行insert
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(AwardID) as MaxID from qaii_award ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("科研奖励");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("qaii_award");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(AwardDomain domain, String userid) {

		String sql = " update qaii_award set AwardTitle=:AwardTitle,"
				+ "GrantUnit=:GrantUnit,GetTime=:GetTime,Winners=:Winners "
				+ " where AwardID=:AwardID and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AwardID",
				domain.getAwardID());
		((MapSqlParameterSource) params).addValue("AwardTitle",
				domain.getAwardTitle());
		((MapSqlParameterSource) params).addValue("GrantUnit",
				domain.getGrantUnit());
		((MapSqlParameterSource) params).addValue("GetTime",
				domain.getGetTime());
		((MapSqlParameterSource) params).addValue("Winners",
				domain.getWinners());

		try {
			// 执行insert
			int result = ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("科研奖励");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("qaii_award");
			log.setDataID(String.valueOf(domain.getAwardID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int AwardID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update qaii_award set IsActive='0' ");
		sqlstr.append("  where AwardID=:AwardID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AwardID", AwardID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("科研奖励");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("qaii_award");
			log.setDataID(String.valueOf(AwardID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
