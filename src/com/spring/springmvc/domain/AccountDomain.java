package com.spring.springmvc.domain;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class AccountDomain extends BaseDomain {

	/**
	 * 账号
	 */
	private static final long serialVersionUID = 5565111957989491664L;

	private int AccountID;
	private String AccountNo;
	private String Password;
	private String Memo;
	private String IsSystem;

	public int getAccountID() {
		return AccountID;
	}

	public void setAccountID(int accountID) {
		AccountID = accountID;
	}

	public String getAccountNo() {
		return AccountNo;
	}

	public void setAccountNo(String accountNo) {
		AccountNo = accountNo;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getMemo() {
		return Memo;
	}

	public void setMemo(String memo) {
		Memo = memo;
	}

	public String getIsSystem() {
		return IsSystem;
	}

	public void setIsSystem(String isSystem) {
		IsSystem = isSystem;
	}

}
