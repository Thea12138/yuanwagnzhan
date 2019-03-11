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
import com.spring.springmvc.domain.AcademicWorksDomain;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class AcademicWorksDao extends BaseDao {

	@Autowired
	LogDao dao;

	public String SearchParam(String AcademicWorksTitle,
			String AcademicWorksType, String Author, String PublishDate,
			String PublishPlace) {

		String s1 = "";
		if (AcademicWorksTitle.trim() != "") {
			s1 = " and AcademicWorksTitle like '%" + AcademicWorksTitle + "%' ";
		}
		String s2 = "";
		if (AcademicWorksType.trim() != "") {
			s2 = " and AcademicWorksType = '" + AcademicWorksType + "' ";
		}
		String s3 = "";
		if (Author.trim() != "") {
			s3 = " and Author like '%" + Author + "%' ";
		}
		String s4 = "";
		if (PublishDate.trim() != "") {
			s4 = " and PublishDate = '" + PublishDate + "' ";
		}
		String s5 = "";
		if (PublishPlace.trim() != "") {
			s5 = " and PublishPlace like '%" + PublishPlace + "%' ";
		}

		String str = s1 + s2 + s3 + s4 + s5;

		return str;
	}

	public int GetListCount(String AcademicWorksTitle,
			String AcademicWorksType, String Author, String PublishDate,
			String PublishPlace) {

		String str = SearchParam(AcademicWorksTitle, AcademicWorksType, Author,
				PublishDate, PublishPlace);

		str = " where IsActive='1' " + str;

		String sql = "select count(*) from QAII_AcademicWorks " + str;

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetList(int pageno, int pagerow,
			String AcademicWorksTitle, String AcademicWorksType, String Author,
			String PublishDate, String PublishPlace) {

		int start = (pageno - 1) * pagerow;
		int rows = GetListCount(AcademicWorksTitle, AcademicWorksType, Author,
				PublishDate, PublishPlace);

		String str = SearchParam(AcademicWorksTitle, AcademicWorksType, Author,
				PublishDate, PublishPlace);

		str = " where IsActive='1' " + str;

		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "select AcademicWorksID,Seq,AcademicWorksTitle,AcademicWorksType,Author,PublishDate,PublishPlace from QAII_AcademicWorks "
					+ str
					+ " and AcademicWorksID not in "
					+ "( select t.AcademicWorksID from (select AcademicWorksID from QAII_AcademicWorks "
					+ str
					+ " order by -Seq desc limit 0,"
					+ start
					+ ") as t) order by -Seq desc limit 0," + pagerow + ";";
		} else {
			sql = "select AcademicWorksID,Seq,AcademicWorksTitle,AcademicWorksType,Author,PublishDate,PublishPlace from QAII_AcademicWorks "
					+ str + " order by -Seq desc limit 0," + pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetInfoByID(int AcademicWorksID) {
		String sql = "select AcademicWorksID,Seq,AcademicWorksTitle,AcademicWorksType,Author,PublishDate,PublishPlace "
				+ "from QAII_AcademicWorks where AcademicWorksID= :AcademicWorksID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AcademicWorksID",
				AcademicWorksID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int AddData(AcademicWorksDomain domain, String userid) {

		String sql = " insert into  QAII_AcademicWorks(Seq,AcademicWorksTitle,AcademicWorksType,Author,PublishDate,PublishPlace,IsActive) "
				+ " values (:Seq,:AcademicWorksTitle,:AcademicWorksType,:Author,:PublishDate,:PublishPlace,'1');";

		int c = GetListCount("", "", "", "", "");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("Seq", c + 1);
		((MapSqlParameterSource) params).addValue("AcademicWorksTitle",
				domain.getAcademicWorksTitle());
		((MapSqlParameterSource) params).addValue("AcademicWorksType",
				domain.getAcademicWorksType());
		((MapSqlParameterSource) params).addValue("Author", domain.getAuthor());
		((MapSqlParameterSource) params).addValue("PublishDate",
				domain.getPublishDate());
		((MapSqlParameterSource) params).addValue("PublishPlace",
				domain.getPublishPlace());

		try {
			// 执行insert
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(AcademicWorksID) as MaxID from QAII_AcademicWorks ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("学术著作");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("QAII_AcademicWorks");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(AcademicWorksDomain domain, String userid) {

		String sql = " update QAII_AcademicWorks set AcademicWorksTitle=:AcademicWorksTitle,"
				+ "AcademicWorksType=:AcademicWorksType,Author=:Author,PublishDate=:PublishDate,PublishPlace=:PublishPlace "
				+ " where AcademicWorksID=:AcademicWorksID and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AcademicWorksID",
				domain.getAcademicWorksID());
		((MapSqlParameterSource) params).addValue("AcademicWorksTitle",
				domain.getAcademicWorksTitle());
		((MapSqlParameterSource) params).addValue("AcademicWorksType",
				domain.getAcademicWorksType());
		((MapSqlParameterSource) params).addValue("Author", domain.getAuthor());
		((MapSqlParameterSource) params).addValue("PublishDate",
				domain.getPublishDate());
		((MapSqlParameterSource) params).addValue("PublishPlace",
				domain.getPublishPlace());

		try {
			// 执行insert
			int result = ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("学术著作");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("QAII_AcademicWorks");
			log.setDataID(String.valueOf(domain.getAcademicWorksID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int AcademicWorksID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update QAII_AcademicWorks set IsActive='0' ");
		sqlstr.append("  where AcademicWorksID=:AcademicWorksID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("AcademicWorksID",
				AcademicWorksID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("学术著作");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("QAII_AcademicWorks");
			log.setDataID(String.valueOf(AcademicWorksID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
