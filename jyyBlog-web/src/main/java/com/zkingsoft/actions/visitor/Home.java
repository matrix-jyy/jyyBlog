package com.zkingsoft.actions.visitor;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.DispatcherServlet;

import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.constraint.BaseController;
import com.zkingsoft.model.bus.BusParameterSettings;
import com.zkingsoft.model.web.WebAdcolumn;
import com.zkingsoft.model.web.WebArticle;
import com.zkingsoft.model.web.WebArticleType;
import com.zkingsoft.model.web.WebMsg;
import com.zkingsoft.model.web.WebNav;
import com.zkingsoft.pojo.AjaxResult;
import com.zkingsoft.pojo.PaginationVO;
import com.zkingsoft.services.bus.BusParameterSettingsService;
import com.zkingsoft.services.web.WebAdService;
import com.zkingsoft.services.web.WebAdcolumnService;
import com.zkingsoft.services.web.WebArticleService;
import com.zkingsoft.services.web.WebArticleTypeService;
import com.zkingsoft.services.web.WebMsgService;
import com.zkingsoft.services.web.WebNavService;
import com.zkingsoft.util.StringUtils;
import com.zkingsoft.util.WebUtil;

/**
 * 
 * @Description: 不需要登录可以访问的action
 * @author:姜友瑶
 * @date 2016年8月31日
 */
@Controller
public class Home extends BaseController {

	@Resource
	WebAdService webAdService;

	@Resource
	WebArticleService artService;
	@Resource
	WebAdcolumnService columnService;

	@Resource
	WebArticleTypeService artTypeService;

	@Resource
	WebNavService webNavService;

	@Resource
	WebMsgService webmsgservice;
	@Resource(name = "busParameterSettingsService")
	private BusParameterSettingsService busParameterSettingsService;

	Logger log=Logger.getLogger(Home.class);
	/**
	 * 
	 * @Description: 首页配置
	 * @author:姜友瑶
	 * @return 返回类型 String
	 * @date 2016年8月28日
	 */
	@RequestMapping(value = "/")
	public String index() {

		log.info(WebUtil.getRequestAttribute(DispatcherServlet.WEB_APPLICATION_CONTEXT_ATTRIBUTE));
		
		List<WebArticle> artList = artService.findNewArticle(SystemConstance.ART_BLOG, new PaginationVO());
		WebUtil.setRequestAttribute(SystemConstance.ART_LIST, artList);
		setAllTypeInSession();
		PaginationVO pageVo = new PaginationVO();
		pageVo.setSort("artCount");
		pageVo.setOrder("desc");
		WebUtil.setRequestAttribute(SystemConstance.ART_PHB,
				artService.findNewArticle(SystemConstance.ART_BLOG, pageVo));
		return "/visitor/index";
	}

	/**
	 * 
	 * @Description: 进入指定分类的首页
	 * @author:姜友瑶
	 * @return 返回类型 String
	 * @date 2016年8月28日
	 */
	@RequestMapping(value = "/{code}")
	public String index(@PathVariable String code) {
		
		PaginationVO pageVo = new PaginationVO();
		pageVo.setLimit(1000);
		List<WebArticle> artList = artService.findNewArticle(code, new PaginationVO());
		WebUtil.setRequestAttribute(SystemConstance.ART_LIST, artList);
		setAllTypeInSession();
		// 查询排行榜
		pageVo = new PaginationVO();
		pageVo.setSort("artCount");
		pageVo.setOrder("desc");
		WebUtil.setRequestAttribute(SystemConstance.ART_PHB,
				artService.findNewArticle(SystemConstance.ART_BLOG, pageVo));

		return "/visitor/index";
	}

	/**
	 * 查询文章
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "showArt/{id}")
	public String index(@PathVariable("id") Long id) {

		WebArticle article = artService.findById(id);
		WebUtil.setRequestAttribute("art", article);
		WebUtil.setRequestAttribute("prev", artService.findAround(article.getArtId(), -1));
		WebUtil.setRequestAttribute("next", artService.findAround(article.getArtId(), 1));

		article.setArtCount(article.getArtCount() + 1);
		artService.modifyByModel(article);

		return "/visitor/article";
	}

	/**
	 * 根据文章类型名称分页查询文章
	 */
	@RequestMapping(value = "/findNews")
	public @ResponseBody AjaxResult showList(WebArticle webArticle, String code, PaginationVO pageVo) {

		WebArticleType type = new WebArticleType();
		if (!StringUtils.isBlank(code)) {
			type.setCode(code);
			List<WebArticleType> types = artTypeService.findByModel(type);
			if (types.size() > 0) {
				webArticle.setArtTypeId(types.get(0).getArtTypeId());
			}
		}
		// 只搜索已发布的
		webArticle.setArtIsPublish(SystemConstance.IS_Y);
		return showList(artService, webArticle, pageVo);
	}

	/**
	 * 
	 * @Description: 页面定向方法，每个权限模块公用一个，每个模块共享一个一级路径，已便于进行权限过滤
	 * @author:姜友瑶
	 * @param page1
	 * @param page2
	 * @return 返回类型 String
	 * @date 2016年8月31日
	 */
	@RequestMapping(value = "/redirect/{page1}/{page2}")
	public String redirect(@PathVariable("page1") String page1, @PathVariable("page2") String page2) {
		return "visitor/" + page1 + "/" + page2;
	}

