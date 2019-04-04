package com.spring.util;

public class ConstantUtil {

	public static final String COMMON_FAIL_PAGE = "fail";
	public static final String COMMON_FAIL_ALERT_KEY = "fail_key";

	public static final String TRAFFIC_LEVEL_1 = "8"; // 拥堵
	public static final String TRAFFIC_LEVEL_2 = "4"; // 缓行
	public static final String USER_CONTEXT = "username";
	public static final Object User_Old_Error = "M01C004E009";
	public static final Object EXEC_FAIL = 0;
	public static final Object DB_FAIL = "M01C001E001";// 数据库连接异常
	public static final Object EXEC_SUCCESS = 1;
	public static final Object FAILCODE_SUCCESS = -1;
	public static final Object User_IsLose = "M01U004E001";// 登录失效
	public static final Object Template_IsEnable = "M01T001E001";// 模版已使用，不能修改、删除
	public static final Object Template_IsInvalid = "M01T001E002";// 模版已作废，不能修改、删除、启用
	public static final Object Template_IsExist = "M01T001E003";// 模版唯一性

	public static final String HOST_NAME = "www.qaii.cn";
}
