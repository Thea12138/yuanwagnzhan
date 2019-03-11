package com.spring.spring.exception.realize;

import com.spring.spring.exception.interfaces.Exceptionable;
import com.spring.spring.exception.interfaces.Logable;
import com.spring.spring.exception.interfaces.ServiceExceptionable;

public class ServiceException extends Exception implements Exceptionable,
		ServiceExceptionable, Logable {
	private static final long serialVersionUID = 1L;

	public ServiceException(String msg, Throwable e) {
		super(msg, e);
	}

}