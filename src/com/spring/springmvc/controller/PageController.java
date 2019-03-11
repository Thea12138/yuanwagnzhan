package com.spring.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.core.BaseController;

@Controller
public class PageController extends BaseController {

	// 打开演示
	private static final String Index_PAGE = "index";
	private static final String Index_e_PAGE = "index_e";
	private static final String home_PAGE = "home"; // 首页

	// 基本概况jbgk_fzlc.do
	private static final String jbgk_wyjs_PAGE = "JiBenGaiKuang/jbgk_wyjs"; // 基本概况-我院介绍
	private static final String jbgk_xswyh_PAGE = "JiBenGaiKuang/jbgk_xswyh"; // 基本概况-学术委员会
	private static final String jbgk_yjyld_PAGE = "JiBenGaiKuang/jbgk_yjyld"; // 基本概况-研究院领导
	private static final String jbgk_zzjg_yanfazx_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_yanfazx"; // 基本概况-组织机构-研发中心
	private static final String jbgk_zzjg_jiankangs_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_jiankangs"; // 基本概况-组织机构-健康所
	private static final String jbgk_zzjg_jiaoyus_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_jiaoyus"; // 基本概况-组织机构-教育所
	private static final String jbgk_zzjg_wangluos_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_wangluos"; // 基本概况-组织机构-网络所
	private static final String jbgk_zzjg_nongyes_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_nongyes"; // 基本概况-组织机构-农业所
	private static final String jbgk_zzjg_chengshis_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_chengshis"; // 基本概况-组织机构-城市所
	private static final String jbgk_zzjg_shehuis_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_shehuis"; // 基本概况-组织机构-社会所
	private static final String jbgk_zzjg_wulius_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_wulius"; // 基本概况-组织机构-物流所
	private static final String jbgk_zzjg_qiyes_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_qiyes"; // 基本概况-组织机构-企业所
	private static final String jbgk_zzjg_shujus_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_shujus"; // 基本概况-组织机构-数据所
	private static final String jbgk_zzjg_pxnengyuan_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_pxnengyuan"; // 基本概况-组织机构-平行能源
	private static final String jbgk_zzjg_pxjiashi_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_pxjiashi"; // 基本概况-组织机构-平行驾驶
	private static final String jbgk_zzjg_pxshijue_PAGE = "JiBenGaiKuang/ZuZhiJieGou/jbgk_zzjg_pxshijue"; // 基本概况-组织机构-平行视觉
	private static final String jbgk_ywxw_frame_PAGE = "JiBenGaiKuang/jbgk_ywxw_frame"; // 基本概况-院务新闻列表
	private static final String jbgk_fzlc_PAGE = "JiBenGaiKuang/jbgk_fzlc"; // 基本概况发展历程
	private static final String jbgk_sxkxj_PAGE = "JiBenGaiKuang/jbgk_sxkxj"; // 基本概况-学术委员会

	// 新闻动态
	private static final String xwdt_tztg_frame_PAGE = "XinWenDongTai/xwdt_tztg_frame"; // 新闻动态-通知通告列表
	private static final String xwdt_ldsc_frame_PAGE = "XinWenDongTai/xwdt_ldsc_frame"; // 新闻动态-领导视察列表
	private static final String xwdt_zqdj_frame_PAGE = "XinWenDongTai/xwdt_zqdj_frame"; // 新闻动态-政企对接列表
	private static final String xwdt_ygfc_frame_PAGE = "XinWenDongTai/xwdt_ygfc_frame"; // 新闻动态-员工风采列表
	private static final String xwdt_zyry_frame_PAGE = "XinWenDongTai/xwdt_zyry_frame"; // 新闻动态-重要荣誉列表
	private static final String xwdt_hyqbjb_frame_PAGE = "XinWenDongTai/xwdt_hyqbjb_frame"; // 新闻动态-行业情报简报列表
	private static final String xwdt_zncyqk_PAGE = "XinWenDongTai/xwdt_zncyqk"; // 新闻动态-智能产业期刊

