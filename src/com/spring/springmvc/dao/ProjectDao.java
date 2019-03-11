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
import com.spring.springmvc.domain.ProjectDomain;

@Repository
public class ProjectDao extends BaseDao {
	@Autowired
	LogDao dao;

	public int GetListCount(int ProjectCategory) {
		String sql = "select count(*) from QAII_Project where ProjectCategory=:ProjectCategory  and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("ProjectCategory",
				ProjectCategory);
		int rows = 0;
		try {
			rows = QueryForInt(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetList(int pageno, int pagerow) {
		int ProjectCategory = 1;
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount(ProjectCategory);
		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "SELECT ProjectID,InstituteID,ProjectTitle,ProjectCategory,"
					+ "CONCAT('fileload/html/ResearchWork/KeyProject/',LinkAddress) as LinkAddress"
					+ ",DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate "
					+ "FROM QAII_Project WHERE ProjectCategory=:ProjectCategory and IsActive='1' and ProjectID NOT IN "
					+ "( select t.ProjectID from( "
					+ " SELECT  ProjectID FROM QAII_Project WHERE ProjectCategory=:ProjectCategory  and IsActive='1' ORDER BY PublicDate desc limit 0, "
					+ start + ") as t) ORDER BY PublicDate desc limit 0, "
					+ pagerow + " ;";
		} else {
			sql = "SELECT  ProjectID,InstituteID,ProjectTitle,ProjectCategory,"
					+ "CONCAT('fileload/html/ResearchWork/KeyProject/',LinkAddress) as LinkAddress"
					+ ",DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate"
					+ " FROM QAII_Project WHERE ProjectCategory=:ProjectCategory   and IsActive='1' ORDER BY PublicDate desc limit 0, "
					+ pagerow + ";";
		}
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("ProjectCategory",
				ProjectCategory);
		try {
			list = queryForList(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetKeyProjectShowById(int ProjectID) {
		String sql = "select ProjectID,InstituteID,ProjectTitle,ProjectCategory,"
				+ "CONCAT('fileload/html/ResearchWork/KeyProject/',LinkAddress) as LinkAddress"
				+ ",DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate"
				+ " from QAII_Project where ProjectID= :ProjectID  and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("ProjectID", ProjectID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetInfoByID(int Projectid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" select ProjectID,InstituteID,ProjectTitle,ProjectCategory,LinkAddress,DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate"
				+ " from   QAII_Project   ");
		sqlstr.append("  where ProjectID=:ProjectID  and IsActive='1' ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("ProjectID", Projectid);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sqlstr.toString(), params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return map;
	}

	public int AddProject(ProjectDomain project, String userid) {
		String sql = " Insert into  QAII_Project(ProjectCategory,PublicDate,ProjectTitle,LinkAddress,InstituteID,IsActive) ";
		sql = sql
				+ " values (:ProjectCategory,:PublicDate,:ProjectTitle,:LinkAddress,:InstituteID,'1');";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("InstituteID", 1);
		((MapSqlParameterSource) params).addValue("ProjectCategory", "1");
		((MapSqlParameterSource) params).addValue("PublicDate",
				project.getPublicDate());
		((MapSqlParameterSource) params).addValue("ProjectTitle",
				project.getProjectTitle());
		((MapSqlParameterSource) params).addValue("LinkAddress",
				project.getLinkAddress());
		try {

			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(ProjectID) as MaxID from QAII_Project ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("重点项目");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("QAII_Project");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;

		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public int EditProject(ProjectDomain project, String userid) {
		StringBuilder sqlstr = new StringBuilder();

		SqlParameterSource params = new MapSqlParameterSource();
		if (project.getLinkAddress() == "") {
			sqlstr.append("update QAII_Project set InstituteID=:InstituteID ");

			sqlstr.append(" ,PublicDate=:PublicDate ");

			sqlstr.append(" ,ProjectTitle=:ProjectTitle ");

			sqlstr.append("  where ProjectID=:ProjectID and IsActive='1' ");
		} else {
			sqlstr.append("update QAII_Project set InstituteID=:InstituteID ");

			sqlstr.append(" ,PublicDate=:PublicDate ");

			sqlstr.append(" ,ProjectTitle=:ProjectTitle ");

			sqlstr.append(" ,LinkAddress=:LinkAddress ");

			sqlstr.append("  where ProjectID=:ProjectID and IsActive='1' ");

			((MapSqlParameterSource) params).addValue("LinkAddress",
					project.getLinkAddress());
		}

		((MapSqlParameterSource) params).addValue("ProjectID",
				project.getProjectID());
		((MapSqlParameterSource) params).addValue("InstituteID", 1);

		((MapSqlParameterSource) params).addValue("PublicDate",
				project.getPublicDate());
		((MapSqlParameterSource) params).addValue("ProjectTitle",
				project.getProjectTitle());

		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("重点项目");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("QAII_Project");
			log.setDataID(String.valueOf(project.getProjectID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public int DelProject(int ProjectID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update    QAII_Project  set IsActive='0' ");
		sqlstr.append("  where ProjectID=:ProjectID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("ProjectID", ProjectID);

		try {
			int result = ExecParamSql(sqlstr.toString(), params);
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("重点项目");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("QAII_Project");
			log.setDataID(String.valueOf(ProjectID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

}
