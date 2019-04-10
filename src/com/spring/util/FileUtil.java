package com.spring.util;


import org.springframework.web.multipart.MultipartFile;

import java.io.*;

//用于全局上传文件,返回绝对路径
public class FileUtil {
    public static String upFile(MultipartFile file, String realFilePath, String path) throws IOException {
        String fileName = file.getOriginalFilename();
        String newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
        StringBuilder result = new StringBuilder("www.qaii.cn/");
        result.append(path);
        result.append(newFileName);
        String fullyName = realFilePath + newFileName;
//        File file1 = new File(fullyName);
        File dir = new File(realFilePath);
        byte[] bs = new byte[1024];
        int len;
        try{
            if (!dir.exists())
                dir.mkdir();
//            file1.createNewFile();
            InputStream is = file.getInputStream();
            OutputStream os = new FileOutputStream(fullyName);
//            while (is.read(bs) != -1)
//                os.write(bs);
            while ((len = is.read(bs))!= -1)
                os.write(bs, 0, len);
//            os.write(is.read());
            is.close();
            os.close();
        } catch (IOException e){
            e.printStackTrace();
        }

        return result.toString();
    }
}
