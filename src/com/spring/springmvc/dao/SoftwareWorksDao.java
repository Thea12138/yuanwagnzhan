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
import com.spring.springmvc.domain.SoftwareWorksDomain;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class SoftwareWorksDao extends BaseDao {

	@Autowired
	LogDao dao;

	public String SearchParam(String SoftwareWorksTitle, String CopyrightOwner,
			String RegistrationNo) {

		String s1 = "";
		if (SoftwareWorksTitle.trim() != "") {
			s1 = " and SoftwareWorksTitle like '%" + SoftwareWorksTitle + "%' ";
		}
		String s2 = "";
		if (CopyrightOwner.trim() != "") {
			s2 = " and CopyrightOwner like '%" + CopyrightOwner + "%' ";
		}
		String s3 = "";
		if (RegistrationNo.trim() != "") {
			s3 = " and RegistrationNo = '" + RegistrationNo + "' ";
		}
		String str = s1 + s2 + s3;

		return str;
	}

	public int GetListCount(String SoftwareWorksTitle, String CopyrightOwner,
			String RegistrationNo, int InstituteID) {

		String str = SearchParam(SoftwareWorksTitle, CopyrightOwner,
				RegistrationNo);

		String iid = "";
		if (InstituteID != 0) {
			iid = " and InstituteID= " + InstituteID;
		}

		str = " where IsActive='1' " + iid + str;

		String sql = "select count(*) from QAII_SoftwareWorks " + str;

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetList(int pageno, int pagerow,
			String SoftwareWorksTitle, String CopyrightOwner,
			String RegistrationNo, int InstituteID) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount(SoftwareWorksTitle, CopyrightOwner,
				RegistrationNo, InstituteID);

		String str = SearchParam(SoftwareWorksTitle, CopyrightOwner,
				RegistrationNo);

		String iid = "";
		if (InstituteID != 0) {
			iid = " and InstituteID= " + InstituteID;
		}

		str = " where IsActive='1' " + iid + str;

		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "select SoftwareWorksID,InstituteID,Seq,SoftwareWorksTitle,CopyrightOwner,RegistrationNo from QAII_SoftwareWorks "
					+ str
					+ " and SoftwareWorksID not in "
					+ "( select t.SoftwareWorksID from (select SoftwareWorksID from QAII_SoftwareWorks "
					+ str
					+ " order by -Seq desc limit 0,"
					+ start
					+ ") as t) order by -Seq desc limit 0," + pagerow + ";";
		} else {
			sql = "select SoftwareWorksID,InstituteID,Seq,SoftwareWorksTitle,CopyrightOwner,RegistrationNo from QAII_SoftwareWorks "
					+ str + " order by -Seq desc limit 0," + pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetInfoByID(int SoftwareWorksID) {
		String sql = "select SoftwareWorksID,InstituteID,Seq,SoftwareWorksTitle,CopyrightOwner,RegistrationNo "
				+ "from QAII_SoftwareWorks where SoftwareWorksID= :SoftwareWorksID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("SoftwareWorksID",
				SoftwareWorksID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int AddData(SoftwareWorksDomain domain, String userid) {

		String sql = " insert into  QAII_SoftwareWorks(InstituteID,Seq,SoftwareWorksTitle,CopyrightOwner,RegistrationNo,IsActive) "
				+ " values (:InstituteID,:Seq,:SoftwareWorksTitle,:CopyrightOwner,:RegistrationNo,'1');";

		int c = GetListCount("", "", "", domain.getInstituteID());

		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("InstituteID",
				domain.getInstituteID());
		((MapSqlParameterSource) params).addValue("Seq", c + 1);
		((MapSqlParameterSource) params).addValue("SoftwareWorksTitle",
				domain.getSoftwareWorksTitle());
		((MapSqlParameterSource) params).addValue("CopyrightOwner",
				domain.getCopyrightOwner());
		((MapSqlParameterSource) params).addValue("RegistrationNo",
				domain.getRegistrationNo());

		try {
			// 执行insert
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(SoftwareWorksID) as MaxID from QAII_SoftwareWorks ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("软件著作");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("QAII_SoftwareWorks");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(SoftwareWorksDomain domain, String userid) {

		String sql = " update QAII_SoftwareWorks set InstituteID=:InstituteID,SoftwareWorksTitle=:SoftwareWorksTitle,"
				+ "CopyrightOwner=:CopyrightOwner,RegistrationNo=:RegistrationNo "
				+ " where SoftwareWorksID=:SoftwareWorksID and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("SoftwareWorksID",
				domain.getSoftwareWorksID());
		((MapSqlParameterSource) params).addValue("InstituteID",
				domain.getInstituteID());
		((MapSqlParameterSource) params).addValue("SoftwareWorksTitle",
				domain.getSoftwareWorksTitle());
		((MapSqlParameterSource) params).addValue("CopyrightOwner",
				domain.getCopyrightOwner());
		((MapSqlParameterSource) params).addValue("RegistrationNo",
				domain.getRegistrationNo());

		try {
			// 执行insert
			int result = ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("软件著作");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("QAII_SoftwareWorks");
			log.setDataID(String.valueOf(domain.getSoftwareWorksID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int SoftwareWorksID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update QAII_SoftwareWorks set IsActive='0' ");
		sqlstr.append("  where SoftwareWorksID=:SoftwareWorksID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("SoftwareWorksID",
				SoftwareWorksID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("软件著作");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("QAII_SoftwareWorks");
			log.setDataID(String.valueOf(SoftwareWorksID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
