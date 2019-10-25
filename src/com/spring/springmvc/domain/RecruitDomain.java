package com.spring.springmvc.domain;

import com.spring.core.BaseDomain;

import java.util.Date;

public class RecruitDomain extends BaseDomain {

    private static final long serialVersionUID = 4651163852958069671L;

    private Integer id;

    private String recruit_Name;

    private String recruitUnit;

    private short recruitPerson;

    private String recruitResponsibility;

    private String recruitRequire;

    private Date createTime;

    private Date updateTime;

    public RecruitDomain() {
    }

    public RecruitDomain(Integer id, String recruit_Name, String recruitUnit, short recruitPerson, String recruitResponsibility, String recruitRequire) {
        this.id = id;
        this.recruit_Name = recruit_Name;
        this.recruitUnit = recruitUnit;
        this.recruitPerson = recruitPerson;
        this.recruitResponsibility = recruitResponsibility;
        this.recruitRequire = recruitRequire;
    }

    public Integer getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRecruit_Name() {
        return recruit_Name;
    }

    public void setRecruit_Name(String recruit_Name) {
        this.recruit_Name = recruit_Name;
    }

    public String getRecruitUnit() {
        return recruitUnit;
    }

    public void setRecruitUnit(String recruitUnit) {
        this.recruitUnit = recruitUnit;
    }

    public short getRecruitPerson() {
        return recruitPerson;
    }

    public void setRecruitPerson(short recruitPerson) {
        this.recruitPerson = recruitPerson;
    }

    public String getRecruitResponsibility() {
        return recruitResponsibility;
    }

    public void setRecruitResponsibility(String recruitResponsibility) {
        this.recruitResponsibility = recruitResponsibility;
    }

    public String getRecruitRequire() {
        return recruitRequire;
    }

    public void setRecruitRequire(String recruitRequire) {
        this.recruitRequire = recruitRequire;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