	// 科研活动
	private static final String kyhd_xssy_frame_PAGE = "KeYanHuoDong/kyhd_xssy_frame"; // 科研活动-学术盛宴列表
	private static final String kyhd_zdxm_frame_PAGE = "KeYanHuoDong/kyhd_zdxm_frame"; // 科研活动-重点项目列表
	private static final String kyhd_kycg_kyjl_PAGE = "KeYanHuoDong/kyhd_kycg_kyjl"; // 科研活动-科研成果-科研奖励
	private static final String kyhd_kycg_xszz_PAGE = "KeYanHuoDong/kyhd_kycg_xszz"; // 科研活动-科研成果-学术著作
	private static final String kyhd_kycg_rjzz_PAGE = "KeYanHuoDong/kyhd_kycg_rjzz"; // 科研活动-科研成果-软件著作所列表
	private static final String kyhd_kycg_rjzz_show_PAGE = "KeYanHuoDong/kyhd_kycg_rjzz_show"; // 科研活动-科研成果-软件著作详情
	private static final String kyhd_kycg_zlcg_PAGE = "KeYanHuoDong/kyhd_kycg_zlcg"; // 科研活动-科研成果-专利成果
	private static final String kyhd_zjft_frame_PAGE = "KeYanHuoDong/kyhd_zjft_frame"; // 科研活动-专家访谈列表

	// 产品介绍
	private static final String product_industry_PAGE = "ChanPinJieShao/product_industry"; // 产品介绍-智能产业
	private static final String product_driving_PAGE = "ChanPinJieShao/product_driving"; // 产品介绍-驾驶
	private static final String product_traffic_PAGE = "ChanPinJieShao/product_traffic"; // 产品介绍-平行交通
	private static final String product_data_PAGE = "ChanPinJieShao/product_data"; // 产品介绍-视频大数据
	private static final String product_health_PAGE = "ChanPinJieShao/product_health"; // 产品介绍-智慧健康
	private static final String product_logistics_PAGE = "ChanPinJieShao/product_logistics"; // 产品绍-智慧物流
	private static final String product_education_PAGE = "ChanPinJieShao/product_education"; // 产品介绍-智慧教育
	private static final String product_argiculture_PAGE = "ChanPinJieShao/product_argiculture"; // 产品介绍-智慧农业
	private static final String product_drone_PAGE = "ChanPinJieShao/product_drone"; // 产品介绍-无人机
	private static final String product_manufacture_PAGE = "ChanPinJieShao/product_manufacture"; // 产品介绍-智慧制造
	private static final String product_energy_PAGE = "ChanPinJieShao/product_energy"; // 产品介绍-平行能源
	private static final String product_media_PAGE = "ChanPinJieShao/product_media"; // 产品介绍-平行媒体


	private static final String zxns_zxns_frame_PAGE = "ZhaoXianNaShi/zxns_frame"; // 招贤纳士-招贤纳士列表
	private static final String zxns_zxns_content_PAGE = "ZhaoXianNaShi/zxns_content"; // 招贤纳士-招贤纳士详情

	private static final String lxwm_lxwm_PAGE = "LianXiWoMen/lxwm_lxwm"; // 联系我们-联系我们
	private static final String lxwm_zxns_PAGE = "LianXiWoMen/lxwm_zxns"; // 联系我们-招贤纳士
	private static final String lxwm_business_PAGE = "LianXiWoMen/lxwm_business"; // 联系我们-商务
	
	private static final String kxhd_kyfx_PAGE = "KeYanHuoDong/kyhd_kyfx"; // 科研活动-科研方向
	
	private static final String cxfh_fhfw_PAGE = "ChuangXinFuHua/cxfh_fhfw"; // 创新孵化-孵化服务
	private static final String cxfh_zcfc_PAGE = "ChuangXinFuHua/cxfh_zcfc"; // 创新孵化-众创风采
	private static final String cxfh_zcjj_PAGE = "ChuangXinFuHua/cxfh_zcjj"; // 创新孵化-众创基金
	private static final String cxfh_hdrl_PAGE = "ChuangXinFuHua/cxfh_hdrl"; // 创新孵化-活动日历
	private static final String cxfh_tztg_PAGE = "ChuangXinFuHua/cxfh_tztg_frame"; // 创新孵化-通知通告
	

	
	
