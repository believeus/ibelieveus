package cn.believeus.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Torigin implements Serializable {
	private static final long serialVersionUID = 1L;
	private String action;
	
	private List<Tcore> cores=new ArrayList<Tcore>();
	
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public List<Tcore> getCores() {
		return cores;
	}
	public void setCores(List<Tcore> cores) {
		this.cores = cores;
	}
	@Override
	public String toString() {
		return "Torigin [action=" + action + "]";
	}
	
	
	
	

}
