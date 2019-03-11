package com.spring.springmvc.domain;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class LogDomain extends BaseDomain {

	/**
	 * 日志
	 */
	private static final long serialVersionUID = -6720738698826546981L;

	private int LogID;
	private int AccountID;
	private String Module;
	private String CreateTime;
	private String Operating;
	private String TableName;
	private String DataID;

	public int getLogID() {
		return LogID;
	}

	public void setLogID(int logID) {
		LogID = logID;
	}

	public int getAccountID() {
		return AccountID;
	}

	public void setAccountID(int accountID) {
		AccountID = accountID;
	}

	public String getModule() {
		return Module;
	}

	public void setModule(String module) {
		Module = module;
	}

	public String getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}

	public String getOperating() {
		return Operating;
	}

	public void setOperating(String operating) {
		Operating = operating;
	}

	public String getTableName() {
		return TableName;
	}

	public void setTableName(String tableName) {
		TableName = tableName;
	}

	public String getDataID() {
		return DataID;
	}

	public void setDataID(String dataID) {
		DataID = dataID;
	}

}
