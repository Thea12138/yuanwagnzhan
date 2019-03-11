package com.spring.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.fileupload.FileItem;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class FileUploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5509604577366597912L;

	public void doPost(List<FileItem> list, String path)

	throws ServletException, IOException {

		try {

			int piccount = 1;
			String fileName = "";
			List<String> piclist = new ArrayList<>();

			for (FileItem item : list) {

				if (item.isFormField()) { // 过滤掉表单中非文件域

					/*
					 * String name = item.getFieldName();// input name
					 * 
					 * String value = item.getString();// input content
					 * 
					 * request.setAttribute(name, value);
					 */

				} else {

					String name = item.getFieldName();// input name

					String value = item.getName();// input content

					if (value != "") {

						value = value.substring(value.lastIndexOf("\\") + 1,
								value.length());

						if (!name.equals("picturesList") && !name.equals("img")) {

							if (value.indexOf(".") != -1) {
								fileName = name
										+ value.substring(value.indexOf("."),
												value.length());
							}

							// output file

							OutputStream fileOutStream = new FileOutputStream(
									new File(path, fileName));

							// input file

							InputStream fileInputStream = item.getInputStream();

							// file buffer

							byte[] buffer = new byte[1024];

							// read

							int length = 0;

							while ((length = fileInputStream.read(buffer)) > 0) {

								fileOutStream.write(buffer, 0, length);

							}

							// close

							fileInputStream.close();

							fileOutStream.close();

							item.write(new File(path, fileName));

						} else {

							String newName = "";
							if (value.indexOf(".") != -1) {
								newName = "img"
										+ piccount
										+ value.substring(value.indexOf("."),
												value.length());
							}

							piclist.add(value + "," + newName);

							piccount++;

							// output file
							OutputStream fileOutStream = new FileOutputStream(
									new File(path, newName));

							// input file

							InputStream fileInputStream = item.getInputStream();

							// file buffer

							byte[] buffer = new byte[1024];

							// read

							int length = 0;

							while ((length = fileInputStream.read(buffer)) > 0) {

								fileOutStream.write(buffer, 0, length);

							}

							// close

							fileInputStream.close();

							fileOutStream.close();

							item.write(new File(path, newName));

						}
					}

				}

			}

			if (fileName != "") {

				String fileurl = path + "/" + fileName;

				String strencoding = PageEncodeDetector
						.getFileEncoding(fileurl);

				File input = new File(fileurl);

				Document doc = Jsoup.parse(input, strencoding);

				Elements links = doc.select("img[src]");

				String picname = "";
				String picvalue = "";

				for (Element link : links) {

					String imgsrc = link.attr("src");
					imgsrc = imgsrc.substring(imgsrc.lastIndexOf("/") + 1,
							imgsrc.length());

					for (int i = 0; i < piclist.size(); i++) {

						picname = piclist.get(i).split(",")[0];
						picvalue = piclist.get(i).split(",")[1];

						if (imgsrc.equals(picname)) {
							link.attr("src", picvalue);

							break;
						}
					}
				}

				FileOutputStream fos = new FileOutputStream(input, false);
				OutputStreamWriter osw = new OutputStreamWriter(fos,
						strencoding);
				osw.write(doc.html());
				osw.close();
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public void doPost(FileItem item, String path, int fileName1)

	throws ServletException, IOException {

		try {

			int piccount = 1;
			String fileName = "";
			List<String> piclist = new ArrayList<>();
			if (item.isFormField()) { // 过滤掉表单中非文件域

			} else {

				String name = item.getFieldName();// input name

				String value = item.getName();// input content

				if (value != "") {

					value = value.substring(value.lastIndexOf("\\") + 1,
							value.length());

					if (!name.equals("picturesList")
							&& !name.equals("ThumbPicture")) {

						if (value.indexOf(".") != -1) {
							fileName = name
									+ value.substring(value.indexOf("."),
											value.length());
						}

						// output file

						OutputStream fileOutStream = new FileOutputStream(
								new File(path, fileName));

						// input file

						InputStream fileInputStream = item.getInputStream();

						// file buffer

						byte[] buffer = new byte[1024];

						// read

						int length = 0;

						while ((length = fileInputStream.read(buffer)) > 0) {

							fileOutStream.write(buffer, 0, length);

						}
						// close

						fileInputStream.close();

						fileOutStream.close();

						item.write(new File(path, fileName));

					} else if (name.equals("picturesList")) {
						String newName = "";
						if (value.indexOf(".") != -1) {
							newName = name
									+ value.substring(value.indexOf("."),
											value.length());
						}

						// output file

						OutputStream fileOutStream = new FileOutputStream(
								new File(path, newName));

						// input file

						InputStream fileInputStream = item.getInputStream();

						// file buffer

						byte[] buffer = new byte[1024];

						// read

						int length = 0;

						while ((length = fileInputStream.read(buffer)) > 0) {

							fileOutStream.write(buffer, 0, length);

						}

						// close

						fileInputStream.close();

						fileOutStream.close();

						item.write(new File(path, newName));

					} else if (name.equals("ThumbPicture")) {

						String newName = "";
						if (value.indexOf(".") != -1) {
							newName = fileName1
									+ value.substring(value.indexOf("."),
											value.length());
						}

						// output file

						OutputStream fileOutStream = new FileOutputStream(
								new File(path, newName));

						// input file

						InputStream fileInputStream = item.getInputStream();

						// file buffer

						byte[] buffer = new byte[1024];

						// read

						int length = 0;

						while ((length = fileInputStream.read(buffer)) > 0) {

							fileOutStream.write(buffer, 0, length);

						}

						// close

						fileInputStream.close();

						fileOutStream.close();

						item.write(new File(path, newName));
					}
				}

			}

			if (fileName != "") {

				String fileurl = path + "/" + fileName;

				String strencoding = PageEncodeDetector
						.getFileEncoding(fileurl);

				File input = new File(fileurl);

				Document doc = Jsoup.parse(input, strencoding);

				Elements links = doc.select("img[src]");

				String picname = "";
				String picvalue = "";

				for (Element link : links) {

					String imgsrc = link.attr("src");
					imgsrc = imgsrc.substring(imgsrc.lastIndexOf("/") + 1,
							imgsrc.length());

					for (int i = 0; i < piclist.size(); i++) {

						picname = piclist.get(i).split(",")[0];
						picvalue = piclist.get(i).split(",")[1];

						if (imgsrc.equals(picname)) {
							link.attr("src", picvalue);

							break;
						}
					}
				}

				FileOutputStream fos = new FileOutputStream(input, false);
				OutputStreamWriter osw = new OutputStreamWriter(fos,
						strencoding);
				osw.write(doc.html());
				osw.close();
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public boolean deleteFile(String sPath) {
		// 如果sPath不以文件分隔符结尾，自动添加文件分隔符
		if (!sPath.endsWith(File.separator)) {
			sPath = sPath + File.separator;
		}
		File dirFile = new File(sPath);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			return false;
		}
		// 删除文件夹下的所有文件(包括子目录)
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				if (files[i].isFile() && files[i].exists()) {
					File file = new File(files[i].getAbsolutePath());
					file.delete();
				}
			} // 删除子目录
			else {
				deleteDirectory(files[i].getAbsolutePath());
			}
		}

		return true;

	}

	public boolean deleteDirectory(String sPath) {
		// 如果sPath不以文件分隔符结尾，自动添加文件分隔符
		if (!sPath.endsWith(File.separator)) {
			sPath = sPath + File.separator;
		}
		File dirFile = new File(sPath);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			return false;
		}
		// 删除文件夹下的所有文件(包括子目录)
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				if (files[i].isFile() && files[i].exists()) {
					File file = new File(files[i].getAbsolutePath());
					file.delete();
				}
			} // 删除子目录
			else {
				deleteDirectory(files[i].getAbsolutePath());
			}
		}

		// 删除文件夹
		if (dirFile.delete()) {
			return true;
		} else {
			return false;
		}

	}
}
