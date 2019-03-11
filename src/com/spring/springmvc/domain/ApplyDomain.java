package com.spring.springmvc.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class ApplyDomain extends BaseDomain {
	/**
	 * 应聘简历
	 */
	private static final long serialVersionUID = 1106050688828977306L;
	private int ApplicationID;
	private Date ApplicationDate;
	private String FullName;
	private String Phone;
	private String Mailbox;
	private String Attachment;
	private int RecruitmentID;
	private String Sex;
	private String WorkExperience;
	private String Degree;
	private String Address;

	public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
	}

	public int getApplicationID() {
		return ApplicationID;
	}

	public void setApplicationID(int applicationID) {
		ApplicationID = applicationID;
	}

	public Date getApplicationDate() {
		return ApplicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		ApplicationDate = applicationDate;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getMailbox() {
		return Mailbox;
	}

	public void setMailbox(String mailbox) {
		Mailbox = mailbox;
	}

	public String getAttachment() {
		return Attachment;
	}

	public void setAttachment(String attachment) {
		Attachment = attachment;
	}

	public int getRecruitmentID() {
		return RecruitmentID;
	}

	public void setRecruitmentID(int recruitmentID) {
		RecruitmentID = recruitmentID;
	}

	public String getSex() {
		return Sex;
	}

	public void setSex(String sex) {
		Sex = sex;
	}

	public String getWorkExperience() {
		return WorkExperience;
	}

	public void setWorkExperience(String workExperience) {
		WorkExperience = workExperience;
	}

	public String getDegree() {
		return Degree;
	}

	public void setDegree(String degree) {
		Degree = degree;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}
}
