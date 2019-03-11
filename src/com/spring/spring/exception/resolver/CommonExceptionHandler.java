package com.spring.spring.exception.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Component
public class CommonExceptionHandler implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3) {
		// Auto-generated method stub
		return null;
	}
	/**
	 * @Override public ModelAndView resolveException( HttpServletRequest
	 *           request, HttpServletResponse response, Object arg2, Exception
	 *           exception) {
	 * 
	 *           ModelAndView failModelAndView = new ModelAndView();
	 *           failModelAndView.setViewName(ConstantUtil.COMMON_FAIL_PAGE);
	 * 
	 *           if(exception instanceof Exceptionable){
	 *           failModelAndView.addObject(ConstantUtil.COMMON_FAIL_ALERT_KEY,
	 *           exception.getMessage()); }else{
	 *           failModelAndView.addObject(ConstantUtil.COMMON_FAIL_ALERT_KEY,
	 *           "δ�����ϵͳ�����쳣"); }
	 * 
	 *           // �����쳣��־ if(exception instanceof Logable){
	 *           //logger.error(exception.getMessage(), exception); }
	 * 
	 * 
	 *           return failModelAndView; }
	 */

}
