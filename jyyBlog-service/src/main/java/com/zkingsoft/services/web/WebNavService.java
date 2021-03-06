package com.zkingsoft.services.web;

import com.zkingsoft.pojo.PaginationVO;
import java.util.List;
import com.zkingsoft.model.web.WebNav;
import com.zkingsoft.constraint.BaseServices;

/**
 * This field was generated by Zking.software.Codegen.
 * @date 2016-11-28 15:35
 */
public interface WebNavService  extends BaseServices<WebNav>{
	
	/**
	 * 新增WebNav
	 * 
	 */
	public int add(WebNav webNav);
   	
   	/**
	 * 批量新增WebNav
	 * 
	 */
	public int batchAdd(List<WebNav>  webNavList);
   	
   	/**
	 * 根据map键值对 更新WebNav
	 * 
	 */
	public int modifyByMap(WebNav oldWebNav ,WebNav newWebNav);
	
	/**
	 * 根据对象 更新WebNav
	 * 
	 */
	public int modifyByModel(WebNav webNav);
	
	/**
	 * 批量删除WebNav
	 * 
	 */
	public int remove(List<Long> list);

	/**
	 * 根据id删除WebNav
	 * 
	 */
	public int removeById(Long navId);
	
	/**
	 * 根据对象删除WebNav
	 * 
	 */
	public int removeByModel(WebNav webNav);
	
	/**
	 * 分页查询WebNav
	 * 
	 */
	public List<WebNav> findInPage(WebNav webNav, PaginationVO pageVo);

	/**
	 * 根据对象查询WebNav
	 * 
	 */
	public List<WebNav> findByModel(WebNav webNav);
	
	/**
	 * 统计记录数WebNav
	 * 
	 */
	public int  findTotal(WebNav webNav);
	
	/**
	 * 根据id查询WebNav
	 * 
	 */
	public WebNav  findById(Long navId);

   	

  
}