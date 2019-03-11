package com.spring.springmvc.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.spring.core.BaseDomain;

@Component
public class BriefingDomain extends BaseDomain {

	/**
	 * 行业情报简报
	 */
	private static final long serialVersionUID = -1323653717907644096L;
	private int BriefingID;
	private String Title;
	private String LinkAddress;
	private String Synopsis;
	private String PublishDate;
	private String CreateBy;

	public int getBriefingID() {
		return BriefingID;
	}

	public void setBriefingID(int briefingID) {
		BriefingID = briefingID;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
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

	public List<PictureDomain> getPicturesList() {
		return picturesList;
	}

	public void setPicturesList(List<PictureDomain> picturesList) {
		this.picturesList = picturesList;
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
