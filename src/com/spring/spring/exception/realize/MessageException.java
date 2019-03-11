package com.spring.spring.exception.realize;

import com.spring.spring.exception.interfaces.Exceptionable;
import com.spring.spring.exception.interfaces.Logable;
import com.spring.spring.exception.interfaces.MessageExceptionable;

public class MessageException extends Exception implements Exceptionable,
		MessageExceptionable, Logable {
	private static final long serialVersionUID = 1L;

	public MessageException(String msg) {
		super(msg);
	}

}