	// 跳转页面
	@RequestMapping(value = "index.do")
	public String Index_PAGE() {
		return Index_PAGE;
	}

	// 英文页面
	@RequestMapping(value = "index_e.do")
	public String Index_e_PAGE() {
		return Index_e_PAGE;
	}

	// 首页
	@RequestMapping(value = "home.do")
	public String home() {
		return home_PAGE;
	}

	// 基本概况-我院介绍
	@RequestMapping(value = "jbgk_wyjs.do")
	public String jbgk_wyjs() {
		return jbgk_wyjs_PAGE;
	}

	// 基本概况-学术委员会
	@RequestMapping(value = "jbgk_xswyh.do")
	public String jbgk_xswyh() {
		return jbgk_xswyh_PAGE;
	}

	// 基本概况-首席科学家
		@RequestMapping(value = "jbgk_sxkxj.do")
		public String jbgk_sxkxj() {
			return jbgk_sxkxj_PAGE;
		}

	// 基本概况-研究院领导
	@RequestMapping(value = "jbgk_yjyld.do")
	public String jbgk_yjyld() {
		return jbgk_yjyld_PAGE;
	}

	// 基本概况-组织机构-研发中心
	@RequestMapping(value = "jbgk_zzjg_yanfazx.do")
	public String jbgk_zzjg_yanfazx() {
		return jbgk_zzjg_yanfazx_PAGE;
	}

	// 基本概况-组织机构-健康所
	@RequestMapping(value = "jbgk_zzjg_jiankangs.do")
	public String jbgk_zzjg_jiankangs() {
		return jbgk_zzjg_jiankangs_PAGE;
	}

	// 基本概况-组织机构-教育所
	@RequestMapping(value = "jbgk_zzjg_jiaoyus.do")
	public String jbgk_zzjg_jiaoyus() {
		return jbgk_zzjg_jiaoyus_PAGE;
	}

	// 基本概况-组织机构-网络所
	@RequestMapping(value = "jbgk_zzjg_wangluos.do")
	public String jbgk_zzjg_wangluos() {
		return jbgk_zzjg_wangluos_PAGE;
	}

	// 基本概况-组织机构-农业所
	@RequestMapping(value = "jbgk_zzjg_nongyes.do")
	public String jbgk_zzjg_nongyes() {
		return jbgk_zzjg_nongyes_PAGE;
	}

	// 基本概况-组织机构-城市所
	@RequestMapping(value = "jbgk_zzjg_chengshis.do")
	public String jbgk_zzjg_chengshis() {
		return jbgk_zzjg_chengshis_PAGE;
	}

	// 基本概况-组织机构-社会所
	@RequestMapping(value = "jbgk_zzjg_shehuis.do")
	public String jbgk_zzjg_shehuis() {
		return jbgk_zzjg_shehuis_PAGE;
	}

	// 基本概况-组织机构-物流所
	@RequestMapping(value = "jbgk_zzjg_wulius.do")
	public String jbgk_zzjg_wulius() {
		return jbgk_zzjg_wulius_PAGE;
	}

	// 基本概况-组织机构-企业所
	@RequestMapping(value = "jbgk_zzjg_qiyes.do")
	public String jjbgk_zzjg_qiyes() {
		return jbgk_zzjg_qiyes_PAGE;
	}

	// 基本概况-组织机构-数据所
	@RequestMapping(value = "jbgk_zzjg_shujus.do")
	public String jbgk_zzjg_shujus() {
		return jbgk_zzjg_shujus_PAGE;
	}

	// 基本概况-组织机构-平行能源
	@RequestMapping(value = "jbgk_zzjg_pxnengyuan.do")
	public String jbgk_zzjg_pxnengyuan() {
		return jbgk_zzjg_pxnengyuan_PAGE;
	}

