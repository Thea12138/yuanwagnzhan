package com.spring.springmvc.domain;

import com.spring.core.BaseDomain;

public class HomePicsDomain extends BaseDomain {

	/**
	 * 首页大图
	 */
	private static final long serialVersionUID = 1060225978656935771L;

	private int HomePicsID;
	private String DisplayType;// 1.领导视察、2.重点项目、3.产品方案
	private String Title;
	private String PicUrl;
	private String Memo;
	private String EndShowTime;
	private String CreateDate;
	private String CreateBy;

	public int getHomePicsID() {
		return HomePicsID;
	}

	public void setHomePicsID(int homePicsID) {
		HomePicsID = homePicsID;
	}

	public String getDisplayType() {
		return DisplayType;
	}

	public void setDisplayType(String displayType) {
		DisplayType = displayType;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}

	public String getMemo() {
		return Memo;
	}

	public void setMemo(String memo) {
		Memo = memo;
	}

	public String getEndShowTime() {
		return EndShowTime;
	}

	public void setEndShowTime(String endShowTime) {
		EndShowTime = endShowTime;
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