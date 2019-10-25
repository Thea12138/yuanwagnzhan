package com.spring.springmvc.dao;

import com.spring.core.BaseDao;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.domain.RecruitDomain;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class RecruitDao extends BaseDao {

    //列表
    public List<Map<String, Object>> listRecruit() throws DAOException {
        String sql = "select id, recruit_name, recruit_unit, recruit_person, recruit_responsibility, recruit_require from qaii_recruit";
        return queryForList(sql);
    }

    //增加
    public int insertRecruit(RecruitDomain domain) throws DAOException {
        String sql = "insert into"
                + " qaii_recruit(recruit_name, recruit_unit, recruit_person, recruit_responsibility, recruit_require)"
                + " values(:name, :unit, :person, :resp, :require)";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource();
        ((MapSqlParameterSource) sqlParameterSource).addValue("name", domain.getRecruit_Name());
        ((MapSqlParameterSource) sqlParameterSource).addValue("unit", domain.getRecruitUnit());
        ((MapSqlParameterSource) sqlParameterSource).addValue("person", domain.getRecruitPerson());
        ((MapSqlParameterSource) sqlParameterSource).addValue("resp", domain.getRecruitResponsibility());
        ((MapSqlParameterSource) sqlParameterSource).addValue("require", domain.getRecruitRequire());
        return ExecParamSql(sql, sqlParameterSource);
    }

    //删除
    public int deleteRecruit(int id) throws DAOException {
        String sql = "delete from qaii_recruit where id = :id";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource();
        ((MapSqlParameterSource) sqlParameterSource).addValue("id", id);
        return ExecParamSql(sql, sqlParameterSource);
    }

    //修改
    public int updateRecruit(RecruitDomain domain) throws DAOException {
        String sql = " update qaii_recruit set recruit_name = :name, recruit_unit = :unit, recruit_person = :person, " +
                "recruit_responsibility = :resp, recruit_require = :require where id = :id";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource();
        ((MapSqlParameterSource) sqlParameterSource).addValue("name", domain.getRecruit_Name());
        ((MapSqlParameterSource) sqlParameterSource).addValue("unit", domain.getRecruitUnit());
        ((MapSqlParameterSource) sqlParameterSource).addValue("person", domain.getRecruitPerson());
        ((MapSqlParameterSource) sqlParameterSource).addValue("resp", domain.getRecruitResponsibility());
        ((MapSqlParameterSource) sqlParameterSource).addValue("require", domain.getRecruitRequire());
        ((MapSqlParameterSource) sqlParameterSource).addValue("id", domain.getId());
        return ExecParamSql(sql, sqlParameterSource);
    }

    //查询
    public Map<String, Object> getRecruit(int id) throws DAOException {
        String sql = "select id, recruit_name, recruit_unit, recruit_person, recruit_responsibility, recruit_require from qaii_recruit where id = :id";
        SqlParameterSource sqlParameterSource = new MapSqlParameterSource();
        ((MapSqlParameterSource) sqlParameterSource).addValue("id", id);
        return queryForMap(sql, sqlParameterSource);
    }
}
