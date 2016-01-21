package cn.believeus.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.Table;

//证
@Entity
@Table
public class Tsynd extends TbaseEntity {

	private static final long serialVersionUID = -2827186874700811417L;
	private String code;
	//病证名
	private String title;
	//症状
	private String synd;

	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

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
		Set<String> syndset=new HashSet<String>();
		for(String syndstr: synd.split(",")){
			syndset.add(syndstr.trim());
		}
		String pattern="\\[|\\]|,|\\s+";
		this.synd=syndset.toString().replaceAll(pattern," ").trim();
	}

}
