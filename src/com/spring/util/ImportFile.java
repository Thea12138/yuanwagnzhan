package com.spring.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class ImportFile {

	public String getFileName(String strPath) throws IOException {
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		strPath = strRealPath + strPath;
		File dir = new File(strPath);
		File[] files = dir.listFiles(); // 该文件目录下文件全部放入数组
		String fileName = "";
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				fileName = files[i].getName();
			}
		}
		return fileName;
	}

	public List<String> getFileNames(String strPath) throws IOException {
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		strPath = strRealPath + strPath;
		File dir = new File(strPath);
		File[] files = dir.listFiles(); // 该文件目录下文件全部放入数组
		List<String> fileNames = new ArrayList<String>();
		if (files != null) {
			for (int i = 0; i < files.length; i++) {
				fileNames.add(files[i].getName());
			}
		}
		return fileNames;
	}

	public String add(MultipartFile file, String filePath, long fileid)
			throws IOException {

		String filename = file.getOriginalFilename();

		if (filename != "") {
			// 获取项目地址
			String strRealPath = this.getClass().getResource("/").getFile();
			strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
			strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

			filePath = strRealPath + "upload/" + filePath + fileid;
			File uploadfujian = new File(filePath);
			if (!uploadfujian.exists()) {
				uploadfujian.mkdirs();
			}

			filePath = filePath + "/" + filename;
			if (file != null && !file.getOriginalFilename().trim().equals("")) {
				FileOutputStream outfujian = new FileOutputStream(filePath);
				FileCopyUtils.copy(file.getBytes(), outfujian);// 上传代码
				outfujian.close();
			}
			return file.getOriginalFilename();
		} else {
			return "";
		}
	}

	public String add(MultipartFile file, String filePath) throws IOException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		filePath = strRealPath + filePath;

		File uploadfujian = new File(filePath);
		if (!uploadfujian.exists()) {
			uploadfujian.mkdirs();
		}

		String filename = file.getOriginalFilename();
		filePath = filePath + "/" + filename;
		if (file != null && !file.getOriginalFilename().trim().equals("")) {
			FileOutputStream outfujian = new FileOutputStream(filePath);
			FileCopyUtils.copy(file.getBytes(), outfujian);// 上传代码
			outfujian.close();
		}
		return file.getOriginalFilename();
	}

	public String add(List<MultipartFile> files, String filePath)
			throws IOException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		filePath = strRealPath + filePath;

		File uploadfujian = new File(filePath);
		if (!uploadfujian.exists()) {
			uploadfujian.mkdirs();
		}

		String path1 = "";
		for (MultipartFile file : files) {
			String filename = file.getOriginalFilename();
			path1 = filePath + "/" + filename;
			if (file != null && !file.getOriginalFilename().trim().equals("")) {
				FileOutputStream outfujian = new FileOutputStream(path1);
				FileCopyUtils.copy(file.getBytes(), outfujian);// 上传代码
				outfujian.close();
			}
		}

		return "";
	}

	public String addHomePic(MultipartFile file, String filePath, int fileid)
			throws IOException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		filePath = strRealPath + filePath + fileid;

		File uploadfujian = new File(filePath);
		if (!uploadfujian.exists()) {
			uploadfujian.mkdirs();
		}

		String filename = file.getOriginalFilename();
		filePath = filePath + "/" + filename;
		if (file != null && !file.getOriginalFilename().trim().equals("")) {
			FileOutputStream outfujian = new FileOutputStream(filePath);
			FileCopyUtils.copy(file.getBytes(), outfujian);// 上传代码
			outfujian.close();
		}
		return file.getOriginalFilename();
	}

	public String addThunmFile2(MultipartFile file, String filePath, int fileid)
			throws IOException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		filePath = strRealPath + filePath;
		File uploadfujian = new File(filePath);
		if (!uploadfujian.exists()) {
			uploadfujian.mkdirs();
		}
		filePath = filePath + "/" + file.getOriginalFilename();
		if (file != null && !file.getOriginalFilename().trim().equals("")) {
			FileOutputStream outfujian = new FileOutputStream(filePath);
			FileCopyUtils.copy(file.getBytes(), outfujian);// 上传代码
			outfujian.close();
		}
		return "";
	}

	public String addThunmFile(MultipartFile file, String filePath, int fileid)
			throws IOException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		filePath = strRealPath + filePath + "/" + fileid;
		File uploadfujian = new File(filePath);
		if (!uploadfujian.exists()) {
			uploadfujian.mkdirs();
		}
		filePath = filePath
				+ "/"
				+ fileid
				+ file.getOriginalFilename().substring(
						file.getOriginalFilename().lastIndexOf("."),
						file.getOriginalFilename().length());
		if (file != null && !file.getOriginalFilename().trim().equals("")) {
			FileOutputStream outfujian = new FileOutputStream(filePath);
			FileCopyUtils.copy(file.getBytes(), outfujian);// 上传代码
			outfujian.close();
		}
		return "";
	}

	public void deletefile(String file, String filePath, long fileid)
			throws UnsupportedEncodingException {
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		filePath = strRealPath + "upload/" + filePath + fileid + "/" + file;
		File files = new File(filePath);
		if (files.isFile() && files.exists()) {
			files.delete();
		}
	}

	public boolean deleteDirectory(String sPath)
			throws UnsupportedEncodingException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");

		sPath = strRealPath + sPath;
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
		if (dirFile.delete()) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteFiles(String sPath)
			throws UnsupportedEncodingException {
		// 获取项目地址
		String strRealPath = this.getClass().getResource("/").getFile();
		strRealPath = URLDecoder.decode(strRealPath, "UTF-8").substring(1);
		strRealPath = strRealPath.replaceAll("WEB-INF/classes/", "");
		sPath = strRealPath + sPath;
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
		// if (dirFile.delete()) {
		return true;
		// } else {
		// return false;
		// }
	}
}
