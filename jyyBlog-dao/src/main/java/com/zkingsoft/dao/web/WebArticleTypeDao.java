package com.zkingsoft.dao.web;

import org.apache.ibatis.annotations.Param;
import com.zkingsoft.pojo.PaginationVO;
import java.util.List;
import com.zkingsoft.model.web.WebArticleType;
import java.util.Map;


/**
 * This field was generated by Zking.software.Codegen.
 * @date 2016-12-01 10:36
 */


public interface WebArticleTypeDao{

	public int insert(WebArticleType webArticleType);
   	
   	public int batchInsert(@Param("list") List<WebArticleType> webArticleTypeList);
   	
	public int updateByMap(Map<String, Object> modifyMap);
	
	public int updateByModel(WebArticleType webArticleType);
	
	public int deleteByIds(@Param("list") List<Long> list);
	
	public int deleteById(Long artTypeId);

	public int deleteByModel(@Param("record") WebArticleType webArticleType);
	
	public List<WebArticleType> selectInPage(@Param("record") WebArticleType webArticleType, @Param("pageVo") PaginationVO pageVo);

	public List<WebArticleType> selectByModel(@Param("record") WebArticleType webArticleType);
	
	public int  selectTotalRecord(@Param("record") WebArticleType webArticleType);
	
	public WebArticleType  selectById(Long artTypeId);
	
	public WebArticleType  selectForUpdate(Long artTypeId);

	
}