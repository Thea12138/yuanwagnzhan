package com.spring.core;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.spring.spring.exception.realize.DAOException;

@Repository
public class BaseDao {

	@Autowired
	protected NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	@Autowired
	protected JdbcTemplate jdbcTemplate;

	// 执行SQL
	// =================================================================================
	/**
	 * 执行不带参数的SQL通用方法
	 * 
	 * @see public
	 * @param sql字符串
	 * @return
	 */
	public void ExecSql(String sql) throws DAOException {
		try {
			jdbcTemplate.update(sql);
		} catch (Exception e) {
			throw new DAOException("在执行不带参数的SQL通用方法时发生数据库操作错误", e);
		}
	}

	/**
	 * 执行带参数的SQL通用方法
	 * 
	 * @see public
	 * @param sql字符串
	 * @param SqlParameterSource类型参数值
	 * @return
	 */
	public int ExecParamSql(String sql, SqlParameterSource params)
			throws DAOException {
		try {
			return namedParameterJdbcTemplate.update(sql, params);
		} catch (Exception e) {
			throw new DAOException("在执行带参数的SQL通用方法时发生数据库操作错误", e);
		}
	}

	// SqlParameterSource[] params = SqlParameterSourceUtils.createBatch(new
	// Object[] {model, model});
	/**
	 * 批量执行
	 * 
	 * @param sql
	 * @param batchparams
	 * @throws DAOException
	 */
	public void BatchExecParamSql(String sql, SqlParameterSource[] batchparams)
			throws DAOException {
		try {
			namedParameterJdbcTemplate.batchUpdate(sql, batchparams);
		} catch (Exception e) {
			throw new DAOException("在执行批量操作方法时发生数据库操作错误", e);
		}
	}

	public void BatchUpdate(String sql, List<Object[]> batchArgs)
			throws DAOException {
		try {
			jdbcTemplate.batchUpdate(sql, batchArgs);
		} catch (Exception e) {
			throw new DAOException("在执行批量操作方法时发生数据库操作错误", e);
		}
	}

	/**
	 * 插入记录并返回自增长生成的主键
	 * 
	 * @param sql
	 * @param params
	 * @return
	 * @throws DAOException
	 */
	public int Insert(String sql, SqlParameterSource params)
			throws DAOException {
		KeyHolder keyholder = new GeneratedKeyHolder();
		try {
			namedParameterJdbcTemplate.update(sql, params, keyholder);
			return keyholder.getKey().intValue();
		} catch (Exception e) {
			throw new DAOException("在执行插入记录并返回自增长生成的主键方法时发生数据库操作错误", e);
		}
	}

	// 查询数据
	// =================================================================================

	/**
	 * 执行返回整数的查询通用方法，不带参数；一般用于求记录行数， 记录是否存在
	 * 
	 * @param sql字符串
	 * @return
	 */
	public int QueryForInt(String sql) throws DAOException {
		try {
			return jdbcTemplate.queryForInt(sql);
		} catch (Exception e) {
			throw new DAOException("在执行返回整数的查询通用方法时发生数据库操作错误", e);
		}
	}

	/**
	 * 执行返回整数的查询通用方法，带参数；一般用于求记录行数， 记录是否存在
	 * 
	 * @param sql字符串
	 * @param SqlParameterSource类型参数值
	 * @return
	 */
	public int QueryForInt(String sql, SqlParameterSource params)
			throws DAOException {
		try {
			return namedParameterJdbcTemplate.queryForInt(sql, params);
		} catch (Exception e) {
			throw new DAOException("在执行返回整数的查询通用方法时发生数据库操作错误", e);
		}
	}

	/**
	 * 执行返回不带参数SQl结果，可以是根据类型匹配返回的字段值或者对象
	 * 
	 * @param sql字符串
	 * @param 对象类型
	 * @return
	 */
	public Object QueryForObject(String sql, Class objectclass)
			throws DAOException {
		try {
			return jdbcTemplate.queryForObject(sql, objectclass);
		} catch (Exception e) {
			throw new DAOException("在执行返回不带参数SQl结果时发生数据库操作错误", e);
		}
	}

	// 这两个方法不能用都别用了
	/**
	 * 执行返回带参数SQl结果，可以是根据类型匹配返回的字段值或者对象
	 * 
	 * @param sql字符串
	 * @param SqlParameterSource类型参数值
	 * @param 对象类型
	 * @return
	 */
	public Object QueryForObject(String sql, SqlParameterSource params,
			Class objectclass) throws DAOException {
		try {
			return namedParameterJdbcTemplate.queryForObject(sql, params,
					objectclass);
		} catch (Exception e) {
			throw new DAOException("在执行返回带参数SQl结果时发生数据库操作错误", e);
		}
	}

