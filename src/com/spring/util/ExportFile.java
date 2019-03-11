package com.spring.util;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

public class ExportFile {

	public ResponseEntity<byte[]> download(String filePath, String fileName)
			throws IOException {

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		File uploadfujian = new File(filePath);
		return new ResponseEntity<byte[]>(
				FileUtils.readFileToByteArray(uploadfujian), headers,
				HttpStatus.CREATED);

	}

}
