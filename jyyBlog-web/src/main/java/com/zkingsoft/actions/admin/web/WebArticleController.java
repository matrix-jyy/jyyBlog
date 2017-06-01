package com.zkingsoft.actions.admin.web;

import java.util.Date;

import javax.annotation.Resource;

import com.zkingsoft.services.web.WebArticleService;
import com.zkingsoft.pojo.PaginationVO;
import com.zkingsoft.model.web.WebArticle;
import com.zkingsoft.authority.Authority;
import com.zkingsoft.authority.MatrixAdapter;
import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.anotations.SaveRequestToken;
import com.zkingsoft.util.WebUtil;
import com.zkingsoft.constraint.BaseController;
import com.zkingsoft.exception.GlobleException;
import com.zkingsoft.pojo.AjaxResult;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zkingsoft.anotations.RemoveRequestToken;

/**
 * @author 陈才
 * @date 2016-12-01 10:36
 */
@Controller
@RequestMapping(value = "admin/webArticle")
public class WebArticleController extends BaseController {

	@Resource
	private WebArticleService webArticleService;

	@Resource(name = "authorityAdapter")
	private Authority authorityAdapter;

	// 记录编辑前的值Before_Edit_Value
	public static final String BEV = "WebArticle_BEV";

	public static final String fnCode = "WebArticle";
	public static final String search = fnCode + ":search";
	public static final String edit = fnCode + ":edit";
	public static final String del = fnCode + ":del";
	public static final String add = fnCode + ":add";
	public static final String publish = fnCode + ":publish";

	/**
	 * 列表显示
	 */
	@RequestMapping(value = "/showList")
	public @ResponseBody AjaxResult showList(WebArticle webArticle, PaginationVO pageVo) {
		authorityAdapter.isBtnPermitted(search);
		return showList(webArticleService, webArticle, pageVo);
	}

	/**
	 * 新增或者修改页面
	 */
	@RemoveRequestToken
	@RequestMapping(value = "/addOrModify")
	public @ResponseBody AjaxResult addOrModify(WebArticle webArticle) {
		if (webArticle.getArtId() != null) {
			authorityAdapter.isBtnPermitted(edit);
			AjaxResult result = modify(webArticleService, WebUtil.getSessionAttribute(this.BEV), webArticle, "文章");
			WebUtil.removeSessionAttribute(this.BEV);
			return result;
		} else {
			authorityAdapter.isBtnPermitted(add);
			webArticle.setArtCreatetiem(new Date());
			return add(webArticleService, webArticle, "文章");
		}
	}

	/**
	 * 进入修改界面
	 */
	@SaveRequestToken
	@RequestMapping(value = "/editForm")
	public String editForm(Long id) {
		authorityAdapter.isBtnPermitted(edit);
		WebArticle webArticle;
		if (id != null) {
			webArticle = webArticleService.findById(id);
			WebUtil.getRequest().setAttribute("obj", webArticle);
			WebUtil.setSessionAttribute(this.BEV, webArticle);
		}
		return "admin/web/article-form";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/del")
	public @ResponseBody AjaxResult del(String keys) {
		authorityAdapter.isBtnPermitted(del);
		return remove(webArticleService, keys);
	}

	/**
	 * 发布文章或者文章下架
	 */
	@RequestMapping(value = "/publish")
	public @ResponseBody AjaxResult publish(Long id, Integer status) {
		authorityAdapter.isBtnPermitted(publish);
		String msg;
		WebArticle webArticle = webArticleService.findById(id);
		if (webArticle == null || status==null) {
			throw new GlobleException("无效数据");
		}
		if (status == 1) {
			msg = "发布成功";
			webArticle.setArtIsPublish(SystemConstance.IS_Y);
		} else if (status == 2) {
			msg = "撤回成功";
			webArticle.setArtIsPublish(SystemConstance.IS_N);
		} else {
			throw new GlobleException("无效数据");
		}
		int i = webArticleService.modifyByModel(webArticle);
		return i > 0 ? new AjaxResult(AjaxResult.STATUS_OK, msg) : new AjaxResult(AjaxResult.STATUS_ERR, msg);
	}

}