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
import com.spring.springmvc.domain.LogDomain;
import com.spring.springmvc.domain.BriefingDomain;

@Repository
public class BriefingDao extends BaseDao {
	@Autowired
	LogDao dao;

	public List<Map<String, Object>> LoadBriefingList(int pageno, int pagerow) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount();
		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "SELECT BriefingID,Title,"
					+ "CONCAT('fileload/html/Briefing/',LinkAddress) as LinkAddress"
					+ ",PublishDate,CreateBy,Synopsis "
					+ "FROM QAII_Briefing WHERE IsActive='1' and BriefingID NOT IN "
					+ "( select t.BriefingID from (SELECT BriefingID FROM QAII_Briefing WHERE IsActive='1' ORDER BY PublishDate desc limit 0,"
					+ start + ") as t) ORDER BY PublishDate desc limit 0,"
					+ pagerow + ";";
		} else {
			sql = "SELECT BriefingID,Title,"
					+ "CONCAT('fileload/html/Briefing/',LinkAddress) as LinkAddress"
					+ ",PublishDate,CreateBy,Synopsis"
					+ " FROM QAII_Briefing WHERE IsActive='1' ORDER BY PublishDate desc limit 0,"
					+ pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return list;
	}

	public int GetListCount() {
		String sql = "select count(*) from QAII_Briefing where IsActive='1' ";

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return rows;
	}

	public Map<String, Object> GetBriefingShowById(int BriefingID) {
		String sql = "select BriefingID,Title,"
				+ "CONCAT('fileload/html/Briefing/',LinkAddress) as LinkAddress"
				+ ",PublishDate,CreateBy,Synopsis from QAII_Briefing where BriefingID= :BriefingID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("BriefingID", BriefingID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return map;
	}

	/*************** Start*******后台方法 ***********************/

	public int AddData(BriefingDomain briefing, String userid) {

		String sql = " Insert into  QAII_Briefing(Title,Synopsis,PublishDate,CreateBy,LinkAddress,IsActive) ";
		sql = sql
				+ " values (:Title,:Synopsis,:PublishDate,:CreateBy,:LinkAddress,'1');";
		SqlParameterSource params = new MapSqlParameterSource();

		((MapSqlParameterSource) params).addValue("Title", briefing.getTitle());
		((MapSqlParameterSource) params).addValue("Synopsis",
				briefing.getSynopsis());
		((MapSqlParameterSource) params).addValue("PublishDate",
				briefing.getPublishDate());
		((MapSqlParameterSource) params).addValue("CreateBy",
				briefing.getCreateBy());
		((MapSqlParameterSource) params).addValue("LinkAddress",
				briefing.getLinkAddress());

		try {
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			sql = " select max(BriefingID) as MaxID from QAII_Briefing ";
			Map<String, Object> row = queryForMap(sql);
			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("行业情报简报");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("QAII_Briefing");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(BriefingDomain briefing, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		SqlParameterSource params = new MapSqlParameterSource();

		if (briefing.getLinkAddress() == "") {
			sqlstr.append("update QAII_Briefing set ");

			sqlstr.append(" Title=:Title ");

			sqlstr.append(" ,Synopsis=:Synopsis ");

			sqlstr.append(" ,PublishDate=:PublishDate ");

			sqlstr.append(" ,CreateBy=:CreateBy ");

			sqlstr.append("  where BriefingID=:BriefingID and IsActive='1' ");
		} else {
			sqlstr.append("update QAII_Briefing set ");

			sqlstr.append(" Title=:Title ");

			sqlstr.append(" ,Synopsis=:Synopsis ");

			sqlstr.append(" ,PublishDate=:PublishDate ");

			sqlstr.append(" ,CreateBy=:CreateBy ");

			sqlstr.append(" ,LinkAddress=:LinkAddress ");

			sqlstr.append("  where BriefingID=:BriefingID and IsActive='1' ");

			((MapSqlParameterSource) params).addValue("LinkAddress",
					briefing.getLinkAddress());
		}
		((MapSqlParameterSource) params).addValue("BriefingID",
				briefing.getBriefingID());

		((MapSqlParameterSource) params).addValue("Title", briefing.getTitle());

		((MapSqlParameterSource) params).addValue("Synopsis",
				briefing.getSynopsis());

		((MapSqlParameterSource) params).addValue("PublishDate",
				briefing.getPublishDate());

		((MapSqlParameterSource) params).addValue("CreateBy",
				briefing.getCreateBy());

		try {
			int result = ExecParamSql(sqlstr.toString(), params);
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("行业情报简报");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("QAII_Briefing");
			log.setDataID(String.valueOf(briefing.getBriefingID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int briefingid, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update    QAII_Briefing  set IsActive='0' ");
		sqlstr.append("  where BriefingID=:BriefingID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("BriefingID", briefingid);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("行业情报简报");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("QAII_Briefing");
			log.setDataID(String.valueOf(briefingid));

			dao.AddData(log);
			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Map<String, Object> GetInfoByID(int Briefingid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" select * from   QAII_Briefing   ");
		sqlstr.append("  where BriefingID=:BriefingID  and IsActive='1' ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("BriefingID", Briefingid);
		try {
			return queryForMap(sqlstr.toString(), params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/*************** end*******后台方法 ***********************/
}
