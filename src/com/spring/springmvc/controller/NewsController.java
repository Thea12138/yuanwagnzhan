package com.spring.springmvc.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.core.BaseController;
import com.spring.spring.exception.realize.DAOException;
import com.spring.springmvc.service.NewsService;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class NewsController extends BaseController {

	@Autowired
	NewsService newsservice;

	/**
	 * 获取首页上新闻（政企对接 B、通知通告 F、学术盛宴 D）的列表 入参： NewsCategory --新闻分类：领导视察 A、政企对接
	 * B、重要荣誉 C、学术盛宴 D、 专家访谈 E、通知通告 F、院务新闻 G、员工风采 H rowcount --需要获取记录的数量 出参：
	 * rows --总记录数 list
	 * {NewsID,NewsCategory,NewsTitle：标题,Synopsis：简介,LinkAddress：内容页,
	 * ThumbPicture：首页图片,PublishDate：发布日期,CreateBy：创建人}
	 **/
	@ResponseBody
	@RequestMapping(value = "GetHomeNewsList.do", method = RequestMethod.POST)
	public Map<String, Object> GetHomeNewsList(
			@RequestParam String NewsCategory, @RequestParam int rowcount) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = newsservice.GetHomeNewsList(NewsCategory, rowcount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取院务新闻列表 入参： pageno --当前页码 pagerow --每页显示数量 NewsCategory --新闻分类：领导视察
	 * A、政企对接 B、重要荣誉 C、学术盛宴 D、 专家访谈 E、通知通告 F、院务新闻 G、员工风采 H 出参： rows --总记录数 list
	 * {NewsID,NewsCategory,NewsTitle：标题,Synopsis：简介,LinkAddress：内容页,
	 * ThumbPicture：首页图片,PublishDate：发布日期,CreateBy：创建人}
	 **/
	@ResponseBody
	@RequestMapping(value = "LoadNewsList.do", method = RequestMethod.POST)
	public Map<String, Object> LoadNewsList(@RequestParam int pageno,
			@RequestParam int pagerow, @RequestParam String NewsCategory) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			pageno = pageno == 0 ? 1 : pageno;
			map = newsservice.LoadNewsList(pageno, pagerow, NewsCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/** XXXXXXXX 要替换成院务新闻前端展示html页面的名称 ***/
	private static final String page_error_PAGE = "error";
	private static final String xwdt_tztg_show_PAGE = "ChuangXinFuHua/cxfh_tztg_show"; // 新闻动态-通知通告详情
	private static final String xwdt_ldsc_show_PAGE = "XinWenDongTai/xwdt_ldsc_show"; // 新闻动态-领导视察详情
	private static final String xwdt_zqdj_show_PAGE = "XinWenDongTai/xwdt_zqdj_show"; // 新闻动态-政企对接详情
	private static final String xwdt_ygfc_show_PAGE = "XinWenDongTai/xwdt_ygfc_show"; // 新闻动态-员工风采详情
	private static final String xwdt_zyry_show_PAGE = "XinWenDongTai/xwdt_zyry_show"; // 新闻动态-重要荣誉详情
	private static final String kyhd_xssy_show_PAGE = "KeYanHuoDong/kyhd_xssy_show"; // 科研活动-学术盛宴详情
	private static final String kyhd_zjft_show_PAGE = "KeYanHuoDong/kyhd_zjft_show"; // 科研活动-专家访谈详情
	private static final String jbgk_ywxw_show_PAGE = "JiBenGaiKuang/jbgk_ywxw_show"; // 基本概况-院务新闻详情页面

	/**
	 * 获取新闻内容html 入参： NewsID NewsCategory --领导视察 A、政企对接 B、重要荣誉 C、学术盛宴 D、 专家访谈
	 * E、通知通告 F、院务新闻 G、员工风采 H
	 **/
	@RequestMapping(value = "NewsShow.do", method = RequestMethod.GET)
	public String page_show_PAGE(Model mo, @RequestParam int NewsID,
			@RequestParam String NewsCategory) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = newsservice.GetNewsShowById(NewsID);
		mo.addAllAttributes(map);
		String page = page_error_PAGE;
		switch (NewsCategory) {
		case "A":
			page = xwdt_ldsc_show_PAGE;
			break;
		case "B":
			page = xwdt_zqdj_show_PAGE;
			break;
		case "C":
			page = jbgk_ywxw_show_PAGE;
			break;
		case "D":
			page = kyhd_xssy_show_PAGE;
			break;
		case "E":
			page = kyhd_zjft_show_PAGE;
			break;
		case "F":
			page = xwdt_tztg_show_PAGE;
			break;
		case "G":
			page = jbgk_ywxw_show_PAGE;
			break;
		case "H":
			page = xwdt_ygfc_show_PAGE;
			break;
		}
		return page;

	}

	/*************** Start*******后台方法 ***********************/

	/**
	 * 增加新闻 form表单提交 参数： NewsTitle --标题 NewsCategory --类型 LinkAddress --内容页
	 * Synopsis --简介 ThumbPicture --首页图片 picturesList --图片 PublishDate --发布日期
	 * CreateBy --创建人 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "AddNews.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AddNew(HttpServletRequest request,
			HttpServletResponse response) throws IOException, DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = newsservice.AddNew(request);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;

	}

	/**
	 * 修改新闻 form表单提交 参数： NewsID NewsTitle --标题 NewsCategory --类型 LinkAddress
	 * --内容页 Synopsis --简介 ThumbPicture --首页图片 picturesList --图片 PublishDate
	 * --发布日期 CreateBy --创建人 UserID --当前登录人员ID
	 **/
	@RequestMapping(value = "EditNews.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> EditNew(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = newsservice.EditNew(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 删除新闻 入参： newsid --ID userid --当前登录人员ID
	 **/
	@ResponseBody
	@RequestMapping(value = "DelNews.do", method = RequestMethod.POST)
	public Map<String, Object> DelNew(@RequestParam int newsid,
			@RequestParam String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = newsservice.DelNew(newsid, userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 获取新闻信息 入参： newsid --ID
	 **/
	@ResponseBody
	@RequestMapping(value = "GetNewsByNewsID.do", method = RequestMethod.POST)
	public Map<String, Object> GetNewsByNewsID(int newsid) throws IOException,
			DAOException {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = newsservice.GetNewsByNewsID(newsid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/*************** end*******后台方法 ***********************/

	//新版新闻添加接口
    @RequestMapping(value = "insertNews.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertNews(HttpServletRequest request,
                                      HttpServletResponse response) throws IOException, DAOException {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            map = newsservice.insertNews(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

	//新版获取单一对象接口
	@RequestMapping(value = "getNews.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getRecord(@RequestParam("id") int id){
		Map<String, Object> result = newsservice.getRecord(id);
		return result;
	}

	//新版新闻列表
//	public Map<String, Object> listNews(@RequestParam int pageno,
//										@RequestParam int pagerow,
//										@RequestParam String NewsCategory){
//		Map<String, Object> result = new HashMap<>();
//		List
////		result.put("count", )
//    	return null;
//	}

    //添加文件到服务器，返回服务器路径地址
	@RequestMapping("uploadfile.do")
	@ResponseBody
	public String upLoadFile(HttpServletRequest request) throws IOException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
		String linkname = "";
		String path = strRealPath + "fileload/html/News/";
		String newsType = request.getParameter("NewsCategory");
		path = path + newsType + "/";
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile htmlAttachment = multipartRequest
				.getFile("LinkAddress");

    	return FileUtil.upFile(htmlAttachment,path);
	}


	@RequestMapping("testTo.do")
	public String toTest(){
    	return "test";
	}
}
