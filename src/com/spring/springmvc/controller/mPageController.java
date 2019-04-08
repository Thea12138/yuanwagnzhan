package com.spring.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.core.BaseController;

@Controller
public class mPageController extends BaseController {

	// 打开演示
	private static final String LOGIN_PAGE = "Management/login";// 登录
	private static final String Management_PAGE = "Management/Management";// 菜单页
	private static final String LunBoDaTu_PAGE = "Management/ShouYe/LunBoDaTu";// 首页-轮播大图

	private static final String YuanWuXinWen_PAGE = "Management/JiBenGaiKuang/YuanWuXinWen"; // 基本概况-院务新闻
	private static final String MoBanXiaZai_PAGE = "Management/JiBenGaiKuang/MoBanXiaZai"; // 基本概况-模板下载

	private static final String TongZhiTongGao_PAGE = "Management/XinWenDongTai/TongZhiTongGao"; // 新闻动态-通知通告
	private static final String LingDaoShiCha_PAGE = "Management/XinWenDongTai/LingDaoShiCha"; // 新闻动态-领导视察
	private static final String ZhengQiDuiJie_PAGE = "Management/XinWenDongTai/ZhengQiDuiJie"; // 新闻动态-政企对接
	private static final String YuanGongFengCai_PAGE = "Management/XinWenDongTai/YuanGongFengCai"; // 新闻动态-员工风采
	private static final String YuanGongFengCaiAdd_PAGE = "Management/XinWenDongTai/YuanGongFengCaiAdd"; // 新闻动态-员工风采添加
	private static final String YuanGongFengCaiEdit_PAGE = "Management/XinWenDongTai/YuanGongFengCaiEdit"; // 新闻动态-员工风采修改
	private static final String ZhongYaoRongYu_PAGE = "Management/XinWenDongTai/ZhongYaoRongYu"; // 新闻动态-重要荣誉
	private static final String ZhongYaoRongYuAdd_PAGE = "Management/XinWenDongTai/ZhongYaoRongYuAdd"; // 新闻动态-重要荣誉-添加
	private static final String ZhongYaoRongYuEdit_PAGE = "Management/XinWenDongTai/ZhongYaoRongYuEdit"; // 新闻动态-重要荣誉-修改
	private static final String HangYeQingBaoJianBao_PAGE = "Management/XinWenDongTai/HangYeQingBaoJianBao"; // 新闻动态-行业情报简报

	private static final String XueShuShengYan_PAGE = "Management/KeYanHuoDong/XueShuShengYan"; // 科研活动-学术盛宴
	private static final String ZhongDianXiangMu_PAGE = "Management/KeYanHuoDong/ZhongDianXiangMu"; // 科研活动-重点项目
	private static final String KeYanJiangLi_PAGE = "Management/KeYanHuoDong/KeYanJiangLi"; // 科研活动-科研奖励
	private static final String XueShuZhuZuo_PAGE = "Management/KeYanHuoDong/XueShuZhuZuo"; // 科研活动-学术著作
	private static final String RuanJianZhuZuo_PAGE = "Management/KeYanHuoDong/RuanJianZhuZuo"; // 科研活动-软件著作
	private static final String ZhuanLiChengGuo_PAGE = "Management/KeYanHuoDong/ZhuanLiChengGuo"; // 科研活动-专利成果
	private static final String ZhuanJiaFangTan_PAGE = "Management/KeYanHuoDong/ZhuanJiaFangTan"; // 科研活动-专家访谈

	private static final String ChanPinFangAn_PAGE = "Management/ChanPinFangAn/ChanPinFangAn"; // 产品方案-产品方案
	private static final String ZhaoXianNaShi_PAGE = "Management/ZhaoXianNaShi/ZhaoXianNaShi"; // 招贤纳士-招贤纳士
	private static final String YingPinJianLi_PAGE = "Management/ZhaoXianNaShi/YingPinJianLi"; // 招贤纳士-应聘简历

	// 跳转页面
	@RequestMapping(value = "login.do")
	public String login() {
		return LOGIN_PAGE;
	}

	@RequestMapping(value = " Management.do")
	public String Management() {
		return Management_PAGE;
	}

	@RequestMapping(value = " LunBoDaTu.do")
	public String LunBoDaTu() {
		return LunBoDaTu_PAGE;
	}

