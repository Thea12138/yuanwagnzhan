package com.spring.springmvc.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.spring.core.BaseDao;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.ApplyDomain;
import com.spring.springmvc.domain.LogDomain;
import com.spring.springmvc.domain.CareersDomain;

@Repository
public class CareersDao extends BaseDao {

	@Autowired
	LogDao dao;

	public List<Map<String, Object>> RecruitmentAll() {
		List<Map<String, Object>> list = null;
		try {
			list = queryForList("select RecruitmentID,JobTitle,DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate,"
					+ "Vacancies,Description,Qualifications,Recommend from QAII_Recruitment where IsActive='1' ORDER BY PublicDate desc");
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int GetCareersCount() {
		String sql = "select count(*) from QAII_Recruitment  where IsActive='1'";

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public List<Map<String, Object>> GetCareers(int pageno, int pagerow) {
		int start = (pageno - 1) * pagerow;
		int rows = GetCareersCount();
		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "SELECT RecruitmentID,JobTitle,DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate,"
					+ "Vacancies,Description,Qualifications,Recommend FROM QAII_Recruitment "
					+ "WHERE  IsActive='1' and RecruitmentID NOT IN "
					+ "(  select t.RecruitmentID from (SELECT  RecruitmentID FROM QAII_Recruitment where IsActive='1'  ORDER BY RecruitmentID desc limit 0,"
					+ start
					+ ") as t) ORDER BY RecruitmentID desc limit 0,"
					+ pagerow + ";";
		} else {
			sql = "SELECT RecruitmentID,JobTitle,DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate,"
					+ "Vacancies,Description,Qualifications,Recommend"
					+ " FROM QAII_Recruitment where IsActive='1' ORDER BY RecruitmentID desc limit 0,"
					+ pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	/*
	 * 根据申请ID查询申请内容 GuoJW
	 */
	public Map<String, Object> GetRecruitmentById(int RecruitmentID) {
		String sql = "select RecruitmentID,JobTitle,DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate,"
				+ "Vacancies,Description,Qualifications,Recommend from QAII_Recruitment "
				+ "where IsActive='1' and RecruitmentID= :RecruitmentID";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("RecruitmentID",
				RecruitmentID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return map;
	}

	public List<Map<String, Object>> GetRecruitmentRecommend() {
		List<Map<String, Object>> list = null;
		String sql = "select RecruitmentID,JobTitle,DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate,"
				+ "Vacancies,Description,Qualifications,Recommend from QAII_Recruitment "
				+ "where IsActive='1' and Recommend=:Recommend ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("Recommend", true);
		try {
			list = queryForList(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int AddCareers(CareersDomain domain, String userid)
			throws DAOException {
		String sql = "insert into QAII_Recruitment(JobTitle,PublicDate,Vacancies,Description,Qualifications,Recommend,IsActive) "
				+ "values("
				+ ":JobTitle,"
				+ ":PublicDate,"
				+ ":Vacancies,"
				+ ":Description," + ":Qualifications," + ":Recommend,'1')";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("JobTitle",
				domain.getJobTitle());
		((MapSqlParameterSource) params).addValue("PublicDate",
				domain.getPublicDate());
		((MapSqlParameterSource) params).addValue("Vacancies",
				domain.getVacancies());
		((MapSqlParameterSource) params).addValue("Description",
				domain.getDescription());
		((MapSqlParameterSource) params).addValue("Qualifications",
				domain.getQualifications());
		((MapSqlParameterSource) params).addValue("Recommend",
				domain.isRecommend());
		try {
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 获取最大ID
			String maxidsql = " select max(RecruitmentID) as MaxID from QAII_Recruitment ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("招贤纳士");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("QAII_Recruitment");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);
			return maxID;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EditCareers(CareersDomain domain, String userid)
			throws DAOException {
		String sql = "update QAII_Recruitment" + " set JobTitle=:JobTitle,"
				+ " PublicDate=:PublicDate," + " Vacancies=:Vacancies,"
				+ " Description=:Description,"
				+ " Qualifications=:Qualifications, "
				+ " Recommend =:Recommend"
				+ " where RecruitmentID=:RecruitmentID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("JobTitle",
				domain.getJobTitle());
		((MapSqlParameterSource) params).addValue("PublicDate",
				domain.getPublicDate());
		((MapSqlParameterSource) params).addValue("Vacancies",
				domain.getVacancies());
		((MapSqlParameterSource) params).addValue("Description",
				domain.getDescription());
		((MapSqlParameterSource) params).addValue("Qualifications",
				domain.getQualifications());
		((MapSqlParameterSource) params).addValue("Recommend",
				domain.isRecommend());

		((MapSqlParameterSource) params).addValue("RecruitmentID",
				domain.getRecruitmentID());
		try {
			int result = ExecParamSql(sql, params);
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("招贤纳士");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("QAII_Recruitment");
			log.setDataID(String.valueOf(domain.getRecruitmentID()));

			dao.AddData(log);
			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int DelCareers(int recruitmentID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update  QAII_Recruitment  set IsActive='0' ");
		sqlstr.append("  where RecruitmentID=:RecruitmentID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("RecruitmentID",
				recruitmentID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("招贤纳士");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("QAII_Recruitment");
			log.setDataID(String.valueOf(recruitmentID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public Map<String, Object> GetCareersByID(int RecruitmentID) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" select RecruitmentID,JobTitle,DATE_FORMAT(PublicDate,'%Y-%m-%d') as PublicDate,"
				+ "Vacancies,Description,Qualifications,Recommend from  QAII_Recruitment    ");
		sqlstr.append("  where RecruitmentID=:RecruitmentID  and IsActive='1' ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("RecruitmentID",
				RecruitmentID);
		try {
			return queryForMap(sqlstr.toString(), params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return null;
	}

	/*
	 * 添加申请信息
	 * 
	 * @throws DAOException
	 */
	public int add(ApplyDomain apply) throws DAOException {
		int i = 0;
		String sql = "insert into QAII_Application(RecruitmentID,ApplicationDate,FullName,Phone,Mailbox,WorkExperience,Attachment) "
				+ "values("
				+ ":RecruitmentID,"
				+ ":ApplicationDate,"
				+ ":FullName,"
				+ ":Phone,"
				+ ":Mailbox,"
				+ ":WorkExperience,"
				+ ":Attachment)";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("RecruitmentID",
				apply.getRecruitmentID());
		((MapSqlParameterSource) params).addValue("ApplicationDate",
				apply.getApplicationDate());
		((MapSqlParameterSource) params).addValue("FullName",
				apply.getFullName());
		((MapSqlParameterSource) params).addValue("Phone", apply.getPhone());
		((MapSqlParameterSource) params)
				.addValue("Mailbox", apply.getMailbox());
		((MapSqlParameterSource) params).addValue("WorkExperience",
				apply.getWorkExperience());
		((MapSqlParameterSource) params).addValue("Attachment",
				apply.getAttachment());

		try {
			i = ExecParamSql(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return i;
	}

	/*
	 * 修改申请信息
	 * 
	 * @author CaoRC
	 * 
	 * @param juns
	 * 
	 * @return
	 * 
	 * @throws DAOException
	 */
	public int EditApply(ApplyDomain apply) throws DAOException {
		int i = 0;

		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append("update QAII_Application set ");

		sqlstr.append(" RecruitmentID=:RecruitmentID ");

		sqlstr.append(" ,ApplicationDate=:ApplicationDate ");

		sqlstr.append(" ,FullName=:FullName ");

		sqlstr.append(" ,Phone=:Phone ");
		sqlstr.append(" ,Mailbox=:Mailbox ");

		sqlstr.append(" ,WorkExperience=:WorkExperience ");
		sqlstr.append(" ,Attachment=:Attachment ");
		sqlstr.append("  where ApplicationID=:ApplicationID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("RecruitmentID",
				apply.getRecruitmentID());
		((MapSqlParameterSource) params).addValue("ApplicationDate",
				apply.getApplicationDate());
		((MapSqlParameterSource) params).addValue("FullName",
				apply.getFullName());
		((MapSqlParameterSource) params).addValue("Phone", apply.getPhone());
		((MapSqlParameterSource) params)
				.addValue("Mailbox", apply.getMailbox());
		((MapSqlParameterSource) params).addValue("WorkExperience",
				apply.getWorkExperience());
		((MapSqlParameterSource) params).addValue("Attachment",
				apply.getAttachment());
		((MapSqlParameterSource) params).addValue("ApplicationID",
				apply.getApplicationID());
		try {
			i = ExecParamSql(sqlstr.toString(), params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return i;
	}

	public List<Map<String, Object>> GetApplication(int pageno, int pagerow) {
		int start = (pageno - 1) * pagerow;
		int rows = GetApplicationCount();
		List<Map<String, Object>> list = null;
		String sql;
		if (rows > pagerow && pageno > 1) {
			sql = "SELECT * FROM QAII_Application WHERE ApplicationID NOT IN "
					+ "(  select t.ApplicationID from (SELECT  ApplicationID FROM QAII_Application ORDER BY ApplicationID desc limit 0,"
					+ start + ") as t) ORDER BY ApplicationID desc limit 0,"
					+ pagerow + ";";
		} else {
			sql = "SELECT  * FROM QAII_Application  ORDER BY ApplicationID desc limit 0,"
					+ pagerow + ";";
		}

		try {
			list = queryForList(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int GetApplicationCount() {
		String sql = "select count(*) from QAII_Application";

		int rows = 0;
		try {
			rows = QueryForInt(sql);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return rows;
	}

	public int DownLoadApplication(HttpServletRequest rt,
			HttpServletResponse response, String ApplicationID)
			throws IOException, DAOException {
		try {

			ApplyDomain application = GetApplicationByApplicationID(ApplicationID);
			String strRealPath = this.getClass().getResource("/").getFile();
			strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
			strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
			String path = strRealPath + "upload/applyAttachment/"
					+ application.getRecruitmentID() + "/";// 文件存在地方
			String FileName = application.getAttachment();

			File uploadfujian = new File(path + FileName);
			if (!uploadfujian.exists()) {
				return 0;
			}

			FileInputStream inStream = new FileInputStream(path + FileName);
			byte[] inOutb = new byte[inStream.available()];
			inStream.read(inOutb); // 读入流,保存在byte数组
			inStream.close();
			// 第三步： 流输出到response
			// 编码
			response.setCharacterEncoding("UTF-8");
			// 设置文件类型
			response.setContentType("application/xls");
			// 文件名
			response.setHeader("Content-Disposition", "attachment;filename="
					+ new String(FileName.getBytes("gb2312"), "ISO-8859-1"));

			response.setContentLength(inOutb.length);

			ServletOutputStream out = response.getOutputStream();
			out.write(inOutb);
			out.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return 0;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

		return 1;
	}

	public ApplyDomain GetApplicationByApplicationID(String ApplicationID) {
		String sql = "select * from QAII_Application where ApplicationID=:ApplicationID ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("ApplicationID",
				ApplicationID);
		ApplyDomain application = null;
		try {
			application = new ApplyDomain();
			Map<String, Object> row = queryForMap(sql, params);

			application
					.setApplicationID((row.get("ApplicationID") == null || ""
							.equals(row.get("ApplicationID").toString())) ? 0
							: Integer.parseInt(row.get("ApplicationID")
									.toString()));
			application
					.setRecruitmentID((row.get("RecruitmentID") == null || ""
							.equals(row.get("RecruitmentID").toString())) ? 0
							: Integer.parseInt(row.get("RecruitmentID")
									.toString()));
			application.setAttachment((row.get("Attachment") == null || ""
					.equals(row.get("Attachment").toString())) ? "" : row.get(
					"Attachment").toString());
			application.setMailbox((row.get("Mailbox") == null || "".equals(row
					.get("Mailbox").toString())) ? "" : row.get("Mailbox")
					.toString());
			application.setPhone((row.get("Phone") == null || "".equals(row
					.get("Phone").toString())) ? "" : row.get("Phone")
					.toString());

			application.setFullName((row.get("FullName") == null || ""
					.equals(row.get("FullName").toString())) ? "" : row.get(
					"FullName").toString());

			return application;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return application;

	}

	public Map<String, Object> GetApplicationByID(int ApplicationID) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" select * from   QAII_Application   ");
		sqlstr.append("  where ApplicationID=:ApplicationID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("ApplicationID",
				ApplicationID);
		try {
			return queryForMap(sqlstr.toString(), params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