	/**
	 * 执行返回不带参数的SQL一行数据
	 * 
	 * @param sql字符串
	 * @return 一行数据Map
	 */
	public Map<String, Object> queryForMap(String sql) throws DAOException {
		try {
			return jdbcTemplate.queryForMap(sql);
		} catch (EmptyResultDataAccessException e) {
			return null;
		} catch (Exception e) {
			throw new DAOException("在执行返回不带参数的SQL一行数据时发生数据库操作错误", e);
		}
	}

	/**
	 * 执行返回带参数的SQL一行数据
	 * 
	 * @param sql字符串
	 * @param SqlParameterSource类型参数值
	 * @return 一行数据的Map
	 */
	public Map<String, Object> queryForMap(String sql, SqlParameterSource params)
			throws DAOException {
		try {
			return namedParameterJdbcTemplate.queryForMap(sql, params);
		} catch (EmptyResultDataAccessException e) {
			return null;
		} catch (Exception e) {
			throw new DAOException("在执行返回带参数的SQL一行数据时发生数据库操作错误", e);
		}
	}

	/**
	 * 执行返回不带参数的SQL多行数据
	 * 
	 * @param sql字符串
	 * @return 多行数据List
	 */
	public List<Map<String, Object>> queryForList(String sql)
			throws DAOException {
		try {
			return jdbcTemplate.queryForList(sql);
		} catch (Exception e) {
			throw new DAOException("在执行返回不带参数的SQL多行数据方法时发生数据库操作错误", e);
		}
	}

	/**
	 * 执行返回带参数的SQL多行数据
	 * 
	 * @param sql字符串
	 * @param SqlParameterSource类型参数值
	 * @return 多行数据List
	 */
	public List<Map<String, Object>> queryForList(String sql,
			SqlParameterSource params) throws DAOException {
		try {
			return namedParameterJdbcTemplate.queryForList(sql, params);
		} catch (Exception e) {
			throw new DAOException("在执行返回带参数的SQL多行数据方法时发生数据库操作错误", e);
		}

	}
	/*
	 * for(Map row: rows){
	 * 
	 * User user = new User(); user.setId((int)row.get("id"));
	 * user.setUsername((String)row.get("username"));
	 * user.setPasword((String)row.get("password")); lists.add(user); }
	 */

	// 用于查询的回调接口
	// xxxQueryResultSetExtractor();
	// xxxQueryRowMapper
	// xxxQueryRowCallbackHandler

	// ResultSetExtractor Object extractData(ResultSet rs) throws SQLException,
	// DataAccessException
	// 以ResultSetExtractor作为方法参数的query方法返回Object型结果，要使用查询结果，我们需要对其进行强制转型；
	// 使用ResultSetExtractor作为Callback接口处理查询结果，我们需要自己声明集合类，自己遍历ResultSet，自己根据每行数据组装Customer对象，自己将组装后的Customer对象添加到集合类中，方法最终只负责将组装完成的集合返回；

	// RowMapper ResultSetExtractor的精简版 Object mapRow(ResultSet rs, int rowNum)
	// throws SQLException
	// 以RowMapper接口作为方法参数的query方法直接返回List型的结果
	// 使用RowMapper比直接使用ResultSetExtractor要方便的多，只负责处理单行结果就行，现在，我们只需要将单行的结果组装后返回就行，剩下的工作，全部都是JdbcTemplate内部的事情了
	/*
	 * example:
	 * 
	 * List customerList = jdbcTemplate.query("select * from customer", new
	 * RowMapper(){
	 * 
	 * public Object mapRow(ResultSet rs, int rowNumber) throws SQLException {
	 * Customer customer = new Customer();
	 * customer.setFirstName(rs.getString(1));
	 * customer.setLastName(rs.getString(2)); ... return customer; }});
	 */

	// RowCallbackHandler void processRow(ResultSet rs) throws SQLException
	// 以RowCallbackHandler作为方法参数的query方法，返回值为void；
	// RowCallbackHandler虽然与RowMapper同是处理单行数据，不过，除了要处理单行结果，它还得负责最终结果的组装和获取工作，在这里我们是使用当前上下文声明的List取得最终查询结果，
	// 不过，我们也可以单独声明一个RowCallbackHandler实现类，在其中声明相应的集合类，这样，我们可以通过该RowCallbackHandler实现类取得最终查询结果：
	/*
	 * example: final List<AAA> result = new ArrayList<AAA>();
	 * namedParameterJdbcTemplate.query(selectSql, paramMap, new
	 * RowCallbackHandler() {
	 * 
	 * @Override public void processRow(ResultSet rs) throws SQLException { AAA
	 * aa= new AAA(); aa= rs.getInt("id"); result.add(aa); } });
	 */

}
