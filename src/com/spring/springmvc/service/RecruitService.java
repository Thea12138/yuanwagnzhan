package com.spring.springmvc.service;

import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.dao.RecruitDao;
import com.spring.springmvc.domain.RecruitDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RecruitService {

    @Autowired
    private RecruitDao recruitDao;

    public List<Map<String, Object>> listRecruit() throws DAOException {
        return recruitDao.listRecruit();
    }

    public int insertRecruit(RecruitDomain domain) throws DAOException {
        return recruitDao.insertRecruit(domain);
    }

    public int deleteRecruit(int id) throws DAOException {return recruitDao.deleteRecruit(id);}

    public int updateRecruit(RecruitDomain domain) throws DAOException {return recruitDao.updateRecruit(domain);}

    public Map<String, Object> getRecruit(int id) throws DAOException {return recruitDao.getRecruit(id);}


}
