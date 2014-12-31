package com.slapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 拦截所有请求，判断用户是否已经登录
 * 
 * @author shaoling727
 *
 */
public class UserLoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0,
			HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		Object object = request.getSession().getAttribute("user");
		System.out.println(request.getRequestURI()+".."+object);
		if (object == null) {
			response.sendRedirect("/geedi/toLogin");
			return false;
		}
		return true;
	}

}
