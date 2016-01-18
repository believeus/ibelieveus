package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.Table;

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
	// 病症描述
	private String description;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	@Field(store=Store.NO,index=Index.TOKENIZED)
	public String getSynd() {
		return synd;
	}

	public void setSynd(String synd) {
		this.synd = synd;
	}
	@Field(store=Store.NO,index=Index.TOKENIZED)
	public String getRefer() {
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

}
