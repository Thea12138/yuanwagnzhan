package com.spring.util;

import info.monitorenter.cpdetector.io.ASCIIDetector;
import info.monitorenter.cpdetector.io.CodepageDetectorProxy;
import info.monitorenter.cpdetector.io.JChardetFacade;
import info.monitorenter.cpdetector.io.ParsingDetector;
import info.monitorenter.cpdetector.io.UnicodeDetector;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.charset.Charset;

import javax.xml.parsers.ParserConfigurationException;

import org.xml.sax.SAXException;

public class PageEncodeDetector {

	public static String getFileEncoding(String fpath)
			throws MalformedURLException, IOException,
			ParserConfigurationException, SAXException {
		// 网页编码
		String strencoding = null;

		File file = new File(fpath);

		/*------------------------------------------------------------------------  
		  detector是探测器，它把探测任务交给具体的探测实现类的实例完成。  
		  cpDetector内置了一些常用的探测实现类，这些探测实现类的实例可以通过add方法  
		  加进来，如ParsingDetector、 JChardetFacade、ASCIIDetector、UnicodeDetector。    
		  detector按照“谁最先返回非空的探测结果，就以该结果为准”的原则返回探测到的  
		  字符集编码。  
		--------------------------------------------------------------------------*/
		CodepageDetectorProxy detector = CodepageDetectorProxy.getInstance();
		/*-------------------------------------------------------------------------  
		  ParsingDetector可用于检查HTML、XML等文件或字符流的编码,构造方法中的参数用于  
		  指示是否显示探测过程的详细信息，为false不显示。  
		---------------------------------------------------------------------------*/
		detector.add(new ParsingDetector(false));
		/*--------------------------------------------------------------------------  
		  JChardetFacade封装了由Mozilla组织提供的JChardet，它可以完成大多数文件的编码  
		  测定。所以，一般有了这个探测器就可满足大多数项目的要求，如果你还不放心，可以  
		  再多加几个探测器，比如下面的ASCIIDetector、UnicodeDetector等。  
		 ---------------------------------------------------------------------------*/
		detector.add(JChardetFacade.getInstance());
		// ASCIIDetector用于ASCII编码测定
		detector.add(ASCIIDetector.getInstance());
		// UnicodeDetector用于Unicode家族编码的测定
		detector.add(UnicodeDetector.getInstance());
		// 得到编码字符集对象
		Charset charset = detector.detectCodepage(file.toURI().toURL());

		strencoding = charset.name();

		if (strencoding == null) {
			strencoding = "UTF-8";
		}

		return strencoding;
	}

	/*
	 * public static String getFileEncoding(String fpath) throws
	 * MalformedURLException, IOException { // 网页编码 String strencoding = null;
	 * 
	 * File file = new File(fpath);
	 * 
	 * // 定义URL对象 URL url = file.toURI().toURL(); // 获取http连接对象
	 * HttpURLConnection urlConnection = (HttpURLConnection) url
	 * .openConnection();
	 * 
	 * urlConnection.connect();
	 *//**
	 * 首先根据header信息，判断页面编码
	 */
	/*
	 * // map存放的是header信息(url页面的头信息) Map<String, List<String>> map =
	 * urlConnection.getHeaderFields(); Set<String> keys = map.keySet();
	 * Iterator<String> iterator = keys.iterator();
	 * 
	 * // 遍历,查找字符编码 String key = null; String tmp = null; while
	 * (iterator.hasNext()) { key = iterator.next(); tmp =
	 * map.get(key).toString().toLowerCase(); // 获取content-type charset if (key
	 * != null && key.equals("Content-Type")) { int m = tmp.indexOf("charset=");
	 * if (m != -1) { strencoding = tmp.substring(m + 8).replace("]", "");
	 * return strencoding; } } }
	 *//**
	 * 通过解析meta得到网页编码
	 */
	/*
	 * // 获取网页源码(英文字符和数字不会乱码，所以可以得到正确<meta/>区域) StringBuffer sb = new
	 * StringBuffer(); String line; try { BufferedReader in = new
	 * BufferedReader(new InputStreamReader( url.openStream())); while ((line =
	 * in.readLine()) != null) { sb.append(line); } in.close(); } catch
	 * (Exception e) { // Report any errors that arise System.err.println(e);
	 * System.err
	 * .println("Usage:     java     HttpClient     <URL>     [<filename>]"); }
	 * String htmlcode = sb.toString(); // 解析html源码，取出<meta />区域，并取出charset
	 * String strbegin = "<meta"; String strend = ">"; String strtmp; int begin
	 * = htmlcode.indexOf(strbegin); int end = -1; int inttmp; while (begin >
	 * -1) { end = htmlcode.substring(begin).indexOf(strend); if (begin > -1 &&
	 * end > -1) { strtmp = htmlcode.substring(begin, begin +
	 * end).toLowerCase(); inttmp = strtmp.indexOf("charset"); if (inttmp > -1)
	 * { strencoding = strtmp.substring(inttmp + 7, end) .replace("=",
	 * "").replace("/", "") .replace("\"", "").replace("\'", "") .replace(" ",
	 * ""); return strencoding; } } htmlcode = htmlcode.substring(begin); begin
	 * = htmlcode.indexOf(strbegin); }
	 *//** 根据内容 **/
	/*
	 * CodepageDetectorProxy codepageDetectorProxy = CodepageDetectorProxy
	 * .getInstance();
	 * 
	 * codepageDetectorProxy.add(JChardetFacade.getInstance());
	 * codepageDetectorProxy.add(ASCIIDetector.getInstance());
	 * codepageDetectorProxy.add(UnicodeDetector.getInstance());
	 * codepageDetectorProxy.add(new ParsingDetector(false));
	 * codepageDetectorProxy.add(new ByteOrderMarkDetector());
	 * 
	 * strencoding = codepageDetectorProxy.detectCodepage(url).name();
	 * 
	 * // 设置默认网页字符编码 if (strencoding == null) { strencoding = "UTF-8"; }
	 * 
	 * return strencoding; }
	 */

	public static String getEncoding(String str) {
		String encode = "GB2312";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) { // 判断当前字符串的编码是否为GB2312
				String s = encode;
				return s;
			}
		} catch (Exception exception) {
		}
		encode = "ISO-8859-1";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s1 = encode;
				return s1;
			}
		} catch (Exception exception1) {
		}
		encode = "UTF-8";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s2 = encode;
				return s2;
			}
		} catch (Exception exception2) {
		}
		encode = "GBK";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s3 = encode;
				return s3;
			}
		} catch (Exception exception3) {
		}
		return "";
	}
}