	// 基本概况-院务新闻
	@RequestMapping(value = "YuanWuXinWen.do")
	public String YuanWuXinWen() {
		return YuanWuXinWen_PAGE;
	}

	// 基本概况-模板下载
	@RequestMapping(value = "MoBanXiaZai.do")
	public String MoBanXiaZai() {
		return MoBanXiaZai_PAGE;
	}

	// 新闻动态-通知通告
	@RequestMapping(value = "TongZhiTongGao.do")
	public String TongZhiTongGao() {
		return TongZhiTongGao_PAGE;
	}

	// 新闻动态-领导视察
	@RequestMapping(value = "LingDaoShiCha.do")
	public String LingDaoShiCha() {
		return LingDaoShiCha_PAGE;
	}

	// 新闻动态-政企对接
	@RequestMapping(value = "ZhengQiDuiJie.do")
	public String ZhengQiDuiJie() {
		return ZhengQiDuiJie_PAGE;
	}

	// 新闻动态-员工风采
	@RequestMapping(value = "YuanGongFengCai.do")
	public String YuanGongFengCai() {
		return YuanGongFengCai_PAGE;
	}
	// 新闻动态-员工风采-添加
	@RequestMapping(value = "YuanGongFengCaiAdd.do")
	public String YuanGongFengCaiAdd() {
		return YuanGongFengCaiAdd_PAGE;
	}
	// 新闻动态-员工风采-修改
	@RequestMapping(value = "YuanGongFengCaiEdit.do")
	public String YuanGongFengCaiEdit() {
		return YuanGongFengCaiEdit_PAGE;
	}

	// 新闻动态-重要荣誉
	@RequestMapping(value = "ZhongYaoRongYu.do")
	public String ZhongYaoRongYu() {
		return ZhongYaoRongYu_PAGE;
	}
	// 新闻动态-重要荣誉添加
	@RequestMapping(value = "ZhongYaoRongYuAdd.do")
	public String ZhongYaoRongYuAdd() {
		return ZhongYaoRongYuAdd_PAGE;
	}
	// 新闻动态-重要荣誉修改
	@RequestMapping(value = "ZhongYaoRongYuEdit.do")
	public String ZhongYaoRongYuEdit() {
		return ZhongYaoRongYuEdit_PAGE;
	}

	// 新闻动态-行业情报简报
	@RequestMapping(value = "HangYeQingBaoJianBao.do")
	public String HangYeQingBaoJianBao() {
		return HangYeQingBaoJianBao_PAGE;
	}

	// 科研活动-学术盛宴
	@RequestMapping(value = "XueShuShengYan.do")
	public String XueShuShengYan() {
		return XueShuShengYan_PAGE;
	}

	// 科研活动-重点项目
	@RequestMapping(value = "ZhongDianXiangMu.do")
	public String ZhongDianXiangMu() {
		return ZhongDianXiangMu_PAGE;
	}

	// 科研活动-科研奖励
	@RequestMapping(value = "KeYanJiangLi.do")
	public String KeYanJiangLi() {
		return KeYanJiangLi_PAGE;
	}

	// 科研活动-学术著作
	@RequestMapping(value = "XueShuZhuZuo.do")
	public String XueShuZhuZuo() {
		return XueShuZhuZuo_PAGE;
	}

	// 科研活动-软件著作
	@RequestMapping(value = "RuanJianZhuZuo.do")
	public String RuanJianZhuZuo() {
		return RuanJianZhuZuo_PAGE;
	}

	// 科研活动-专利成果
	@RequestMapping(value = "ZhuanLiChengGuo.do")
	public String ZhuanLiChengGuo() {
		return ZhuanLiChengGuo_PAGE;
	}

	// 科研活动-专家访谈
	@RequestMapping(value = "ZhuanJiaFangTan.do")
	public String ZhuanJiaFangTann() {
		return ZhuanJiaFangTan_PAGE;
	}

	// 产品方案-产品方案
	@RequestMapping(value = "ChanPinFangAn.do")
	public String ChanPinFangAn() {
		return ChanPinFangAn_PAGE;
	}

	// 招贤纳士-招贤纳士
	@RequestMapping(value = "ZhaoXianNaShi.do")
	public String ZhaoXianNaShi() {
		return ZhaoXianNaShi_PAGE;
	}

	// 招贤纳士-应聘简历
	@RequestMapping(value = "YingPinJianLi.do")
	public String YingPinJianLi() {
		return YingPinJianLi_PAGE;
	}

}
