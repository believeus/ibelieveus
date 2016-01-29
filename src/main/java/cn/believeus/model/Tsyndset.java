package cn.believeus.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.wltea.analyzer.lucene.IKAnalyzer;


//病症集合
@Entity
@Table
@Indexed
@Analyzer(impl=IKAnalyzer.class)
public class Tsyndset extends TbaseEntity {

	private static final long serialVersionUID = 1277405498002545695L;
	// 疾病编号
	private String code;
	// 疾病名
	private String synd;
	// 关联的病证
	private String refer;
	//可能的病证
	private String  maybesynd;
	private List<Tsyndkey> syndkeyList=new ArrayList<Tsyndkey>();
	
	// 病症描述
	private String description;
	private List<String> reflist=new ArrayList<String>();
	private List<String>  referIds=new ArrayList<String>();
	private List<String>  maybeList=new ArrayList<String>();

	public String getCode() {
		code=DigestUtils.md5Hex(synd);
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	@Field(store=Store.NO,index=Index.TOKENIZED)
	public String getSynd() {
		return synd;
	}
	@Transient
	public String getMaybesynd() {
		return maybesynd.replaceAll(",", "");
	}

	public void setMaybesynd(String maybesynd) {
		this.maybesynd=maybesynd;
	}

	public void setSynd(String synd) {
		this.synd = synd;
	}
	@Field(store=Store.NO,index=Index.TOKENIZED)
	public String getRefer() {
		if(refer!=null)
			return refer.trim();
		return refer;
	}

	public void setRefer(String refer) {
		this.refer = refer;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Transient
	public List<String> getReflist() {
		if(refer!=null){
			reflist = Arrays.asList(refer.split("\\s"));
		}
		return reflist;
	}

	public void setReflist(List<String> reflist) {
		this.reflist = reflist;
	}

	
	@Transient
	public List<String> getReferIds() {
		if(refer!=null){
			for(String ref :refer.split("\\s+")){
				if(ref!=null&&!"".equals(ref)){
					String rid=ref.substring(1, ref.indexOf(":"));
					referIds.add(rid);
				}
			}
		}
		return referIds;
	}

	public void setReferIds(List<String> referIds) {
		this.referIds = referIds;
	}
	@ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(
            name="tsyndset_tsyndkey",
            joinColumns=@JoinColumn(name="syndset_id"),
            inverseJoinColumns=@JoinColumn(name="syndkey_id")
    )
	public List<Tsyndkey> getSyndkeyList() {
		System.out.println(syndkeyList);
		return syndkeyList;
	}

	public void setSyndkeyList(List<Tsyndkey> syndkeyList) {
		this.syndkeyList = syndkeyList;
	}

	@Transient
	public List<String> getMaybeList() {
		  if(maybesynd!=null){
			  return Arrays.asList(maybesynd.split("\\s+"));
		  }
		  return maybeList;
	}

	public void setMaybeList(List<String> maybeList) {
		this.maybeList = maybeList;
	}

	@Override
	public String toString() {
		return "Tsyndset [code=" + code + ", synd=" + synd + ", refer=" + refer
				+ ", maybesynd=" + maybesynd + ", description=" + description
				+ ", referIds=" + referIds + "]";
	}

	
	
	
	

}
