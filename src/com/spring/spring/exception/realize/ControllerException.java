package com.spring.spring.exception.realize;

import com.spring.spring.exception.interfaces.Exceptionable;
import com.spring.spring.exception.interfaces.Logable;
import com.spring.spring.exception.interfaces.ControllerExceptionable;

public class ControllerException extends Exception implements Exceptionable,
		ControllerExceptionable, Logable {
	private static final long serialVersionUID = 1L;

	public ControllerException(String msg, Throwable e) {
		super(msg, e);
	}

}