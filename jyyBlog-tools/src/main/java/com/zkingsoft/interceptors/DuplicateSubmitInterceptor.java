package com.zkingsoft.interceptors;

import java.lang.reflect.Method;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.zkingsoft.anotations.RemoveRequestToken;
import com.zkingsoft.anotations.SaveRequestToken;
import com.zkingsoft.exception.GlobleException;
import com.zkingsoft.util.WebUtil;

/**
 * 防止重复提交的拦截器
 * 
 * @author guchunxia 2016.08.19
 *
 */
public class DuplicateSubmitInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Method method = handlerMethod.getMethod();
		SaveRequestToken saveToken = method.getAnnotation(SaveRequestToken.class);
		RemoveRequestToken removeToken = method.getAnnotation(RemoveRequestToken.class);
		HttpSession session = request.getSession();
		if (saveToken != null) {
			String token = UUID.randomUUID().toString();
			String tokenUrl = request.getServletPath();
			session.setAttribute("token", token);
			session.setAttribute("tokenUrl", tokenUrl);
			session.setAttribute(tokenUrl, token);
			// 保存操作，验证是否重复提交
		} else if (removeToken != null) {
			String clinetToken = request.getParameter("token");
			String url = request.getParameter("tokenUrl");
			String serverToken = (String) WebUtil.getSession().getAttribute(url);
			// 判断是否是重复提交了,是的话抛出异常
			boolean isReapet = isRepeatSubmit(clinetToken, serverToken);
			if (isReapet) {
				throw new GlobleException("重复提交");
			}
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Method method = handlerMethod.getMethod();
		RemoveRequestToken removeToken = method.getAnnotation(RemoveRequestToken.class);
		if (removeToken != null) {
			// 提交后则清除session
			HttpSession session = request.getSession();
			String url = request.getParameter("tokenUrl");
			session.removeAttribute(url);
		}
		super.postHandle(request, response, handler, modelAndView);
	}

	private boolean isRepeatSubmit(String clinetToken, String serverToken) {
		// 没有进入编辑页面，直接访问url,则服务端的token为空，不允许提交,视为重复提交
		if (serverToken == null) {
			return true;
		}
		if (clinetToken == null) {
			return true;
		}
		// 传过来的和保存在session中的token不一致的话是重复
		if (!serverToken.equals(clinetToken)) {
			return true;
		}
		return false;
	}

}
