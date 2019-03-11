package com.spring.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class UtilCookie {

	/**
	 * 
	 * @param key
	 * @param value
	 * @param expirtime
	 * @return
	 */
	public static Cookie createCookie(String key, String value, int expirtime) {
		if (!key.equals("") && key != null && !value.equals("")
				&& value != null) {
			Cookie cookie = new Cookie(key, value);
			cookie.setMaxAge(expirtime);
			cookie.setPath("/");
			return cookie;
		}

		return null;
	}

	/**
	 * 
	 * @param key
	 * @param request
	 * @return 当前对应key的cookie
	 */
	public static Cookie getCookie(String key, HttpServletRequest request) {
		if (key != null && !key.equals("")) {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if (key.equals(cookie.getName())) {
						return cookie;
					}
				}
			}

		}
		return null;
	}

	/**
	 * 
	 * @param key
	 * @param request
	 * @return
	 */
	public static Cookie removeCookie(String key, HttpServletRequest request) {
		if (!key.equals("") && key != null) {
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if (key.equals(cookie.getName())) {
					cookie.setMaxAge(-1);
					cookie.setValue("");
					cookie.setPath("/");
					// cookie.setDomain(defaultDomainName);
					return cookie;
				}
			}
		}
		return null;
	}

	/**
	 * 
	 * @param key
	 * @return
	 */
	public static Cookie removeCookie(String key) {
		if (key != null && !key.equals("")) {
			Cookie cookie = new Cookie(key, "");
			cookie.setMaxAge(-1);
			cookie.setPath("/");
			return cookie;
		} else {
			return null;
		}
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	public static Cookie[] getAllCookie(HttpServletRequest request) {
		return request.getCookies();
	}
}