	// 基本概况-组织机构-平行驾驶
	@RequestMapping(value = "jbgk_zzjg_pxjiashi.do")
	public String jbgk_zzjg_pxjiashi() {
		return jbgk_zzjg_pxjiashi_PAGE;
	}

	// 基本概况-组织机构-平行视觉
	@RequestMapping(value = "jbgk_zzjg_pxshijue.do")
	public String jbgk_zzjg_pxshijue() {
		return jbgk_zzjg_pxshijue_PAGE;
	}

	// 基本概况-院务新闻列表
	@RequestMapping(value = "jbgk_ywxw_frame.do")
	public String jbgk_ywxw_frame() {
		return jbgk_ywxw_frame_PAGE;
	}

	// 基本概况-模板下载
	@RequestMapping(value = "jbgk_fzlc.do")
	public String jbgk_fzlc_show() {
		return jbgk_fzlc_PAGE;
	}

	// 新闻动态-通知通告列表
	@RequestMapping(value = "xwdt_tztg_frame.do")
	public String xwdt_tztg_frame() {
		return xwdt_tztg_frame_PAGE;
	}

	// 新闻动态-领导视察列表
	@RequestMapping(value = "xwdt_ldsc_frame.do")
	public String xwdt_ldsc_frame() {
		return xwdt_ldsc_frame_PAGE;
	}

	// 新闻动态-政企对接列表
	@RequestMapping(value = "xwdt_zqdj_frame.do")
	public String xwdt_zqdj_frame() {
		return xwdt_zqdj_frame_PAGE;
	}

	// 新闻动态-员工风彩列表
	@RequestMapping(value = "xwdt_ygfc_frame.do")
	public String xwdt_ygfc_frame() {
		return xwdt_ygfc_frame_PAGE;
	}

	// 新闻动态-重要荣誉列表
	@RequestMapping(value = "xwdt_zyry_frame.do")
	public String xwdt_zyry_frame() {
		return xwdt_zyry_frame_PAGE;
	}

	// 新闻动态-行业情报简报列表
	@RequestMapping(value = "xwdt_hyqbjb_frame.do")
	public String xwdt_hyqbjb_frame() {
		return xwdt_hyqbjb_frame_PAGE;
	}

	// 新闻动态-智能产业期刊
	@RequestMapping(value = "xwdt_zncyqk.do")
	public String xwdt_zncyqk() {
		return xwdt_zncyqk_PAGE;
	}

	// 科研活动-科研方向
	@RequestMapping(value = "kyhd_kyfx.do")
	public String kyhd_kyfx() {
		return kxhd_kyfx_PAGE;
	}

	// 科研活动-学术盛宴列表
	@RequestMapping(value = "kyhd_xssy_frame.do")
	public String kyhd_xssy_frame() {
		return kyhd_xssy_frame_PAGE;
	}

	// 科研活动-重点项目列表
	@RequestMapping(value = "kyhd_zdxm_frame.do")
	public String kyhd_zdxm_frame() {
		return kyhd_zdxm_frame_PAGE;
	}

	// 科研活动-科研成果-科研奖励
	@RequestMapping(value = "kyhd_kycg_kyjl.do")
	public String kyhd_kycg_kyjl() {
		return kyhd_kycg_kyjl_PAGE;
	}

	// 科研活动-科研成果-学术著作
	@RequestMapping(value = "kyhd_kycg_xszz.do")
	public String kyhd_kycg_xszz() {
		return kyhd_kycg_xszz_PAGE;
	}

	// 科研活动-科研成果-软件著作所列表
	@RequestMapping(value = "kyhd_kycg_rjzz.do")
	public String kyhd_kycg_rjzz() {
		return kyhd_kycg_rjzz_PAGE;
	}

	// 科研活动-科研成果-软件著作详情
	@RequestMapping(value = "kyhd_kycg_rjzz_show.do")
	public String kyhd_kycg_rjzz_show() {
		return kyhd_kycg_rjzz_show_PAGE;
	}

	// 科研活动-科研成果-专利成果
	@RequestMapping(value = "kyhd_kycg_zlcg.do")
	public String kyhd_kycg_zlcg() {
		return kyhd_kycg_zlcg_PAGE;
	}

