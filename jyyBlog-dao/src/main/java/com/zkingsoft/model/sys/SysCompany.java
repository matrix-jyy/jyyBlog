package com.zkingsoft.model.sys;

import java.util.Date;
import java.io.Serializable;
import com.zkingsoft.anotations.Extend;
/**
 * This field was generated by Zking.software.Codegen.
 * @date 2016-11-24 19:06
 */
public class SysCompany implements Serializable{
	@Extend
	private static final long serialVersionUID = 1L; 

	
	private Long  comId;
			
	
	private String  comName;
			
	
	/**
	 * 法人
	 */
	private String  comBoss;
			
	
	/**
	 * 经营范围
	 */
	private String  comBusinessScope;
			
	
	/**
	 * 公司地址
	 */
	private String  comAddress;
			
	
	/**
	 * 法人联系方式
	 */
	private String  comBossTel;
			
	
	/**
	 * 公司电话
	 */
	private String  comTel;
			
	
	/**
	 * 网站地址
	 */
	private String  comWebUrl;
			
	
	/**
	 * 邮箱
	 */
	private String  comEmail;
			
	
	/**
	 * 介绍
	 */
	private String  comIntroduction;
			
	
	/**
	 * 注册时间
	 */
	private Date  comRegisterTime;
			
	
	/**
	 * 银行账号
	 */
	private String  comBankAccount;
			
	
	/**
	 * 组织机构代码
	 */
	private String  comOrganizationCode;
			
	
	/**
	 * 公司类型
	 */
	private String  comType;
			
	
	/**
	 * 注册资本
	 */
	private String  comRegisterCapotal;
			
	
	/**
	 * 经营时间
	 */
	private Integer  comAge;
			
	
	/**
	 * 成立时间
	 */
	private Date  comCreateTime;
			
	
	/**
	 * 注册代码
	 */
	private String  comRegisterCode;
			
	
	private String  comLogo;
			
	
	/**
	 * Y 有效，N无效
	 */
	private String  comValid;
			
	
	/**
	 * 功能s
	 */
	private String  comFunctions;
			
	
	private String  comPlats;
			
	

	public Long getComId() {
		return comId;
	}
   	
   	public void setComId(Long comId) {
		this.comId=comId;
	}
   	

	public String getComName() {
		return comName;
	}
   	
   	public void setComName(String comName) {
		this.comName=comName;
	}
   	

	public String getComBoss() {
		return comBoss;
	}
   	
   	public void setComBoss(String comBoss) {
		this.comBoss=comBoss;
	}
   	

	public String getComBusinessScope() {
		return comBusinessScope;
	}
   	
   	public void setComBusinessScope(String comBusinessScope) {
		this.comBusinessScope=comBusinessScope;
	}
   	

	public String getComAddress() {
		return comAddress;
	}
   	
   	public void setComAddress(String comAddress) {
		this.comAddress=comAddress;
	}
   	

	public String getComBossTel() {
		return comBossTel;
	}
   	
   	public void setComBossTel(String comBossTel) {
		this.comBossTel=comBossTel;
	}
   	

	public String getComTel() {
		return comTel;
	}
   	
   	public void setComTel(String comTel) {
		this.comTel=comTel;
	}
   	

	public String getComWebUrl() {
		return comWebUrl;
	}
   	
   	public void setComWebUrl(String comWebUrl) {
		this.comWebUrl=comWebUrl;
	}
   	

	public String getComEmail() {
		return comEmail;
	}
   	
   	public void setComEmail(String comEmail) {
		this.comEmail=comEmail;
	}
   	

	public String getComIntroduction() {
		return comIntroduction;
	}
   	
   	public void setComIntroduction(String comIntroduction) {
		this.comIntroduction=comIntroduction;
	}
   	

	public Date getComRegisterTime() {
		return comRegisterTime;
	}
   	
   	public void setComRegisterTime(Date comRegisterTime) {
		this.comRegisterTime=comRegisterTime;
	}
   	

	public String getComBankAccount() {
		return comBankAccount;
	}
   	
   	public void setComBankAccount(String comBankAccount) {
		this.comBankAccount=comBankAccount;
	}
   	

	public String getComOrganizationCode() {
		return comOrganizationCode;
	}
   	
   	public void setComOrganizationCode(String comOrganizationCode) {
		this.comOrganizationCode=comOrganizationCode;
	}
   	

	public String getComType() {
		return comType;
	}
   	
   	public void setComType(String comType) {
		this.comType=comType;
	}
   	

	public String getComRegisterCapotal() {
		return comRegisterCapotal;
	}
   	
   	public void setComRegisterCapotal(String comRegisterCapotal) {
		this.comRegisterCapotal=comRegisterCapotal;
	}
   	

	public Integer getComAge() {
		return comAge;
	}
   	
   	public void setComAge(Integer comAge) {
		this.comAge=comAge;
	}
   	

	public Date getComCreateTime() {
		return comCreateTime;
	}
   	
   	public void setComCreateTime(Date comCreateTime) {
		this.comCreateTime=comCreateTime;
	}
   	

	public String getComRegisterCode() {
		return comRegisterCode;
	}
   	
   	public void setComRegisterCode(String comRegisterCode) {
		this.comRegisterCode=comRegisterCode;
	}
   	

	public String getComLogo() {
		return comLogo;
	}
   	
   	public void setComLogo(String comLogo) {
		this.comLogo=comLogo;
	}
   	

	public String getComValid() {
		return comValid;
	}
   	
   	public void setComValid(String comValid) {
		this.comValid=comValid;
	}
   	

	public String getComFunctions() {
		return comFunctions;
	}
   	
   	public void setComFunctions(String comFunctions) {
		this.comFunctions=comFunctions;
	}
   	

	public String getComPlats() {
		return comPlats;
	}
   	
   	public void setComPlats(String comPlats) {
		this.comPlats=comPlats;
	}
   	

	@Override
	public String toString() {
		return "{SysCompany:{"
		+"comId:"+comId+","
		+"comName:"+comName+","
		+"comBoss:"+comBoss+","
		+"comBusinessScope:"+comBusinessScope+","
		+"comAddress:"+comAddress+","
		+"comBossTel:"+comBossTel+","
		+"comTel:"+comTel+","
		+"comWebUrl:"+comWebUrl+","
		+"comEmail:"+comEmail+","
		+"comIntroduction:"+comIntroduction+","
		+"comRegisterTime:"+comRegisterTime+","
		+"comBankAccount:"+comBankAccount+","
		+"comOrganizationCode:"+comOrganizationCode+","
		+"comType:"+comType+","
		+"comRegisterCapotal:"+comRegisterCapotal+","
		+"comAge:"+comAge+","
		+"comCreateTime:"+comCreateTime+","
		+"comRegisterCode:"+comRegisterCode+","
		+"comLogo:"+comLogo+","
		+"comValid:"+comValid+","
		+"comFunctions:"+comFunctions+","
		+"comPlats:"+comPlats+","
		+"}}";
	}


  
}