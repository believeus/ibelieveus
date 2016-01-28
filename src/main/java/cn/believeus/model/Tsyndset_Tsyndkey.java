package cn.believeus.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tsyndset_tsyndkey")
public class Tsyndset_Tsyndkey implements Serializable{
	
	private static final long serialVersionUID = 7749848167961710945L;
	private Integer id;
	private String syndset_id;
	private String syndkey_id;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSyndset_id() {
		return syndset_id;
	}
	public void setSyndset_id(String syndset_id) {
		this.syndset_id = syndset_id;
	}
	public String getSyndkey_id() {
		return syndkey_id;
	}
	public void setSyndkey_id(String syndkey_id) {
		this.syndkey_id = syndkey_id;
	}
	
}