	/**
	 * 
	 * @Description: 页面定向方法，每个权限模块公用一个，每个模块共享一个一级路径，已便于进行权限过滤
	 * @author:姜友瑶
	 * @param page1
	 * @param page2
	 * @return 返回类型 String
	 * @date 2016年8月31日
	 */
	@RequestMapping(value = "/redirect/{page1}")
	public String redirect(@PathVariable("page1") String page1) {
		return "visitor/" + page1;
	}

	/**
	 * 
	 * @Description: 页面定向方法，每个权限模块公用一个，每个模块共享一个一级路径，已便于进行权限过滤
	 * @author:姜友瑶
	 * @param page1
	 * @param page2
	 * @return 返回类型 String
	 * @date 2016年8月31日
	 */
	@RequestMapping(value = "/mobile/redirect/{page1}/{page2}")
	public String mobileRedirect(@PathVariable("page1") String page1, @PathVariable("page2") String page2) {
		return "mobile/" + page1 + "/" + page2;
	}

	/**
	 * 
	 * @Description: 页面定向方法，每个权限模块公用一个，每个模块共享一个一级路径，已便于进行权限过滤
	 * @author:姜友瑶
	 * @param page1
	 * @param page2
	 * @return 返回类型 String
	 * @date 2016年8月31日
	 */
	@RequestMapping(value = "/mobile/redirect/{page1}")
	public String mobileRedirect(@PathVariable("page1") String page1) {
		return "mobile/" + page1;
	}

	/**
	 * 查询广告
	 */
	@RequestMapping(value = "/findAd")
	public @ResponseBody AjaxResult findAd(String code) {
		return new AjaxResult(AjaxResult.STATUS_OK, webAdService.findAdByCloCode(code));
	}

	/**
	 * 查询广告类型
	 */
	@RequestMapping(value = "/findAdType")
	public @ResponseBody AjaxResult findAdType(WebAdcolumn column) {
		return new AjaxResult(AjaxResult.STATUS_OK, columnService.findByModel(column));
	}

	/**
	 * 查询文章类型
	 */
	@RequestMapping(value = "/findArtType")
	public @ResponseBody AjaxResult findArtType(WebArticleType articleType) {
		return new AjaxResult(AjaxResult.STATUS_OK, artTypeService.findByModel(articleType));
	}

	/**
	 * 新增或者修改页面
	 */
	@RequestMapping(value = "/addMsg")
	public @ResponseBody AjaxResult addMsg(WebMsg webMsg) {
		webMsg.setCreateTime(new Date());
		webmsgservice.add(webMsg);
		return new AjaxResult(AjaxResult.STATUS_OK, null, "感谢您的反馈");
	}

	/**
	 * 查询一级导航栏
	 */
	@RequestMapping(value = "/findFirstNav")
	public @ResponseBody AjaxResult findFirstNav(String type) {
		WebNav webNav = new WebNav();
		webNav.setNavType(type);
		webNav.setParentId(0L);
		List<WebNav> navlist = webNavService.findByModel(webNav);
		return new AjaxResult(AjaxResult.STATUS_OK, navlist);
	}

	/**
	 * 查询一个导航栏
	 */
	@RequestMapping(value = "/findNav")
	public @ResponseBody AjaxResult findFirstNav(WebNav nav) {
		List<WebNav> navlist = webNavService.findByModel(nav);
		return new AjaxResult(AjaxResult.STATUS_OK, navlist);
	}

	/**
	 * 查询网页参数
	 */
	@RequestMapping(value = "/findWebParam")
	public @ResponseBody AjaxResult findWebParam() {
		BusParameterSettings query = new BusParameterSettings();
		query.setParamValue1(SystemConstance.CMSPZ);
		List<BusParameterSettings> list = busParameterSettingsService.findByModel(query);
		return new AjaxResult(AjaxResult.STATUS_OK, list);
	}

	// 获取最近更新的10篇文章,一个session只查询一次
	private void setAllTypeInSession() {

		if (WebUtil.getSessionAttribute(SystemConstance.ALL_TYPE) == null) {
			// 获取所有的博客分类
			WebArticleType webArticleType = new WebArticleType();
			webArticleType.setCode(SystemConstance.ART_BLOG);
			List<WebArticleType> artTypeList = artTypeService.findByModel(webArticleType);
			if (artTypeList.size() == 1) {
				WebUtil.setSessionAttribute(SystemConstance.ALL_TYPE, artTypeList.get(0).getChildrenType());
			}
		}

	}

	/**
	 * 根据文章类型名称分页查询文章
	 */
	@RequestMapping(value = "/search")
	public String showList(String searchWord) {
		if (!StringUtils.isBlank(searchWord)) {
			List<WebArticle> searchArt = artService.findByWord(searchWord);
			WebUtil.setRequestAttribute("searchArt", searchArt);
			WebUtil.setRequestAttribute("searchWord", searchWord);
		}

		return "visitor/search";
	}

}