package com.spring.springmvc.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class NewsDomain extends BaseDomain {

	/**
	 * 院务新闻
	 */
	private static final long serialVersionUID = 2658138756297811651L;
	private int NewsID;
	private String NewsCategory;// 领导视察 A、政企对接 B、重要荣誉 C、学术盛宴 D、专家访谈 E、通知通告 F、
								// 院务新闻 G、员工风采 H
	private String NewsTitle;
	private String LinkAddress;
	private String Synopsis;
	private String ThumbPicture;
	private String PublishDate;
	private String CreateBy;

	private String htmlContent;

	public String getHtmlContent() {
		return htmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		this.htmlContent = htmlContent;
	}

	public int getNewsID() {
		return NewsID;
	}

	public void setNewsID(int newsID) {
		NewsID = newsID;
	}

	public String getNewsCategory() {
		return NewsCategory;
	}

	public void setNewsCategory(String newsCategory) {
		NewsCategory = newsCategory;
	}

	public String getNewsTitle() {
		return NewsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		NewsTitle = newsTitle;
	}

	public String getPublishDate() {
		return PublishDate;
	}

	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}

	public String getCreateBy() {
		return CreateBy;
	}

	public void setCreateBy(String createBy) {
		CreateBy = createBy;
	}

	public String getLinkAddress() {
		return LinkAddress;
	}

	public void setLinkAddress(String linkAddress) {
		LinkAddress = linkAddress;
	}

	public String getSynopsis() {
		return Synopsis;
	}

	public void setSynopsis(String synopsis) {
		Synopsis = synopsis;
	}

	public String getThumbPicture() {
		return ThumbPicture;
	}

	public void setThumbPicture(String thumbPicture) {
		ThumbPicture = thumbPicture;
	}

	private List<PictureDomain> picturesList = new ArrayList<PictureDomain>();

	public List<PictureDomain> getpicturesList() {
		if (picturesList == null)
			picturesList = new ArrayList<PictureDomain>();
		return picturesList;
	}

	public void setpicturesList(List<PictureDomain> value) {
		ClearPicture();
		if (value != null) {
			for (PictureDomain e : value)
				AddPicture(e);
		}
	}

	public void AddPicture(PictureDomain e) {
		if (e == null)
			return;
		if (this.picturesList == null)
			this.picturesList = new ArrayList<PictureDomain>();
		if (!this.picturesList.contains(e)) {
			this.picturesList.add(e);
		}
	}

	public void RemovePicture(PictureDomain e) {
		if (e == null)
			return;
		if (this.picturesList != null)
			if (this.picturesList.contains(e)) {
				this.picturesList.remove(e);
				e = null;
			}
	}

	public void ClearPicture() {
		if (this.picturesList != null) {
			List<PictureDomain> tmp = new ArrayList<PictureDomain>();
			for (PictureDomain e : this.picturesList) {
				tmp.add(e);
				e = null;
			}
			picturesList.clear();
		}
	}
}
