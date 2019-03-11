package com.spring.springmvc.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class CareersDomain extends BaseDomain {

	/**
	 * 招贤纳士
	 */
	private static final long serialVersionUID = -6429447169161077471L;
	private int RecruitmentID;
	private String JobTitle;
	private String PublicDate;
	private int Vacancies;
	private String Description;
	private String Qualifications;
	private boolean Recommend;

	public int getRecruitmentID() {
		return RecruitmentID;
	}

	public void setRecruitmentID(int recruitmentID) {
		RecruitmentID = recruitmentID;
	}

	public String getJobTitle() {
		return JobTitle;
	}

	public void setJobTitle(String jobTitle) {
		JobTitle = jobTitle;
	}

	public String getPublicDate() {
		return PublicDate;
	}

	public void setPublicDate(String publicDate) {
		PublicDate = publicDate;
	}

	public int getVacancies() {
		return Vacancies;
	}

	public void setVacancies(int vacancies) {
		Vacancies = vacancies;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public String getQualifications() {
		return Qualifications;
	}

	public void setQualifications(String qualifications) {
		Qualifications = qualifications;
	}

	public boolean isRecommend() {
		return Recommend;
	}

	public void setRecommend(boolean recommend) {
		Recommend = recommend;
	}
}
