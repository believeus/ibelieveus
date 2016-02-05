package cn.believeus.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.apache.commons.codec.digest.DigestUtils;

/**从症／表症*/
@Entity
@Table
public class TsyndSlave extends TbaseEntity{
	private static final long serialVersionUID = 2290022407519746709L;
	private String synd;
	private String code;
	private String description;
	private List<Tsyndset> syndsets=new ArrayList<Tsyndset>();
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
	
	
	@ManyToMany(mappedBy="syndslaves",cascade=CascadeType.ALL)
	public List<Tsyndset> getSyndsets() {
		return syndsets;
	}
	public void setSyndsets(List<Tsyndset> syndsets) {
		this.syndsets = syndsets;
	}
	
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "TsyndSlave [synd=" + synd + ", code=" + code + "]";
	}
	
	
}
