package com.zkingsoft.actions.admin.sys;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zkingsoft.anotations.RemoveRequestToken;
import com.zkingsoft.anotations.SaveRequestToken;
import com.zkingsoft.authority.Authority;
import com.zkingsoft.authority.MatrixAdapter;
import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.constraint.BaseController;
import com.zkingsoft.model.sys.SysUsers;
import com.zkingsoft.pojo.AjaxResult;
import com.zkingsoft.pojo.PaginationVO;
import com.zkingsoft.services.sys.SysUsersService;
import com.zkingsoft.util.WebUtil;

/**
 * This field was generated by Zking.software.Codegen.
 * 
 * @date 2016-11-16 15:25
 */
@Controller
@RequestMapping(value = "admin/sysUsers")
public class SysUsersController extends BaseController {

	@Resource
	private SysUsersService sysUsersService;

	@Resource(name="authorityAdapter")
	private Authority  authorityAdapter;

	// 记录编辑前的值Before_Edit_Value
	public static final String BEV = "SysUsers_BEV";
	public static final String fnCode = "sysUser";
	public static final String search = fnCode + ":search";
	public static final String edit = fnCode + ":edit";
	public static final String del = fnCode + ":del";
	public static final String add = fnCode + ":add";

	/**
	 * 列表显示
	 */
	@RequestMapping(value = "/showList")
	public @ResponseBody AjaxResult showList(SysUsers sysUsers, PaginationVO pageVo) {
		authorityAdapter.isBtnPermitted(search);
		sysUsers.setSuUserType(SystemConstance.USER_TYPE_ADMIN);
		return showList(sysUsersService, sysUsers, pageVo);
	}

	/**
	 * 新增或者修改公司管理员
	 */
	@RemoveRequestToken
	@RequestMapping(value = "/addOrModify")
	public @ResponseBody AjaxResult addOrModify(SysUsers sysUsers) {
		if (sysUsers.getSuId() != null) {
			authorityAdapter.isBtnPermitted(edit);
			AjaxResult result = modify(sysUsersService, WebUtil.getSessionAttribute(BEV), sysUsers, "公司管理员");
			WebUtil.removeSessionAttribute(BEV);
			return result;
		} else {
			authorityAdapter.isBtnPermitted(add);
			// 设置一些基本信息
			sysUsers.setSuAccountStatus(SystemConstance.ACCOUNT_STATUS_ACTIVATE);
			sysUsers.setSuRegisterTime(new Date());
			sysUsers.setSuValid(SystemConstance.RECORD_VALID);
			// 设置账号的类型为公司管理员
			sysUsers.setSuUserType(SystemConstance.USER_TYPE_ADMIN);
			return add(sysUsersService, sysUsers, "公司管理员");
		}
	}

	/**
	 * 进入修改界面
	 */
	@SaveRequestToken
	@RequestMapping(value = "/editForm")
	public String editForm(Long id) {
		authorityAdapter.isBtnPermitted(edit);
		SysUsers sysUsers;
		if (id != null) {
			sysUsers = sysUsersService.findById(id);
			WebUtil.getRequest().setAttribute("obj", sysUsers);
			WebUtil.setSessionAttribute(BEV, sysUsers);
		}
		return "super/admin-form";
	}

	/**
	 * 删除
	 */
	@RequestMapping(value = "/del")
	public @ResponseBody AjaxResult del(String keys) {
		authorityAdapter.isBtnPermitted(del);
		return remove(sysUsersService, keys);
	}

}