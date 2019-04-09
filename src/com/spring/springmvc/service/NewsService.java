package com.spring.springmvc.service;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.core.BaseService;
import com.spring.springmvc.dao.NewsDao;
import com.spring.springmvc.domain.NewsDomain;
import com.spring.util.ConstantUtil;
import com.spring.util.ImportFile;

@Service
public class NewsService extends BaseService {

	@Autowired
	NewsDao newsdao;

	public Map<String, Object> GetHomeNewsList(String NewsCategory, int rowcount) {
		List<Map<String, Object>> list = null;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			list = newsdao.GetHomeNewsList(NewsCategory, rowcount);

			ImportFile upfile = new ImportFile();
			String dir = "";
			for (Map<String, Object> row : list) {

				/*
				 * dir = "fileload/html/News/" + row.get("NewsCategory") + "/" +
				 * row.get("NewsID") + "/Home/";
				 */
				// 不用newID作为路径
				String linkname = (String) row.get("LinkAddress");
				String picname = linkname.substring(0,
						linkname.lastIndexOf("."));
				dir = picname + "/Home/";
				String filename = upfile.getFileName(dir);

				if (filename != "") {
					dir = dir + filename;
				} else {
					dir = "";
				}

				row.put("ThumbPicture", dir);
			}

			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> LoadNewsList(int pageno, int pagerow,
			String NewsCategory) {
		List<Map<String, Object>> list = null;
		int rows = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			rows = newsdao.GetListCount(NewsCategory);
			list = newsdao.LoadNewsList(pageno, pagerow, NewsCategory);

//			ImportFile upfile = new ImportFile();
//			String dir = "";
//			for (Map<String, Object> row : list) {
//				/*
//				 * dir = "fileload/html/News/" + row.get("NewsCategory") + "/" +
//				 * row.get("NewsID") + "/Home/";
//				 */
//				// 不用newID作为路径
//				String linkname = (String) row.get("LinkAddress");
//				String picname = linkname.substring(0,
//						linkname.lastIndexOf("."));
//				dir = picname + "/Home/";
//				String filename = upfile.getFileName(dir);
//
//				if (filename != "") {
//					dir = dir + filename;
//				} else {
//					dir = "";
//				}
//
//				row.put("ThumbPicture", dir);
//			}

			map.put("rows", rows);
			map.put("list", list);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetNewsShowById(int NewsId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = newsdao.GetNewsShowById(NewsId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/*************** Start*******后台方法 ***********************/
	public Map<String, Object> AddNew(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				String strRealPath = this.getClass().getResource("/").getFile();
				strRealPath = URLDecoder.decode(strRealPath, "UTF-8")
						.substring(1);
				strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
				String path = "fileload/html/News/";// 文件存在地方

				/*
				 * 领导视察 A 政企对接 B 重要荣誉 C 学术盛宴 D 专家访谈 E 通知通告 F 院务新闻 G 员工风采 H
				 */

				String newsType = request.getParameter("NewsCategory");
				path = path + newsType + "/";

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile htmlAttachment = multipartRequest
						.getFile("LinkAddress");

				String linkname = htmlAttachment.getOriginalFilename();

				NewsDomain news = new NewsDomain();
				news.setNewsCategory(newsType);
				news.setNewsTitle(request.getParameter("NewsTitle") == null ? ""
						: request.getParameter("NewsTitle").trim());
				news.setSynopsis(request.getParameter("Synopsis") == null ? ""
						: request.getParameter("Synopsis").trim());
				news.setPublishDate(request.getParameter("PublishDate") == null ? ""
						: request.getParameter("PublishDate").trim());
				news.setCreateBy(request.getParameter("CreateBy") == null ? ""
						: request.getParameter("CreateBy").trim());
				news.setLinkAddress(linkname);

				int result = newsdao.AddNew(news,
						request.getParameter("UserID"));

				// 注释掉 不以ID作为存储目录，只以新闻分类来区分路径
				// path = path + result + "/";

				String name = linkname.substring(0, linkname.lastIndexOf("."));

				ImportFile upfile = new ImportFile();
				upfile.add(htmlAttachment, path);// 上传html;

				String pathPicture = path + name + "/";// 图片存放地方
				List<MultipartFile> picturesList = multipartRequest
						.getFiles("picturesList");
				if (picturesList != null && picturesList.size() > 0) {
					upfile.add(picturesList, pathPicture);// 上传图片
				}

				String pathAttach = pathPicture;// 附件存放地方
				List<MultipartFile> attachList = multipartRequest
						.getFiles("attachList");
				if (attachList != null && attachList.size() > 0) {
					upfile.add(attachList, pathAttach);// 上传附件
				}
				// path = path + "Home/";
				path = pathPicture + "Home/";
				MultipartFile thumbPicture = multipartRequest
						.getFile("ThumbPicture");
				if (thumbPicture != null) {
					upfile.addThunmFile2(thumbPicture, path, result);// 上传首页图片
				}

				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> EditNew(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (request.getParameter("UserID") == null
					|| "".equals(request.getParameter("UserID"))) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);
			} else {
				String strRealPath = this.getClass().getResource("/").getFile();
				strRealPath = URLDecoder.decode(strRealPath, "UTF-8")
						.substring(1);
				strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
				String path = "fileload/html/News/";// 文件存在地方

				String newsType = request.getParameter("NewsCategory");
				path = path + newsType + "/";

				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

				MultipartFile htmlAttachment = multipartRequest
						.getFile("LinkAddress");
				String linkname = "";
				if (htmlAttachment != null) {
					linkname = htmlAttachment.getOriginalFilename();
				}

				NewsDomain news = new NewsDomain();
				news.setNewsID(request.getParameter("NewsID") == null ? 0
						: Integer.parseInt(request.getParameter("NewsID")
								.trim()));
				news.setNewsCategory(newsType);
				news.setNewsTitle(request.getParameter("NewsTitle") == null ? ""
						: request.getParameter("NewsTitle").trim());
				news.setSynopsis(request.getParameter("Synopsis") == null ? ""
						: request.getParameter("Synopsis").trim());
				news.setPublishDate(request.getParameter("PublishDate") == null ? ""
						: request.getParameter("PublishDate").trim());

				news.setCreateBy(request.getParameter("CreateBy") == null ? ""
						: request.getParameter("CreateBy").trim());
				news.setLinkAddress(linkname);

				int result = newsdao.EditNew(news,
						request.getParameter("UserID"));

				/*
				 * path = path +
				 * Integer.parseInt(request.getParameter("NewsID")) + "/";
				 */

				if (linkname == "") {
					linkname = request.getParameter("editlink").toString();
				}
				String name = linkname.substring(0, linkname.lastIndexOf("."));

				String pathPicture = path + name + "/";// 图片存放地方

				List<MultipartFile> picturesList = multipartRequest
						.getFiles("picturesList");

				ImportFile upfile = new ImportFile();
				if (htmlAttachment != null) {
					if (picturesList != null && picturesList.size() > 0) {
						upfile.deleteDirectory(path);
					}
					upfile.add(htmlAttachment, path);// 上传html;
				}

				if (picturesList != null && picturesList.size() > 0) {
					upfile.deleteDirectory(pathPicture);
					upfile.add(picturesList, pathPicture);// 上传图片
				}

				String pathAttach = pathPicture;// 附件存放地方
				List<MultipartFile> attachList = multipartRequest
						.getFiles("attachList");

				if (attachList != null && attachList.size() > 0) {
					upfile.deleteDirectory(pathAttach);
					upfile.add(attachList, pathAttach);// 上传附件
				}

				// path = path + "Home/";
				path = pathPicture + "Home/";

				MultipartFile thumbPicture = multipartRequest
						.getFile("ThumbPicture");
				if (thumbPicture != null) {
					upfile.deleteDirectory(path);
					upfile.addThunmFile2(thumbPicture, path,
							Integer.parseInt(request.getParameter("NewsID")));// 上传首页图片
				}

				if (result != 0) {
					map.put("exec_code", 1);
					map.put("fail_code", -1);
				} else {
					map.put("exec_code", 0);
					map.put("fail_code", 1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> DelNew(int NewsID, String userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if (userid == null || "".equals(userid)) {
				map.put("exec_code", 0);
				map.put("fail_code", ConstantUtil.User_IsLose);

			} else {
				int result = newsdao.DelNew(NewsID, userid);
				map.put("exec_code", result);
				map.put("fail_code", -1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> GetNewsByNewsID(int NewsID) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Map<String, Object> row = newsdao.GetNewsByNewsID(NewsID);

			String linkname = row.get("LinkAddress").toString();
			linkname = linkname.substring(0, linkname.lastIndexOf("."));
			ImportFile upfile = new ImportFile();
			String dir = "fileload/html/News/" + row.get("NewsCategory") + "/"
					+ row.get("NewsID") + "/" + linkname + "/";
			List<String> picturesList = upfile.getFileNames(dir);

			String hdir = "fileload/html/News/" + row.get("NewsCategory") + "/"
					+ row.get("NewsID") + "/Home/";
			String picture = upfile.getFileName(hdir);

			map.put("NewsID",
					row.get("NewsID") == null
							|| "".equals(row.get("NewsID").toString()) ? 0
							: Integer.parseInt(row.get("NewsID").toString()));
			map.put("NewsTitle",
					row.get("NewsTitle") == null
							|| "".equals(row.get("NewsTitle").toString()) ? ""
							: row.get("NewsTitle").toString());
			map.put("CreateBy",
					row.get("CreateBy") == null
							|| "".equals(row.get("CreateBy").toString()) ? ""
							: row.get("CreateBy").toString());
			map.put("PublishDate",
					row.get("PublishDate") == null
							|| "".equals(row.get("PublishDate").toString()) ? ""
							: row.get("PublishDate").toString());
			map.put("LinkAddress",
					row.get("LinkAddress") == null
							|| "".equals(row.get("LinkAddress").toString()) ? ""
							: row.get("LinkAddress").toString());
			map.put("Synopsis",
					row.get("Synopsis") == null
							|| "".equals(row.get("Synopsis").toString()) ? ""
							: row.get("Synopsis").toString());

			if (picture == "") {
				map.put("ThumbPicture", "");
			} else {
				map.put("ThumbPicture", picture);
			}
			map.put("picturesList", picturesList);
			map.put("exec_code", 1);
			map.put("fail_code", -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	/*************** end*******后台方法 ***********************/

	//添加新闻(新)
    public Map<String, Object> insertNews(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        NewsDomain domain = new NewsDomain();
        try{
			BindData(request, domain);
			newsdao.insertNews(domain, request.getParameter("UserID"));
		}catch (Exception e){
        	e.printStackTrace();
		}
//        try {
//            if (request.getParameter("UserID") == null
//                    || "".equals(request.getParameter("UserID"))) {
//                map.put("exec_code", 0);
//                map.put("fail_code", ConstantUtil.User_IsLose);
//            } else {
//                String strRealPath = this.getClass().getResource("/").getFile();
//                strRealPath = URLDecoder.decode(strRealPath, "UTF-8")
//                        .substring(1);
//                strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
//                String path = "fileload/html/News/";// 文件存在地方
//
//                /*
//                 * 领导视察 A 政企对接 B 重要荣誉 C 学术盛宴 D 专家访谈 E 通知通告 F 院务新闻 G 员工风采 H
//                 */
//
//                String newsType = request.getParameter("NewsCategory");
//                path = path + newsType + "/";
//
//                MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//                MultipartFile htmlAttachment = multipartRequest
//                        .getFile("LinkAddress");
//
//                String linkname = htmlAttachment.getOriginalFilename();
//
//                NewsDomain news = new NewsDomain();
//                news.setNewsCategory(newsType);
//                news.setNewsTitle(request.getParameter("NewsTitle") == null ? ""
//                        : request.getParameter("NewsTitle").trim());
//                news.setSynopsis(request.getParameter("Synopsis") == null ? ""
//                        : request.getParameter("Synopsis").trim());
//                news.setPublishDate(request.getParameter("PublishDate") == null ? ""
//                        : request.getParameter("PublishDate").trim());
//                news.setCreateBy(request.getParameter("CreateBy") == null ? ""
//                        : request.getParameter("CreateBy").trim());
//                news.setLinkAddress(linkname);
//
//                int result = newsdao.AddNew(news,
//                        request.getParameter("UserID"));
//
//                // 注释掉 不以ID作为存储目录，只以新闻分类来区分路径
//                // path = path + result + "/";
//
//                String name = linkname.substring(0, linkname.lastIndexOf("."));
//
//                ImportFile upfile = new ImportFile();
//                upfile.add(htmlAttachment, path);// 上传html;
//
//                String pathPicture = path + name + "/";// 图片存放地方
//                List<MultipartFile> picturesList = multipartRequest
//                        .getFiles("picturesList");
//                if (picturesList != null && picturesList.size() > 0) {
//                    upfile.add(picturesList, pathPicture);// 上传图片
//                }
//
//                String pathAttach = pathPicture;// 附件存放地方
//                List<MultipartFile> attachList = multipartRequest
//                        .getFiles("attachList");
//                if (attachList != null && attachList.size() > 0) {
//                    upfile.add(attachList, pathAttach);// 上传附件
//                }
//                // path = path + "Home/";
//                path = pathPicture + "Home/";
//                MultipartFile thumbPicture = multipartRequest
//                        .getFile("ThumbPicture");
//                if (thumbPicture != null) {
//                    upfile.addThunmFile2(thumbPicture, path, result);// 上传首页图片
//                }
//
//                if (result != 0) {
//                    map.put("exec_code", 1);
//                    map.put("fail_code", -1);
//                } else {
//                    map.put("exec_code", 0);
//                    map.put("fail_code", 1);
//                }
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return map;
    }

	private void BindData(HttpServletRequest request, NewsDomain domain) {
    	domain.setNewsCategory(request.getParameter("category"));
		domain.setNewsTitle(request.getParameter("title"));
		domain.setPublishDate(request.getParameter("publishDate"));
		domain.setCreateBy(request.getParameter("createBy"));
		domain.setHtmlContent(request.getParameter("content"));
	}

	public int updateNews(HttpServletRequest request){
		NewsDomain domain = new NewsDomain();
		BindData(request, domain);
		domain.setNewsID(Integer.parseInt(request.getParameter("id")));
		try {
			return newsdao.updateNews(domain, request.getParameter("UserID"));
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return 0;
	}
	
	public Map<String, Object> getRecord(int id){
		return newsdao.getRecord(id);
	}
//	List<Map<String, Object>> LoadNewsList(int pageno, int pagerow,
//										   String NewsCategory) {
//
//	}
}
