package com.spring.springmvc.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class ProjectDomain extends BaseDomain {

	/**
	 * 重点项目
	 */
	private static final long serialVersionUID = -8624439647394252672L;
	private int ProjectID;
	private int InstituteID;
	private String ProjectCategory;
	private String PublicDate;
	private String ProjectTitle;
	private String LinkAddress;

	public int getProjectID() {
		return ProjectID;
	}

	public void setProjectID(int projectID) {
		ProjectID = projectID;
	}

	public int getInstituteID() {
		return InstituteID;
	}

	public void setInstituteID(int instituteID) {
		InstituteID = instituteID;
	}

	public String getProjectCategory() {
		return ProjectCategory;
	}

	public void setProjectCategory(String projectCategory) {
		ProjectCategory = projectCategory;
	}

	public String getPublicDate() {
		return PublicDate;
	}

	public void setPublicDate(String publicDate) {
		PublicDate = publicDate;
	}

	public String getProjectTitle() {
		return ProjectTitle;
	}

	public void setProjectTitle(String projectTitle) {
		ProjectTitle = projectTitle;
	}

	public String getLinkAddress() {
		return LinkAddress;
	}

	public void setLinkAddress(String linkAddress) {
		LinkAddress = linkAddress;
	}
}
