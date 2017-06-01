package com.zkingsoft.actions.admin.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.constraint.BaseController;
import com.zkingsoft.pojo.AjaxResult;

/**
 * @description 管理员总action
 * @author 姜友瑶
 * @email 935090232@qq.com
 * @date 2016-06-26
 */
@Controller
@RequestMapping(value = "developer")
public class DeveloperController extends BaseController {

	
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
		return "developer/" + page1 + "/" + page2;
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
		return "developer/" + page1;
	}


	@RequestMapping("/closeDebug")
	public @ResponseBody AjaxResult closeDebug(){
		SystemConstance.DEBUG=false;
		return new AjaxResult(AjaxResult.STATUS_OK,"debug模式关闭");
	}
	@RequestMapping("/openDebug")
	public @ResponseBody AjaxResult openDebug(){
		SystemConstance.DEBUG=true;
		return new AjaxResult(AjaxResult.STATUS_OK,"debug模式开启");
	}
	

}