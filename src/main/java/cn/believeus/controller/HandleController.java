package cn.believeus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.model.Tcore;
import cn.believeus.service.RedisService;
import cn.believeus.variables.Variables;

@Controller
public class HandleController {
	@Resource
	private RedisService redisService;

	@RequestMapping(value = "/decore", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String decore(String keyword) {
		String data = null;
		String value = redisService.getCacheValue(keyword,
				Variables.DB_RELATIONSHIP);
		if (value == null || "".equals(value)) {
			return "over";
		}
		for (String key : value.split("\\|")) {
			value = redisService.getCacheValue(key, Variables.DB_SYNDINFO);
			if (value != null) {
				@SuppressWarnings("rawtypes")
				Map<String, Class> classMap = new HashMap<String, Class>();
				classMap.put("cores", Tcore.class);
				Tcore core = (Tcore) JSONObject.toBean(
						JSONObject.fromObject(value), Tcore.class, classMap);
				String flag = core.getKey();
				String detail = core.getDetail();
				data = (data == null) ? (flag + ":" + detail) : (data + "|"
						+ flag + ":" + detail);
			}
		}
		return data;
	}

	@RequestMapping(value = "/getdetail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getDetail(String keyword) {
		String value = redisService.getCacheValue(keyword,Variables.DB_SYNDINFO);
		Map<String, Class> classMap = new HashMap<String, Class>();
		classMap.put("cores", Tcore.class);
		Tcore core = (Tcore) JSONObject.toBean(JSONObject.fromObject(value),Tcore.class, classMap);
		String definition = core.getDefinition();
		String anagraph = core.getAnagraph();
		String drugname = core.getDrugname();
		return definition + ":" + drugname + ":" + anagraph;
	}
}
