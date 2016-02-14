package cn.believeus.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.apache.commons.codec.digest.DigestUtils;

/**证*/
@Entity
@Table
public class TsyndMaster extends TbaseEntity{
	private static final long serialVersionUID = 2290022407519746709L;
	private String synd;
	private String code;
	//脉象
	private String  pulse;
	private String description;
	//主证
	private List<TsyndMajor> syndmajors=new ArrayList<TsyndMajor>();
	//从证
	private List<TsyndMinor> syndminors=new ArrayList<TsyndMinor>();
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
	
	
	@ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(
            name="tsyndmaster_tsyndmajor",
            joinColumns=@JoinColumn(name="syndmaster_id"),
            inverseJoinColumns=@JoinColumn(name="syndmajor_id")
    )
	public List<TsyndMajor> getSyndmajors() {
		return syndmajors;
	}
	public void setSyndmajors(List<TsyndMajor> syndmajors) {
		this.syndmajors = syndmajors;
	}

	@ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(
            name="tsyndmaster_tsyndminor",
            joinColumns=@JoinColumn(name="syndmaster_id"),
            inverseJoinColumns=@JoinColumn(name="syndminor_id")
    )
	public List<TsyndMinor> getSyndminors() {
		return syndminors;
	}
	public void setSyndminors(List<TsyndMinor> syndminors) {
		this.syndminors = syndminors;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Tsyndkey [synd=" + synd + ", code=" + code + "]";
	}
	public String getPulse() {
		return pulse;
	}
	public void setPulse(String pulse) {
		this.pulse = pulse;
	}
	
	
}
