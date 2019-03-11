package com.spring.spring.exception.realize;

import com.spring.spring.exception.interfaces.AlertExceptionable;
import com.spring.spring.exception.interfaces.Exceptionable;
import com.spring.spring.exception.interfaces.Logable;

public class AlertException extends Exception implements Exceptionable,
		AlertExceptionable, Logable {
	private static final long serialVersionUID = 1L;

	public AlertException(String msg) {
		super(msg);
	}

}