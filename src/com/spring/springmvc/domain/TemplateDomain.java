package com.spring.springmvc.domain;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class TemplateDomain extends BaseDomain {

	/**
	 * 模版
	 */
	private static final long serialVersionUID = 3571940530102203846L;

	private int TemplateID;
	private String TemplateTitle;
	private String FileUrl;
	private String Status;
	private String Memo;
	private String CreateDate;
	private String CreateBy;

	public int getTemplateID() {
		return TemplateID;
	}

	public void setTemplateID(int templateID) {
		TemplateID = templateID;
	}

	public String getTemplateTitle() {
		return TemplateTitle;
	}

	public void setTemplateTitle(String templateTitle) {
		TemplateTitle = templateTitle;
	}

	public String getFileUrl() {
		return FileUrl;
	}

	public void setFileUrl(String fileUrl) {
		FileUrl = fileUrl;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public String getMemo() {
		return Memo;
	}

	public void setMemo(String memo) {
		Memo = memo;
	}

	public String getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}

	public String getCreateBy() {
		return CreateBy;
	}

	public void setCreateBy(String createBy) {
		CreateBy = createBy;
	}

}
