package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

//证
@Entity
@Table
public class Tsynd extends TbaseEntity {

	private static final long serialVersionUID = -2827186874700811417L;
	//病证名
	private String title;
	//症状
	private String synd;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSynd() {
		return synd;
	}

	public void setSynd(String synd) {
		this.synd = synd;
	}

}
