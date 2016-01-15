package cn.believeus.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.CallbackException;
import org.hibernate.Session;

@Entity
@Table
public class Tadmin extends TbaseEntity {
	
	private static final long serialVersionUID = 3261222397528062682L;
	
	private String username;
	private String password;
	private String description;
	private Trole role;
	
	@OneToOne(mappedBy = "admin",cascade=CascadeType.ALL)
	public Trole getRole() {
		return role;
	}
	public void setRole(Trole role) {
		this.role = role;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public boolean onUpdate(Session s) throws CallbackException {
		return super.onUpdate(s);
	}
	@Override
	public String toString() {
		return "[admin_info id:"+getId()+" username:"+username+" password:"+password+"]";
	}
}
