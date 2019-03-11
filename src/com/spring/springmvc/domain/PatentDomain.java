package com.spring.springmvc.domain;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class PatentDomain extends BaseDomain {

	/**
	 * 专利成果
	 */
	private static final long serialVersionUID = 5590613744621507852L;

	private int PatentID;
	private int InstituteID;
	private String Seq;
	private String PatentType;
	private String PatentTitle;
	private String PatentRight;
	private String PatentNo;

	public int getPatentID() {
		return PatentID;
	}

	public void setPatentID(int patentID) {
		PatentID = patentID;
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

	public String getPatentType() {
		return PatentType;
	}

	public void setPatentType(String patentType) {
		PatentType = patentType;
	}

	public String getPatentTitle() {
		return PatentTitle;
	}

	public void setPatentTitle(String patentTitle) {
		PatentTitle = patentTitle;
	}

	public String getPatentRight() {
		return PatentRight;
	}

	public void setPatentRight(String patentRight) {
		PatentRight = patentRight;
	}

	public String getPatentNo() {
		return PatentNo;
	}

	public void setPatentNo(String patentNo) {
		PatentNo = patentNo;
	}

}
