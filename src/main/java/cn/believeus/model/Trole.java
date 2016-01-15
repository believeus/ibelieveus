package cn.believeus.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class Trole extends TbaseEntity{

	private static final long serialVersionUID = 3691434950191147508L;
	
	private String roleName;
	private String description;
	private Tadmin admin;
	private List<Tauthority> authoritys=new ArrayList<Tauthority>();
	
	@OneToMany(mappedBy="role",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public List<Tauthority> getAuthoritys() {
		return authoritys;
	}
	public void setAuthoritys(List<Tauthority> authoritys) {
		this.authoritys = authoritys;
	}
	
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	@OneToOne
	public Tadmin getAdmin() {
		return admin;
	}
	public void setAdmin(Tadmin admin) {
		this.admin = admin;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
