package com.zkingsoft.services.web;

import java.util.List;
import com.zkingsoft.pojo.PaginationVO;
import com.zkingsoft.model.web.WebAdcolumn;
import com.zkingsoft.constraint.BaseServices;

/**
 * This field was generated by Zking.software.Codegen.
 * @date 2016-12-20 15:50
 */
public interface WebAdcolumnService  extends BaseServices<WebAdcolumn>{
	
	/**
	 * 新增WebAdcolumn
	 * 
	 */
	public int add(WebAdcolumn webAdcolumn);
   	
   	/**
	 * 批量新增WebAdcolumn
	 * 
	 */
	public int batchAdd(List<WebAdcolumn>  webAdcolumnList);
   	
   	/**
	 * 根据map键值对 更新WebAdcolumn
	 * 
	 */
	public int modifyByMap(WebAdcolumn oldWebAdcolumn ,WebAdcolumn newWebAdcolumn);
	
	/**
	 * 根据对象 更新WebAdcolumn
	 * 
	 */
	public int modifyByModel(WebAdcolumn webAdcolumn);
	
	/**
	 * 批量删除WebAdcolumn
	 * 
	 */
	public int remove(List<Long> list);

	/**
	 * 根据id删除WebAdcolumn
	 * 
	 */
	public int removeById(Long colId);
	
	/**
	 * 根据对象删除WebAdcolumn
	 * 
	 */
	public int removeByModel(WebAdcolumn webAdcolumn);
	
	/**
	 * 分页查询WebAdcolumn
	 * 
	 */
	public List<WebAdcolumn> findInPage(WebAdcolumn webAdcolumn, PaginationVO pageVo);

	/**
	 * 根据对象查询WebAdcolumn
	 * 
	 */
	public List<WebAdcolumn> findByModel(WebAdcolumn webAdcolumn);
	
	/**
	 * 统计记录数WebAdcolumn
	 * 
	 */
	public int  findTotal(WebAdcolumn webAdcolumn);
	
	/**
	 * 根据id查询WebAdcolumn
	 * 
	 */
	public WebAdcolumn  findById(Long colId);

	public List<WebAdcolumn> findByRemark();

   	

  
}