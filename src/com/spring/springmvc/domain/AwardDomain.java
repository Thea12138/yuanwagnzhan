package com.spring.springmvc.domain;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class AwardDomain extends BaseDomain {

	/**
	 * 科研奖励
	 */
	private static final long serialVersionUID = 3571940530102203846L;

	private int AwardID;
	private int InstituteID;
	private String Seq;
	private String AwardTitle;
	private String GrantUnit;
	private String GetTime;
	private String Winners;

	public int getAwardID() {
		return AwardID;
	}

	public void setAwardID(int awardID) {
		AwardID = awardID;
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

	public String getAwardTitle() {
		return AwardTitle;
	}

	public void setAwardTitle(String awardTitle) {
		AwardTitle = awardTitle;
	}

	public String getGrantUnit() {
		return GrantUnit;
	}

	public void setGrantUnit(String grantUnit) {
		GrantUnit = grantUnit;
	}

	public String getGetTime() {
		return GetTime;
	}

	public void setGetTime(String getTime) {
		GetTime = getTime;
	}

	public String getWinners() {
		return Winners;
	}

	public void setWinners(String winners) {
		Winners = winners;
	}

}
