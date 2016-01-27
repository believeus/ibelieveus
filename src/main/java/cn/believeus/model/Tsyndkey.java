package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table
public class Tsyndkey extends TbaseEntity{
	private static final long serialVersionUID = 2290022407519746709L;
	private String synd;
	private String code;
	private String keypoint;
	public String getSynd() {
		return synd;
	}
	public void setSynd(String synd) {
		this.synd = synd;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getKeypoint() {
		return keypoint;
	}
	public void setKeypoint(String keypoint) {
		this.keypoint = keypoint;
	}
	
	
}
