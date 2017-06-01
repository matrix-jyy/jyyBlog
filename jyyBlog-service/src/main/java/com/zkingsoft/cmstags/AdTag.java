package com.zkingsoft.cmstags;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.services.web.WebAdService;
import com.zkingsoft.util.WebUtil;

public class AdTag extends SimpleTagSupport {

	/**
	 * 广告类型
	 */
	private String code;

	/**
	 * 变量名称
	 */
	private String var;

	/**
	 * 是否为多个
	 */
	private boolean multi = true;

	/**
	 * 获取广告
	 * 
	 * @author jiangyouyao
	 */
	public void doTag() throws JspException, IOException {

		WebAdService adService = WebUtil.getService(this.getJspContext(), SystemConstance.AD_SERVICE);
		// 查询多个
		if (multi) {
			this.getJspContext().setAttribute(var, adService.findAdByCloCode(code));
		} else {
			// 查询单个
			adService.findAdByCloCodeOne(code);
			this.getJspContext().setAttribute(var, adService.findAdByCloCodeOne(code));
		}

	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public boolean isMulti() {
		return multi;
	}

	public void setMulti(boolean multi) {
		this.multi = multi;
	}

	StringWriter sw = new StringWriter();

}