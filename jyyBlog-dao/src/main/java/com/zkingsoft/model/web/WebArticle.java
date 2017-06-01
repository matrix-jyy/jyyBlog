package com.zkingsoft.model.web;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.zkingsoft.anotations.Extend;

/**
 * This field was generated by Zking.software.Codegen.
 * 
 * @date 2016-12-01 10:36
 */
public class WebArticle implements Serializable {
	@Extend
	private static final long serialVersionUID = 1L;

	private Long artId;

	/**
	 * 文章类型Id
	 */
	private Long artTypeId;

	/**
	 * 文章作者
	 */
	private String artAuthor;

	/**
	 * 文章标题
	 */
	private String artTitle;

	/**
	 * 是否发布
	 */
	private String artIsPublish;

	/**
	 * 摘要
	 */
	private String artAbstract;

	/**
	 * 内容
	 */
	private String artContent;

	/**
	 * 展示图片
	 */
	private String artImage;

	/**
	 * 排序
	 */
	private Integer artSort;

	/**
	 * 创建时间
	 */
	private Date artCreatetiem;

	/**
	 * 访问次数
	 */
	private Integer artCount;

	/**
	 * 标签
	 */
	private String artLables;

	/**
	 * 链接地址（预留）
	 */
	private String artUrl;

	/**
	 * 扩展字段-文章类型名称
	 */
	@Extend
	private String artTypeName;
	@Extend
	private List<WebImages> images;

	public List<WebImages> getImages() {
		return images;
	}

	public void setImages(List<WebImages> images) {
		this.images = images;
	}

	public Integer getArtCount() {

		return artCount == null ? 1 : artCount;
	}

	public void setArtCount(Integer artCount) {
		this.artCount = artCount;
	}

	public String getArtLables() {
		return artLables;
	}

	public void setArtLables(String artLables) {
		this.artLables = artLables;
	}

	public String getArtTypeName() {
		return artTypeName;
	}

	public void setArtTypeName(String artTypeName) {
		this.artTypeName = artTypeName;
	}

	public Long getArtId() {
		return artId;
	}

	public void setArtId(Long artId) {
		this.artId = artId;
	}

	public Long getArtTypeId() {
		return artTypeId;
	}

	public void setArtTypeId(Long artTypeId) {
		this.artTypeId = artTypeId;
	}

	public String getArtAuthor() {
		return artAuthor;
	}

	public void setArtAuthor(String artAuthor) {
		this.artAuthor = artAuthor;
	}

	public String getArtTitle() {
		return artTitle;
	}

	public void setArtTitle(String artTitle) {
		this.artTitle = artTitle;
	}

	public String getArtIsPublish() {
		return artIsPublish;
	}

	public void setArtIsPublish(String artIsPublish) {
		this.artIsPublish = artIsPublish;
	}

	public String getArtAbstract() {
		return artAbstract;
	}

	public void setArtAbstract(String artAbstract) {
		this.artAbstract = artAbstract;
	}

	public String getArtContent() {
		return artContent;
	}

	public void setArtContent(String artContent) {
		this.artContent = artContent;
	}

	public String getArtImage() {
		return artImage;
	}

	public void setArtImage(String artImage) {
		this.artImage = artImage;
	}

	public Integer getArtSort() {
		return artSort;
	}

	public void setArtSort(Integer artSort) {
		this.artSort = artSort;
	}

	public Date getArtCreatetiem() {
		return artCreatetiem;
	}

	public void setArtCreatetiem(Date artCreatetiem) {
		this.artCreatetiem = artCreatetiem;
	}

	public String getArtUrl() {
		return artUrl;
	}

	public void setArtUrl(String artUrl) {
		this.artUrl = artUrl;
	}

	@Override
	public String toString() {
		return "{WebArticle:{" + "artId:" + artId + "," + "artTypeId:" + artTypeId + "," + "artAuthor:" + artAuthor
				+ "," + "artTitle:" + artTitle + "," + "artIsPublish:" + artIsPublish + "," + "artAbstract:"
				+ artAbstract + "," + "artContent:" + artContent + "," + "artImage:" + artImage + "," + "artSort:"
				+ artSort + "," + "artCreatetiem:" + artCreatetiem + "," + "artUrl:" + artUrl + "," + "}}";
	}

}
