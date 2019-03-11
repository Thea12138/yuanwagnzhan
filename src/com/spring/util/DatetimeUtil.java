package com.spring.util;

import java.util.Calendar;

public class DatetimeUtil {

	public static final java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");;

	/**
	 * 获取年份
	 * 
	 * @return
	 */
	public static int getCurrentYear() {
		Calendar ca = Calendar.getInstance();
		return ca.get(Calendar.YEAR);
	}

	/**
	 * 获取月份
	 * 
	 * @return
	 */
	public static int getCurrentMonth() {
		Calendar ca = Calendar.getInstance();
		return ca.get(Calendar.MONTH);
	}

	/**
	 * 获取日
	 * 
	 * @return
	 */
	public static int getCurrentDay() {
		Calendar ca = Calendar.getInstance();
		return ca.get(Calendar.DATE);
	}

	/**
	 * 获取当前日期前后monthdiff个月份的日期的年份
	 * 
	 * @param monthdiff
	 *            差距的月份， 日期之前的月份用负数
	 * @return
	 */
	public static int GetdiffYear(int monthdiff) {
		Calendar ca = Calendar.getInstance();
		ca.add(Calendar.MONTH, monthdiff);
		return ca.get(Calendar.YEAR);
	}

	/**
	 * 获取当前日期前后monthdiff个月份的日期的月份
	 * 
	 * @param monthdiff
	 *            差距的月份， 日期之前的月份用负数
	 * @return
	 */
	public static int GetdiffMonth(int monthdiff) {
		Calendar ca = Calendar.getInstance();
		ca.add(Calendar.MONTH, monthdiff);
		return ca.get(Calendar.MONTH);
	}

}
