package com.zkingsoft.cmstags;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.model.web.WebArticleType;
import com.zkingsoft.services.web.WebArticleTypeService;
import com.zkingsoft.util.WebUtil;

public class ArticleTypeTag extends SimpleTagSupport {

	/**
	 * 文章分类名称
	 */
	private String code;

	/**
	 * 变量名称
	 */
	private String var;

	/**
	 * 获取指定的文章分类的子分类
	 * 
	 * @author jiangyouyao
	 */
	public void doTag() throws JspException, IOException {
		WebArticleTypeService artTypeService = WebUtil.getService(this.getJspContext(),
				SystemConstance.ARTTYPE_SERVICE);
		WebArticleType artType = new WebArticleType();
		artType.setCode(code);
		List<WebArticleType> types = artTypeService.findByModel(artType);
		if (!types.isEmpty()) {
			this.getJspContext().setAttribute(var, types.get(0).getChildrenType());
			this.getJspContext().setAttribute("self", types.get(0));
		}
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	StringWriter sw = new StringWriter();

}