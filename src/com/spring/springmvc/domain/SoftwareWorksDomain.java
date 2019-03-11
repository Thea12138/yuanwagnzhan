package com.spring.springmvc.domain;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class SoftwareWorksDomain extends BaseDomain {

	/**
	 * 软件著作
	 */
	private static final long serialVersionUID = 7705683525889525616L;

	private int SoftwareWorksID;
	private int InstituteID;
	private String Seq;
	private String SoftwareWorksTitle;
	private String CopyrightOwner;
	private String RegistrationNo;

	public int getSoftwareWorksID() {
		return SoftwareWorksID;
	}

	public void setSoftwareWorksID(int softwareWorksID) {
		SoftwareWorksID = softwareWorksID;
	}

	public int getInstituteID() {
		return InstituteID;
	}

	public void setInstituteID(int instituteID) {
		InstituteID = instituteID;
	}

	public String getSeq() {
		return Seq;
	}

	public void setSeq(String seq) {
		Seq = seq;
	}

	public String getSoftwareWorksTitle() {
		return SoftwareWorksTitle;
	}

	public void setSoftwareWorksTitle(String softwareWorksTitle) {
		SoftwareWorksTitle = softwareWorksTitle;
	}

	public String getCopyrightOwner() {
		return CopyrightOwner;
	}

	public void setCopyrightOwner(String copyrightOwner) {
		CopyrightOwner = copyrightOwner;
	}

	public String getRegistrationNo() {
		return RegistrationNo;
	}

	public void setRegistrationNo(String registrationNo) {
		RegistrationNo = registrationNo;
	}

}
