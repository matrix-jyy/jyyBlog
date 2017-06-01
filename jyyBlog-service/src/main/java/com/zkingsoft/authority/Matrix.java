package com.zkingsoft.authority;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zkingsoft.authority.loginStrategy.LoginStrategy;
import com.zkingsoft.constance.SystemConstance;
import com.zkingsoft.exception.GlobleException;
import com.zkingsoft.model.sys.SysFunction;
import com.zkingsoft.model.sys.SysUsers;
import com.zkingsoft.services.sys.SysFunctionService;
import com.zkingsoft.util.StringUtils;
import com.zkingsoft.util.WebUtil;

/**
 * Matrix 实现了权限控制接口,
 * 
 * @author jiangyouyao
 *
 */
@Component("matrix")
public class Matrix implements Authority {

	// 用户的所有功能权限
	public Map<String, SysFunction> userFunction;
	// 用户的一级菜单权限
	public List<SysFunction> menuFunction;

	@Autowired
	SysFunctionService sysFunctionService;

	Logger log = Logger.getLogger(Matrix.class);

	private Matrix() {
	}

	public <T> T login(LoginStrategy loginStrategy) {

		@SuppressWarnings("unchecked")
		T user = (T) loginStrategy.login();
		if (user == null) {
			throw new GlobleException("登录失败");
		}
		if (loginStrategy.requireInitUserPower()) {
			SysUsers sysUser = (SysUsers) user;
			// 用户的所有功能权限
			userFunction = new HashMap<>();
			// 用户的一级菜单权限
			menuFunction = new ArrayList<>();
			// 如果策略要求查询权限
			// 用户的所有功能权限用id记录，方便后面查询菜单树形结构
			Map<Long, SysFunction> menuFunctionMap = new TreeMap<>();
			// 获取用户所有权限
			// 判断用户类型
			if (SystemConstance.USER_TYPE_ADMIN.equals(sysUser.getSuUserType())) {
				// 管理员拥有公司全部权限
				List<SysFunction> tempList = sysFunctionService.findCompanyFunction(sysUser.getCompanyId());
				for (SysFunction sysFunction : tempList) {
					userFunction.put(sysFunction.getFnCode(), sysFunction);
					if (SystemConstance.IS_Y.equals(sysFunction.getFnShowMenu())) {
						menuFunctionMap.put(sysFunction.getFnId(), sysFunction);
					}
				}
			} else if (SystemConstance.USER_TYPE_EMPLOYEE.equals(sysUser.getSuUserType())) {
				// 普通员工账号只拥有自己所拥有的权限
				List<SysFunction> tempList = sysFunctionService.findFunctionByRoleIds(sysUser.getRoleIds());
				for (SysFunction sysFunction : tempList) {
					if (userFunction.containsKey(sysFunction.getFnCode())) {
						// 如果功能已经被添加到集合中则追加权限按钮
						SysFunction function = userFunction.get(sysFunction.getFnCode());
						String[] btns = function.getFnBtns().split(",");
						List<String> btnArray = Arrays.asList(btns);
						String[] newBtns = sysFunction.getFnBtns().split(",");
						for (String btn : newBtns) {
							if (!btnArray.contains(btn)) {
								btnArray.add(btn);
							}
						}
						sysFunction.setFnBtns(StringUtils.collToStr(btnArray, ","));
					} else {
						// 如果是新功能则直接添加
						userFunction.put(sysFunction.getFnCode(), sysFunction);
						if (SystemConstance.IS_Y.equals(sysFunction.getFnShowMenu())) {
							menuFunctionMap.put(sysFunction.getFnId(), sysFunction);
						}
					}
				}
			}
			// 获取菜单权限,思路：如果遍历map如果功能存在父节点，就找到父节点然后把子节点加入进去，这样就只需要遍历一次
			Set<Long> keys = menuFunctionMap.keySet();
			for (Long id : keys) {
				SysFunction function = menuFunctionMap.get(id);
				// 如果是一级节点则直接存入菜单
				if (function.getFnParentId() == null) {
					menuFunction.add(function);
				} else {
					// 非一级节点找到父节点后存入
					SysFunction parentFn = menuFunctionMap.get(function.getFnParentId());
					List<SysFunction> childs = parentFn.getChilds();
					if (childs == null) {
						parentFn.setChilds(new ArrayList<SysFunction>());
					}
					parentFn.getChilds().add(function);

				}
			}
		}
		WebUtil.setSessionAttribute(SystemConstance.LOGIN_KEY, user);
		WebUtil.setSessionAttribute(SystemConstance.MATRIX, this);
		return user;
	}

	@SuppressWarnings("unchecked")
	public <T> T getLoginUser() {
		return (T) WebUtil.getSessionAttribute(SystemConstance.LOGIN_KEY);
	}

	public void getLoginOut() {
		WebUtil.getSession().invalidate();
	}

	/**
	 * 判断用户是否具有按钮功能
	 * 
	 * @param matchStr
	 * @return
	 * @throws IllegalArgumentException
	 */
	public boolean isBtnPermitted(String matchStr) throws IllegalArgumentException {
		// 开发人员和超级管理员具有所有权限
		SysUsers user = this.getLoginUser();
		if (SystemConstance.USER_TYPE_DEVELOPER.equals(user.getSuUserType())
				|| SystemConstance.USER_TYPE_SUPER.equals(user.getSuUserType())) {
			return true;
		}
		String[] strs = matchStr.split(":");
		if (strs.length != 2) {
			throw new IllegalArgumentException("权限matchStr格式错误，需要fnCode:btnValue");
		}
		if (userFunction != null) {
			SysFunction fn = userFunction.get(strs[0].trim());
			return fn == null ? false : StringUtils.isContentSet(strs[1].trim(), fn.getFnBtns());
		} else {
			log.info("userFunction is null ");
			return false;
		}

	}

	/**
	 * 判断用户是否具有功能权限
	 * 
	 * @param matchStr
	 * @return
	 */
	public boolean isFnPermitted(String fnCode) {
		// 开发人员和超级管理员具有所有权限
		SysUsers user = this.getLoginUser();
		if (SystemConstance.USER_TYPE_DEVELOPER.equals(user.getSuUserType())
				|| SystemConstance.USER_TYPE_SUPER.equals(user.getSuUserType())) {
			return true;
		}
		SysFunction fn = userFunction.get(fnCode);
		return fn == null ? false : true;
	}

	public Map<String, SysFunction> getUserFunction() {
		return userFunction;
	}

	public void setUserFunction(Map<String, SysFunction> userFunction) {
		this.userFunction = userFunction;
	}

	public List<SysFunction> getMenuFunction() {
		return menuFunction;
	}

	public void setMenuFunction(List<SysFunction> menuFunction) {
		this.menuFunction = menuFunction;
	}

}
