package com.spring.util;

public class NewsFactory {

	/**
	 * 获取新闻内容html 入参： NewsID NewsCategory --领导视察 A、政企对接 B、重要荣誉 C、学术盛宴 D、 专家访谈
	 * E、通知通告 F、院务新闻 G、员工风采 H
	 **/
	public static String getCategory(String s) {
		switch (s) {
		case "A":
			return "领导视察";
		case "B":
			return "政企对接";
		case "C":
			return "重要荣誉";
		case "D":
			return "学术盛宴";
		case "E":
			return "专家访谈";
		case "F":
			return "通知通告";
		case "G":
			return "院务新闻";
		case "H":
			return "员工风采";
		default:
			return null;
		}
	}
}
