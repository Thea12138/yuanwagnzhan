package com.spring.springmvc.domain;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class AcademicWorksDomain extends BaseDomain {

	/**
	 * 学术著作
	 */
	private static final long serialVersionUID = 7228564646891315826L;

	private int AcademicWorksID;
	private int InstituteID;
	private String Seq;
	private String AcademicWorksTitle;
	private String AcademicWorksType;
	private String Author;
	private String PublishDate;
	private String PublishPlace;

	public int getAcademicWorksID() {
		return AcademicWorksID;
	}

	public void setAcademicWorksID(int academicWorksID) {
		AcademicWorksID = academicWorksID;
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

	public String getAcademicWorksTitle() {
		return AcademicWorksTitle;
	}

	public void setAcademicWorksTitle(String academicWorksTitle) {
		AcademicWorksTitle = academicWorksTitle;
	}

	public String getAcademicWorksType() {
		return AcademicWorksType;
	}

	public void setAcademicWorksType(String academicWorksType) {
		AcademicWorksType = academicWorksType;
	}

	public String getAuthor() {
		return Author;
	}

	public void setAuthor(String author) {
		Author = author;
	}

	public String getPublishDate() {
		return PublishDate;
	}

	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}

	public String getPublishPlace() {
		return PublishPlace;
	}

	public void setPublishPlace(String publishPlace) {
		PublishPlace = publishPlace;
	}

}
