package cn.believeus.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

public class Tcore implements Serializable {
	private static final long serialVersionUID = 6971315557881847982L;
	private String key;
	/** 症状 */
	private String detail;
	/** 证名 */
	private String definition;
	/** 病因 */
	private String etiology;
	/** 别名 */
	private String alias;
	/** 治法 */
	private String treatment;
	/** 脉象 */
	private String pulse;
	/** 舌象 */
	private String tongue;
	/** 方剂名称 */
	private String drugname;
	/** 组方 */
	private String anagraph;
	private List<Tcore> cores = new ArrayList<Tcore>();

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getDefinition() {
		return definition;
	}

	public void setDefinition(String definition) {
		this.definition = definition;
	}

	public String getEtiology() {
		return etiology;
	}

	public void setEtiology(String etiology) {
		this.etiology = etiology;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getTreatment() {
		return treatment;
	}

	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}

	public String getPulse() {
		return pulse;
	}

	public void setPulse(String pulse) {
		this.pulse = pulse;
	}

	public String getTongue() {
		return tongue;
	}

	public void setTongue(String tongue) {
		this.tongue = tongue;
	}

	public String getDrugname() {
		return drugname;
	}

	public void setDrugname(String drugname) {
		this.drugname = drugname;
	}

	public String getAnagraph() {
		return anagraph;
	}

	public void setAnagraph(String anagraph) {
		this.anagraph = anagraph;
	}

	public List<Tcore> getCores() {
		return cores;
	}

	public void setCores(List<Tcore> cores) {
		this.cores = cores;
	}

	@Override
	public String toString() {
		Map<String, String> map=new HashMap<String, String>();
		map.put("key", key);
		map.put("detail", detail);
		map.put("definition",definition );
		map.put("etiology", etiology);
		map.put("alias", alias);
		map.put("treatment", treatment);
		map.put("pulse", pulse);
		map.put("tongue", tongue);
		map.put("drugname", drugname);
		map.put("anagraph", anagraph);
		return JSONObject.fromObject(map).toString();
		
	}

}
