package com.zkingsoft.cmstags;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.model.web.WebArticle;
import com.zkingsoft.model.web.WebArticleType;
import com.zkingsoft.pojo.PaginationVO;
import com.zkingsoft.services.web.WebArticleService;
import com.zkingsoft.services.web.WebArticleTypeService;
import com.zkingsoft.util.StringUtils;
import com.zkingsoft.util.WebUtil;

public class ArticlesTag extends SimpleTagSupport {

	/**
	 * 文章分类的code
	 */
	private String code;

	// 分页大小
	private Integer pageSize;
	// 当前分页
	private Integer pageNow;

	/**
	 * 变量名称
	 */
	private String var;

	/**
	 * 获取一篇文章
	 * 
	 * @author jiangyouyao
	 */
	public void doTag() throws JspException, IOException {
		WebArticleService artService = WebUtil.getService(this.getJspContext(), SystemConstance.ART_SERVICE);
		WebArticleTypeService artTypeService = WebUtil.getService(this.getJspContext(),
				SystemConstance.ARTTYPE_SERVICE);
		WebArticleType type = new WebArticleType();
		WebArticle webArticle = new WebArticle();
		if (!StringUtils.isBlank(code)) {
			type.setCode(code);
			List<WebArticleType> types = artTypeService.findByModel(type);
			if (types.size() > 0) {
				webArticle.setArtTypeId(types.get(0).getArtTypeId());
				this.getJspContext().setAttribute("cate", types.get(0));
			}
		}
		// 只搜索已发布的
		webArticle.setArtIsPublish(SystemConstance.IS_Y);
		PaginationVO pageVo = new PaginationVO();
		if (pageSize != null) {
			pageVo.setLimit(pageSize);
		}
		if (pageNow != null) {
			pageVo.setOffset(pageSize * pageNow);
			int recodeCount = artService.findTotal(webArticle);
			int pageCount = 0;
			if (recodeCount % pageSize == 0) {
				pageCount = recodeCount / pageSize;
			} else {
				pageCount = recodeCount / pageSize + 1;
			}
			this.getJspContext().setAttribute("recodeCount", pageCount);
		}
		List<WebArticle> arts = artService.findInPage(webArticle, pageVo);
		this.getJspContext().setAttribute(var, arts);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNow() {
		return pageNow;
	}

	public void setPageNow(Integer pageNow) {
		this.pageNow = pageNow;
	}

	public String getVar() {
		return var;
	}

	public void setVar(String var) {
		this.var = var;
	}

	StringWriter sw = new StringWriter();

}