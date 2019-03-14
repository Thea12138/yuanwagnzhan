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
import com.spring.springmvc.domain.HomePicsDomain;
import com.spring.springmvc.domain.LogDomain;

@Repository
public class HomePicsDao extends BaseDao {

	@Autowired
	LogDao dao;

	public List<Map<String, Object>> GetHomeList(String DisplayType) {

		List<Map<String, Object>> list = null;

		// String sql =
		// "(select HomePicsID,DisplayType,Title, CONCAT('fileload/HomePics/',HomePicsID,'/',PicUrl) as PicUrl,"
		// + "Memo,EndShowTime,CreateDate,CreateBy from qaii_homepics "
		// + " where IsActive='1' and DisplayType=:DisplayType  "
		// +
		// " and Date(EndShowTime)>=date_format(now(),'%Y-%m-%d') order by EndShowTime asc limit 0,1)  "
		// + " UNION "
		// +
		// " (select HomePicsID,DisplayType,Title, CONCAT('fileload/HomePics/',HomePicsID,'/',PicUrl) as PicUrl,"
		// + "Memo,EndShowTime,CreateDate,CreateBy from qaii_homepics "
		// + " where IsActive='1' and DisplayType=:DisplayType  "
		// + " and Date(EndShowTime)<date_format(now(),'%Y-%m-%d') "
		// +
		// " order by EndShowTime desc limit 0,1)  order by EndShowTime desc limit 0,1 ";

		// 适配西部数码mysql，拼接路径乱码问题；不能拼接int型的字段。HomePicsID为int型，在西部数码上拼接有误

		String sql = "(select HomePicsID,DisplayType,Title,PicUrl,"
				+ "Memo,EndShowTime,CreateDate,CreateBy from qaii_homepics "
				+ " where IsActive='1' and DisplayType=:DisplayType  "
				+ " and Date(EndShowTime)>=date_format(now(),'%Y-%m-%d') order by EndShowTime asc limit 0,1)  "
				+ " UNION "
				+ " (select HomePicsID,DisplayType,Title, PicUrl,"
				+ "Memo,EndShowTime,CreateDate,CreateBy from qaii_homepics "
				+ " where IsActive='1' and DisplayType=:DisplayType  "
				+ " and Date(EndShowTime)<date_format(now(),'%Y-%m-%d') "
				+ " order by EndShowTime desc limit 0,1)  order by EndShowTime desc limit 0,1 ";

		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("DisplayType", DisplayType);
		try {
			list = queryForList(sql, params);
			String homePicID = "";
			String PicUrl = "";
			for (Map<String, Object> map : list) {
				homePicID = map.get("HomePicsID").toString();
				PicUrl = map.get("PicUrl").toString();
				map.put("PicUrl", "fileload/HomePics/" + homePicID + "/"
						+ PicUrl);
			}
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int GetListCount() {

		String sql = "select count(*) from qaii_homepics where IsActive='1' ";

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
			sql = "select HomePicsID,DisplayType,Title,PicUrl,Memo,EndShowTime,CreateDate,CreateBy from qaii_homepics "
					+ " where IsActive='1' and HomePicsID not in "
					+ "( select t.HomePicsID from (select HomePicsID from qaii_homepics "
					+ " where IsActive='1' order by HomePicsID desc limit 0,"
					+ start
					+ ") as t) order by HomePicsID desc limit 0,"
					+ pagerow + ";";
		} else {
			sql = "select HomePicsID,DisplayType,Title,PicUrl,Memo,EndShowTime,CreateDate,CreateBy from qaii_homepics "
					+ " where IsActive='1' order by HomePicsID desc limit 0,"
					+ pagerow + ";";
		}

		try {
			list = queryForList(sql);
			String homePicID = "";
			String PicUrl = "";
			for (Map<String, Object> map : list) {
				homePicID = map.get("HomePicsID").toString();
				PicUrl = map.get("PicUrl").toString();
				map.put("PicUrl", "fileload/HomePics/" + homePicID + "/"
						+ PicUrl);
			}
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Map<String, Object> GetInfoByID(int HomePicsID) {
		String sql = "select HomePicsID,Title,DisplayType,CONCAT('fileload/HomePics/',HomePicsID,'/',PicUrl) as PicUrl,Memo,EndShowTime,CreateDate,CreateBy "
				+ "from qaii_homepics where HomePicsID= :HomePicsID and IsActive='1'";
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("HomePicsID", HomePicsID);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = queryForMap(sql, params);
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public int AddData(HomePicsDomain domain, String userid) {

		String sql = " insert into  qaii_homepics(DisplayType,Title,PicUrl,Memo,EndShowTime,CreateDate,CreateBy,IsActive) "
				+ " values (:DisplayType,:Title,:PicUrl,:Memo,:EndShowTime,:CreateDate,:CreateBy,'1');";

		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("DisplayType",
				domain.getDisplayType());
		((MapSqlParameterSource) params).addValue("Title", domain.getTitle());
		((MapSqlParameterSource) params).addValue("PicUrl", domain.getPicUrl());
		((MapSqlParameterSource) params).addValue("Memo", domain.getMemo());
		((MapSqlParameterSource) params).addValue("EndShowTime",
				domain.getEndShowTime());
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
			String maxidsql = " select max(HomePicsID) as MaxID from qaii_homepics ";
			Map<String, Object> row = queryForMap(maxidsql);

			int maxID = row.get("MaxID") == null ? 0 : Integer.parseInt(row
					.get("MaxID").toString());

			// 记录日志

			LogDomain log = new LogDomain();
			log.setModule("首页轮播大图");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("新增");
			log.setTableName("qaii_homepics");
			log.setDataID(String.valueOf(maxID));

			dao.AddData(log);

			return maxID;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int EditData(HomePicsDomain domain, String userid) {
		String sql = "";
		SqlParameterSource params = new MapSqlParameterSource();
		if (domain.getPicUrl() == "") {
			sql = " update qaii_homepics set Title=:Title,"
					+ " DisplayType=:DisplayType,Memo=:Memo, "
					+ " EndShowTime=:EndShowTime,CreateDate=:CreateDate,CreateBy=:CreateBy "
					+ " where HomePicsID=:HomePicsID and IsActive='1' ";
		} else {
			sql = " update qaii_homepics set Title=:Title,"
					+ " DisplayType=:DisplayType,PicUrl=:PicUrl,Memo=:Memo, "
					+ " EndShowTime=:EndShowTime,CreateDate=:CreateDate,CreateBy=:CreateBy "
					+ " where HomePicsID=:HomePicsID and IsActive='1' ";
			((MapSqlParameterSource) params).addValue("PicUrl",
					domain.getPicUrl());
		}
		((MapSqlParameterSource) params).addValue("HomePicsID",
				domain.getHomePicsID());
		((MapSqlParameterSource) params).addValue("DisplayType",
				domain.getDisplayType());
		((MapSqlParameterSource) params).addValue("Title", domain.getTitle());
		((MapSqlParameterSource) params).addValue("Memo", domain.getMemo());
		((MapSqlParameterSource) params).addValue("EndShowTime",
				domain.getEndShowTime());
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
			log.setModule("首页轮播大图");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("修改");
			log.setTableName("qaii_homepics");
			log.setDataID(String.valueOf(domain.getHomePicsID()));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int DelData(int HomePicsID, String userid) {
		StringBuilder sqlstr = new StringBuilder();
		sqlstr.append(" update qaii_homepics set IsActive='0' ");
		sqlstr.append("  where HomePicsID=:HomePicsID ");
		SqlParameterSource params = new MapSqlParameterSource();
		((MapSqlParameterSource) params).addValue("HomePicsID", HomePicsID);
		try {
			int result = ExecParamSql(sqlstr.toString(), params);

			Date date = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			String dateString = formatter.format(date);

			// 记录日志
			LogDomain log = new LogDomain();
			log.setModule("首页轮播大图");
			log.setAccountID(Integer.parseInt(userid));
			log.setCreateTime(dateString);
			log.setOperating("删除");
			log.setTableName("qaii_homepics");
			log.setDataID(String.valueOf(HomePicsID));

			dao.AddData(log);

			return result;
		} catch (DAOException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
