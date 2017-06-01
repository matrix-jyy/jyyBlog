package com.zkingsoft.cmstags;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.model.web.WebNav;
import com.zkingsoft.services.web.WebNavService;
import com.zkingsoft.util.StringUtils;
import com.zkingsoft.util.WebUtil;

public class FirstNavTag extends SimpleTagSupport {

	/**
	 * 导航栏类型
	 */
	private String type;

	/**
	 * 变量名称
	 */
	private String var;

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	StringWriter sw = new StringWriter();

	/**
	 * 获取指定类型下的一级导航栏
	 * 
	 * @author jiangyouyao
	 */
	public void doTag() throws JspException, IOException {

		WebNavService webNavService = WebUtil.getService(this.getJspContext(), SystemConstance.NAV_SERVICE);
		if (!StringUtils.isBlank(type) && !StringUtils.isBlank(var)) {
			WebNav webNav = new WebNav();
			webNav.setNavType(type);
			webNav.setParentId(0L);
			List<WebNav> navlist = webNavService.findByModel(webNav);
			this.getJspContext().setAttribute(var, navlist);
		}
	}

}