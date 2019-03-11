package com.spring.util.domain;

import com.spring.core.BaseDomain;
// 处理哪些不需要处理的简单跳转， 一般是页面内的方法调用
//@Component

public class NohandleDomain extends BaseDomain {

	private static final long serialVersionUID = 1L;

	private Boolean HandleSuccess; // 有值表示正确

	private String HandleError; // 有值表示错误，需要提示

	public NohandleDomain() {
		HandleSuccess = true;
		HandleError = "";
	}

	public Boolean getHandleSuccess() {
		return HandleSuccess;
	}

	public void setHandleSuccess(Boolean handleSuccess) {
		HandleSuccess = handleSuccess;
		if (HandleSuccess == true) {
			HandleError = "";
		}
	}

	public String getHandleError() {
		return HandleError;
	}

	public void setHandleError(String handleError) {
		HandleError = handleError;
		if (HandleError.length() > 0) {
			HandleSuccess = false;
		}
	}

}