	// 科研活动-专家访谈列表
	@RequestMapping(value = "kyhd_zjft_frame.do")
	public String kyhd_zjft_frame() {
		return kyhd_zjft_frame_PAGE;
	}

	

	// 招贤纳士-招贤纳士列表
	@RequestMapping(value = "zxns_zxns_frame.do")
	public String zxns_zxns_frame() {
		return zxns_zxns_frame_PAGE;
	}

	// 招贤纳士-招贤纳士详情
	@RequestMapping(value = "zxns_zxns_content.do")
	public String zxns_zxns_content() {
		return zxns_zxns_content_PAGE;
	}

	// 联系我们-联系我们
	@RequestMapping(value = "lxwm_lxwm.do")
	public String lxwm_lxwm() {
		return lxwm_lxwm_PAGE;
	}
	// 联系我们-招贤纳士
	@RequestMapping(value = "lxwm_zxns.do")
	public String lxwm_zxns() {
		return lxwm_zxns_PAGE;
	}
	// 联系我们-商务
	@RequestMapping(value = "lxwm_business.do")
	public String lxwm_business() {
		return lxwm_business_PAGE;
	}
	
	// 创新孵化-孵化服务
	@RequestMapping(value = "cxfh_fhfw.do")
	public String cxfh_fhfw() {
		return cxfh_fhfw_PAGE;
	}
	
	// 创新孵化-众创风采
	@RequestMapping(value = "cxfh_zcfc.do")
	public String cxfh_zcfc() {
		return cxfh_zcfc_PAGE;
	}
	
	// 创新孵化-通知桶盖
	@RequestMapping(value = "cxfh_tztg_frame.do")
	public String cxfh_tztg_frame() {
		return cxfh_tztg_PAGE;
	}
	
	// 创新孵化-众创基金
	@RequestMapping(value = "cxfh_zcjj.do")
	public String cxfh_zcjj() {
		return cxfh_zcjj_PAGE;
	}
	
	// 创新孵化-活动日历
	@RequestMapping(value = "cxfh_hdrl.do")
	public String cxfh_hdrl() {
		return cxfh_hdrl_PAGE;
	}
	
	// 产品介绍-智能产业
	@RequestMapping(value = "product_industry.do")
	public String product_industry() {
		return product_industry_PAGE;
	}
	
	// 产品介绍-平行驾驶
	@RequestMapping(value = "product_driving.do")
	public String product_driving() {
		return product_driving_PAGE;
	}
		
	// 产品介绍-平行交通
	@RequestMapping(value = "product_traffic.do")
	public String product_traffic() {
		return product_traffic_PAGE;
	}
	// 产品介绍-视频大数据
	@RequestMapping(value = "product_data.do")
	public String product_data() {
		return product_data_PAGE;
	}

	// 产品介绍-智慧健康
	@RequestMapping(value = "product_health.do")
	public String product_health() {
		return product_health_PAGE;
	}
		
	// 产品介绍-智慧物流
	@RequestMapping(value = "product_logistics.do")
	public String product_logistics() {
		return product_logistics_PAGE;
	}
		
	// 产品介绍-智慧教育
	@RequestMapping(value = "product_education.do")
	public String product_education() {
		return product_education_PAGE;
	}
	// 产品介绍-智慧农业
	@RequestMapping(value = "product_argiculture.do")
	public String product_argiculture() {
		return product_argiculture_PAGE;
	}
	// 产品介绍-无人机
		@RequestMapping(value = "product_drone.do")
		public String product_drone() {
			return product_drone_PAGE;
		}
			
	// 产品介绍-智慧制造
	@RequestMapping(value = "product_manufacture.do")
	public String product_manufacture() {
		return product_manufacture_PAGE;
	}
		
	// 产品介绍-平行能源
	@RequestMapping(value = "product_energy.do")
	public String product_energy() {
		return product_energy_PAGE;
	}
	// 产品介绍-平行媒体
	@RequestMapping(value = "product_media.do")
	public String product_media() {
		return product_media_PAGE;
	}
}
