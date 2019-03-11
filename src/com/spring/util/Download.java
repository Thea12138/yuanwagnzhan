package com.spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletResponse;

public class Download {

	public void download(HttpServletResponse response, String path, String name)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		String downLoadPath = strRealPath + "upload/" + path + name;
		String realName = name;
		File fileD = new File(downLoadPath);
		long fileLength = fileD.length();
		response.setHeader("Content-disposition", "attachment; filename="
				+ new String(realName.getBytes("utf-8"), "ISO8859-1"));
		response.setHeader("Content-Length", String.valueOf(fileLength));

		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
	}

	public int isFile(String path) throws UnsupportedEncodingException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		String downLoadFile = strRealPath + "upload/" + path;
		java.io.File f = new java.io.File(downLoadFile);

		if (f.exists()) {
			return 1;
		} else {
			return 0;
		}
	}

	public String getPath(String path) throws UnsupportedEncodingException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		path = strRealPath + "upload/" + path;
		return path;
	}
}
