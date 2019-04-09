package com.spring.springmvc.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.spring.core.BaseDao;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.LogDomain;
import com.spring.springmvc.domain.NewsDomain;
import com.spring.util.NewsFactory;

@Repository
public class NewsDao extends BaseDao {
	@Autowired
	LogDao dao;

	public List<Map<String, Object>> GetHomeNewsList(String NewsCategory,
			int rowcount) {
		List<Map<String, Object>> list = null;
		String sql = "select NewsID,NewsCategory,NewsTitle,Synopsis,"
				+ "CONCAT('fileload/html/News/',NewsCategory,'/',LinkAddress) as LinkAddress,"
				+ "PublishDate,CreateBy"
				+ " from qaii_news WHERE NewsCategory=:NewsCategory and IsActive='1' "
				+ " ORDER BY PublishDate desc limit 0," + rowcount;

		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsCategory", NewsCategory);

		try {
			list = queryForList(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return list;
	}

	public List<Map<String, Object>> LoadNewsList(int pageno, int pagerow,
			String NewsCategory) {
		int start = (pageno - 1) * pagerow;
		int rows = GetListCount(NewsCategory);
		List<Map<String, Object>> list = null;
		String sql;
		/*
		 * if (rows > pagerow && pageno > 1) { sql =
		 * "SELECT NewsID,NewsCategory,NewsTitle,Synopsis," +
		 * "CONCAT('fileload/html/News/',NewsCategory,'/',NewsID,'/',LinkAddress) as LinkAddress,"
		 * + "PublishDate,CreateBy" +
		 * " FROM qaii_news WHERE NewsCategory=:NewsCategory and IsActive='1' and NewsID NOT IN "
		 * +
		 * "( select t.NewsID from (SELECT NewsID FROM qaii_news WHERE  NewsCategory=:NewsCategory  and IsActive='1' ORDER BY PublishDate desc limit 0,"
		 * + start + ") as t) ORDER BY PublishDate desc limit 0," + pagerow +
		 * ";"; } else { sql = "SELECT NewsID,NewsCategory,NewsTitle,Synopsis,"
		 * +
		 * "CONCAT('fileload/html/News/',NewsCategory,'/',NewsID,'/',LinkAddress) as LinkAddress,"
		 * + "PublishDate,CreateBy" +
		 * "  FROM qaii_news WHERE NewsCategory=:NewsCategory and IsActive='1' ORDER BY PublishDate desc limit 0,"
		 * + pagerow + ";"; }
		 */
		// 拼接地址去掉newID
		if (rows > pagerow && pageno > 1) {
			sql = "SELECT NewsID,NewsCategory,NewsTitle,Synopsis,"
					+ "PublishDate,CreateBy"
					+ " FROM qaii_news WHERE NewsCategory=:NewsCategory and IsActive='1' and NewsID NOT IN "
					+ "( select t.NewsID from (SELECT NewsID FROM qaii_news WHERE  NewsCategory=:NewsCategory  and IsActive='1' ORDER BY PublishDate desc limit 0,"
					+ start + ") as t) ORDER BY PublishDate desc limit 0,"
					+ pagerow + ";";
		} else {
			sql = "SELECT NewsID,NewsCategory,NewsTitle,Synopsis,"
					+ "PublishDate,CreateBy"
					+ "  FROM qaii_news WHERE NewsCategory=:NewsCategory and IsActive='1' ORDER BY PublishDate desc limit 0,"
					+ pagerow + ";";
		}
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsCategory", NewsCategory);

		try {
			list = queryForList(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return list;
	}

	public int GetListCount(String NewsCategory) {
		String sql = "select count(*) from qaii_news where NewsCategory=:NewsCategory and IsActive='1' ";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsCategory", NewsCategory);
		int rows = 0;
		try {
			rows = QueryForInt(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return rows;
	}

	public Map<String, Object> GetNewsShowById(int NewsID) {
		String sql = "select NewsID,NewsCategory,NewsTitle,Synopsis,"
				+ "CONCAT('fileload/html/News/',NewsCategory,'/',LinkAddress) as LinkAddress,"
				+ "PublishDate,CreateBy from qaii_news where NewsID= :NewsID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsID", NewsID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return map;
	}

	/*************** Start*******后台方法 ***********************/

	public int AddNew(NewsDomain news, String userid) {

		String sql = " Insert into  qaii_news(NewsCategory,NewsTitle,Synopsis,PublishDate,CreateBy,LinkAddress,IsActive) ";
		sql = sql
				+ " values (:NewsCategory,:NewsTitle,:Synopsis,:PublishDate,:CreateBy,:LinkAddress,'1');";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsCategory",
				news.getNewsCategory());
		((MapSqlParameterSource) params).addValue("NewsTitle",
				news.getNewsTitle());
		((MapSqlParameterSource) params).addValue("Synopsis",
				news.getSynopsis());
		((MapSqlParameterSource) params).addValue("PublishDate",
				news.getPublishDate());
		((MapSqlParameterSource) params).addValue("CreateBy",
				news.getCreateBy());
		((MapSqlParameterSource) params).addValue("LinkAddress",
				news.getLinkAddress());

		try {
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			sql = " select max(NewsID) as MaxID from qaii_news ";
			Map<String, Object> row = queryForMap(sql);
			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("院务新闻");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("qaii_news");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public int EditNew(NewsDomain news, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		SqlParameterSource params = new MapSqlParameterSource();
		if (news.getLinkAddress() == "") {

			sqlstr.append("update qaii_news set NewsCategory=:NewsCategory ");

			sqlstr.append(" ,NewsTitle=:NewsTitle ");

			sqlstr.append(" ,Synopsis=:Synopsis ");

			sqlstr.append(" ,PublishDate=:PublishDate ");

			sqlstr.append(" ,CreateBy=:CreateBy ");

			sqlstr.append("  where NewsID=:NewsID and IsActive='1' ");
		} else {

			sqlstr.append("update qaii_news set NewsCategory=:NewsCategory ");

			sqlstr.append(" ,NewsTitle=:NewsTitle ");

			sqlstr.append(" ,Synopsis=:Synopsis ");

			sqlstr.append(" ,PublishDate=:PublishDate ");

			sqlstr.append(" ,CreateBy=:CreateBy ");

			sqlstr.append(" ,LinkAddress=:LinkAddress ");

			sqlstr.append("  where NewsID=:NewsID and IsActive='1' ");

			((MapSqlParameterSource) params).addValue("LinkAddress",
					news.getLinkAddress());
		}
		((MapSqlParameterSource) params).addValue("NewsID", news.getNewsID());
		((MapSqlParameterSource) params).addValue("NewsCategory",
				news.getNewsCategory());
		if (!news.getNewsTitle().equals("")) {
			((MapSqlParameterSource) params).addValue("NewsTitle",
					news.getNewsTitle());
		}

		((MapSqlParameterSource) params).addValue("Synopsis",
				news.getSynopsis());

		((MapSqlParameterSource) params).addValue("PublishDate",
				news.getPublishDate());

		((MapSqlParameterSource) params).addValue("CreateBy",
				news.getCreateBy());

		try {
			int result = ExecParamSql(sqlstr.toString(), params);
			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("院务新闻");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("qaii_news");
			log.setDataID(String.valueOf(news.getNewsID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public int DelNew(int newsid, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update    qaii_news  set IsActive='0' ");
		sqlstr.append("  where NewsID=:NewsID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsID", newsid);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("院务新闻");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("qaii_news");
			log.setDataID(String.valueOf(newsid));

			dao.AddData(log);
			return result;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

	public Map<String, Object> GetNewsByNewsID(int Newsid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" select * from   qaii_news   ");
		sqlstr.append("  where NewsID=:NewsID  and IsActive='1' ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsID", Newsid);
		try {
			return queryForMap(sqlstr.toString(), params);
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return null;
	}
	/*************** end*******后台方法 ***********************/


	public int insertNews(NewsDomain news, String userid) {
		String sql = " Insert into  qaii_news(NewsCategory,NewsTitle,PublishDate,CreateBy,html_content,IsActive) ";
		sql = sql
				+ " values (:NewsCategory,:NewsTitle,:PublishDate,:CreateBy,:html_content,'1');";
		LogDomain log = new LogDomain();
		log.setModule(NewsFactory.getCategory(news.getNewsCategory()));
		log.setOperating("新增");
		log.setTableName("qaii_news");
		log.setAccountID(Integer.parseInt(userid));
		return exeCuteSql(sql, news, log);
//		SqlParameterSource params = new MapSqlParameterSource();
//		((MapSqlParameterSource) params).addValue("NewsCategory",
//				news.getNewsCategory());
//		((MapSqlParameterSource) params).addValue("NewsTitle",
//				news.getNewsTitle());
//		((MapSqlParameterSource) params).addValue("PublishDate",
//				news.getPublishDate());
//		((MapSqlParameterSource) params).addValue("CreateBy",
//				news.getCreateBy());
//		((MapSqlParameterSource) params).addValue("html_content",
//				news.getHtmlContent());
//		try {
//			ExecParamSql(sql, params);
//
//			Date date = new Date();
//			SimpleDateFormat formatter = new SimpleDateFormat(
//					"yyyy-MM-dd HH:mm:ss");
//			String dateString = formatter.format(date);
//			sql = " select max(NewsID) as MaxID from qaii_news ";
//			Map<String, Object> row = queryForMap(sql);
//			int maxID = 0;
//			maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
//					.get("MaxID").toString());
//			// 记录日志
//			LogDomain log = new LogDomain();
//			log.setModule("院务新闻");
//			log.setAccountID(Integer.parseInt(userid));
//			log.setCreateTime(dateString);
//			log.setOperating("新增");
//			log.setTableName("qaii_news");
//			log.setDataID(String.valueOf(maxID));
//
//			dao.AddData(log);
//			return maxID;
//		} catch (DAOException e) {
//
//			e.printStackTrace();
//		}
	}
	
	public int updateNews(NewsDomain domain, String userid){
		StringBuilder sb = new StringBuilder("update qaii_news SET NewsTitle=:NewsTitle, PublishDate=:PublishDate, CreateBy=:CreateBy, html_content=:html_content WHERE NewsID=:id AND IsActive = '1'");
		LogDomain log = new LogDomain();
		log.setModule(NewsFactory.getCategory(domain.getNewsCategory()));
		log.setOperating("更新");
		log.setTableName("qaii_news");
		log.setAccountID(Integer.parseInt(userid));
		return exeCuteSql(sb.toString(), domain, log);
	}

	public Map<String, Object> getRecord(int id){
		String sql = "select * from qaii_news where NewsID = :id";
		SqlParameterSource params = new MapSqlParameterSource();
		try {
			((MapSqlParameterSource) params).addValue("id", id);
			return queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int exeCuteSql(String sql, NewsDomain domain, LogDomain log) {
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("NewsCategory",
				domain.getNewsCategory());
		((MapSqlParameterSource) params).addValue("NewsTitle",
				domain.getNewsTitle());
		((MapSqlParameterSource) params).addValue("PublishDate",
				domain.getPublishDate());
		((MapSqlParameterSource) params).addValue("CreateBy",
				domain.getCreateBy());
		((MapSqlParameterSource) params).addValue("html_content",
				domain.getHtmlContent());
		((MapSqlParameterSource) params).addValue("id",
				domain.getNewsID());
		try {
			ExecParamSql(sql, params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);
			sql = " select max(NewsID) as MaxID from qaii_news ";
			Map<String, Object> row = queryForMap(sql);
			int maxID = 0;
			maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());
			// 记录日志
			log.setCreateTime(dateString);
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);
			return maxID;
		} catch (DAOException e) {

			e.printStackTrace();
		}
		return 0;
	}

//	List<Map<String, Object>> listNews(int pageno, int pagerow,
//										   String NewsCategory) {
//		int start = (pageno - 1) * pagerow;
//		int rows = GetListCount(NewsCategory);
//		List<Map<String, Object>> list = null;
//		String sql;
//	}
}
