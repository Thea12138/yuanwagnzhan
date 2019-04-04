package com.spring.util;


import org.springframework.web.multipart.MultipartFile;

import java.io.*;

//单例，用于全局上传文件,返回绝对路径
public class FileUtil {
    public static String upFile(MultipartFile file, String filePath) throws IOException {
        String fileName = file.getOriginalFilename();
        String newFileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
        String fullyName = filePath + newFileName;
        File file1 = new File(fullyName);
        file1.createNewFile();
        InputStream is = file.getInputStream();
        OutputStream os = new FileOutputStream(file1);
        os.write(is.read());
        is.close();
        os.close();
        return fullyName;
    }
}
