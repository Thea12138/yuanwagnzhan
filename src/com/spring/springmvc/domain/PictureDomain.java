package com.spring.springmvc.domain;

import com.spring.core.BaseDomain;

public class PictureDomain extends BaseDomain {

	/**
	 * 图片
	 */
	private static final long serialVersionUID = -6742508613394950597L;

	private String Pic;

	public String getPic() {
		return Pic;
	}

	public void setPic(String pic) {
		Pic = pic;
	}
}