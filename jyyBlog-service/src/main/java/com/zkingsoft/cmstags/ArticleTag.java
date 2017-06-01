package com.zkingsoft.cmstags;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.model.web.WebArticle;
import com.zkingsoft.services.web.WebArticleService;
import com.zkingsoft.util.WebUtil;

public class ArticleTag extends SimpleTagSupport {

	/**
	 * 文章标题
	 */
	private String title;

	/**
	 * 文章id
	 */
	private Long id;

	/**
	 * 变量名称
	 */
	private String var;
	/**
	 * 是否查询上一篇和下一篇，只查询同分类下的文章
	 */
	private boolean queryAround;

	/**
	 * 获取一篇文章
	 * 
	 * @author jiangyouyao
	 */
	public void doTag() throws JspException, IOException {

		WebArticleService artService = WebUtil.getService(this.getJspContext(), SystemConstance.ART_SERVICE);
		WebArticle art = new WebArticle();
		if (id != null) {
			art = artService.findById(id);
		} else if (title != null) {
			art.setArtTitle(title);
			art = artService.findByTitle(title);
		}
		// 查询上一篇下一篇
		if (queryAround && art.getArtId() != null) {
			this.getJspContext().setAttribute("prev", artService.findAround(art.getArtId(),-1));
			this.getJspContext().setAttribute("next", artService.findAround(art.getArtId(),1));
		}
		this.getJspContext().setAttribute(var, art);
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	public boolean isQueryAround() {
		return queryAround;
	}

	public void setQueryAround(boolean queryAround) {
		this.queryAround = queryAround;
	}

	StringWriter sw = new StringWriter();

}