package cn.believeus.init;

import java.io.File;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.IOUtils;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import cn.believeus.json.JsonTest;
import cn.believeus.service.CacheService;

@Component
public class Initcore implements ApplicationListener<ApplicationEvent> {
	private boolean isread = true;

	@Resource
	private CacheService cacheService;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextRefreshedEvent) {
			if (isread == true) {
				isread = false;
				cacheService.redisFlushdb(0);
				cacheService.redisFlushdb(1);
				// 获取项目classes存放目录
				String url = JsonTest.class.getResource("/").getFile().toString();
				url = url + "开源医疗/问诊备要/咳嗽";
				File file = new File(url);
				try {
					String jsondata = IOUtils.toString(new FileReader(file));
					JSONObject jsonObj = JSONObject.fromObject(jsondata);
					readyWarm(jsonObj);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void readyWarm(JSONObject jsonObj) {
		Map<String, String> jsondata = new HashMap<String, String>();
		@SuppressWarnings("unchecked")
		Iterator<String> keys = jsonObj.keys();
		while (keys.hasNext()) {
			String key = keys.next();
			Object o = jsonObj.get(key);
			if (o instanceof JSONArray) {
				String tkey = jsondata.get("id");
				String value = JSONObject.fromObject(jsondata).toString();
				cacheService.set(tkey, value, 1);
				JSONArray jsonArray = (JSONArray) o;
				for (Object object : jsonArray) {
					JSONObject jsonObject = JSONObject.fromObject(object);
					String id = (String) jsonObject.get("id");
					String v = cacheService.get(tkey, 0);
					v = (v == null) ? id : v + "|" + id;
					cacheService.set(tkey, v, 0);
					readyWarm(jsonObject);
				}
			} else {
				jsondata.put(key, o.toString());
				
			}
		}
		if(cacheService.get(jsondata.get("id"), 1)==null){
			String tkey = jsondata.get("id");
			String value = JSONObject.fromObject(jsondata).toString();
			cacheService.set(tkey, value, 1);
		}
	}

}