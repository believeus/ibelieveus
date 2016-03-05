package cn.believeus.controller;

import javax.annotation.Resource;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.believeus.service.CacheService;

@Controller
public class HandleController {
	@Resource
	private CacheService redisService;

	@RequestMapping(value = "/decore", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String decore(String keyword) {
		String data = null;
		String value = redisService.get(keyword,0);
		if (value == null || "".equals(value)) {
			return "over";
		}
		for (String key : value.split("\\|")) {
			value = redisService.get(key, 1);
			if (value != null) {
				JSONObject jsonObject = JSONObject.fromObject(value);
				String detail=jsonObject.getString("症状");
				String id=jsonObject.getString("id");
				data = (data == null) ? (id + ":" + detail) : (data + "|"+ id + ":" + detail);
			}
		}
		return data;
	}

	@RequestMapping(value = "/getdetail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getDetail(String keyword) {
		String value = redisService.get(keyword,1);
		JSONObject jsonObject = JSONObject.fromObject(value);
		String definition = jsonObject.getString("证名");
		String anagraph = jsonObject.getString("方剂");
		String drugname = jsonObject.getString("组方");
		return definition + ":" + drugname + ":" + anagraph;
	}
}
