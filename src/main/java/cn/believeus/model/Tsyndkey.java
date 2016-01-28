package cn.believeus.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.apache.commons.codec.digest.DigestUtils;

@Entity
@Table
public class Tsyndkey extends TbaseEntity{
	private static final long serialVersionUID = 2290022407519746709L;
	private String synd;
	private String code;
	private String keypoint;
	private List<Tsyndset> syndsetList=new ArrayList<Tsyndset>();
	public String getSynd() {
		return synd;
	}
	public void setSynd(String synd) {
		this.synd = synd;
	}
	public String getCode() {
		code=DigestUtils.md5Hex(synd);
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
	
	@ManyToMany(mappedBy="syndkeyList",cascade=CascadeType.ALL)
	public List<Tsyndset> getSyndsetList() {
		return syndsetList;
	}
	public void setSyndsetList(List<Tsyndset> syndsetList) {
		this.syndsetList = syndsetList;
	}
	
	
}
