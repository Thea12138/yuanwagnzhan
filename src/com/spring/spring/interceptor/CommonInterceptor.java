package com.spring.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CommonInterceptor implements HandlerInterceptor {

	// private Logger log = Logger.getLogger(CommonInterceptor.class);

	public CommonInterceptor() {
		// Auto-generated constructor stub
	}

	private String mappingURL;// ��������ӳ�䵽��Ҫ���ص�·��

	public void setMappingURL(String mappingURL) {
		this.mappingURL = mappingURL;
	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		boolean str = request.getSession().getAttribute("ifregister") == null ? false
				: Boolean.parseBoolean(request.getSession()
						.getAttribute("ifregister").toString());
		boolean str1 = request.getSession().getAttribute("ifregister1") == null ? false
				: Boolean.parseBoolean(request.getSession()
						.getAttribute("ifregister1").toString());
		if (str == false && str1 == false) {
			response.sendRedirect(request.getContextPath() + "/loginerror.do");
			// return false;
		}
		return true;
	}

	// ��ҵ��������������ִ����ɺ�,�����ͼ֮ǰִ�еĶ���
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	/**
	 * ��DispatcherServlet��ȫ����������󱻵���
	 * 
	 * �����������׳��쳣ʱ,��ӵ�ǰ���������ִ�����е���������afterCompletion()
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}