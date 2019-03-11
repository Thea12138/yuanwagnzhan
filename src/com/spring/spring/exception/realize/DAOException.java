package com.spring.spring.exception.realize;

import com.spring.spring.exception.interfaces.Exceptionable;
import com.spring.spring.exception.interfaces.Logable;
import com.spring.spring.exception.interfaces.DAOExceptionable;

public class DAOException extends Exception implements Exceptionable,
		DAOExceptionable, Logable {
	private static final long serialVersionUID = 1L;

	public DAOException(String msg, Throwable e) {
		super(msg, e);
	}

	public DAOException(Throwable e) {
		super("发生数据库操作错误:" + e.getMessage(), e);
	}

}