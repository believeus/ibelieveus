package cn.believeus.init;

import java.io.File;
import java.io.FileReader;
import java.util.List;
import javax.annotation.Resource;
import org.apache.commons.io.IOUtils;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import cn.believeus.json.JsonTest;
import cn.believeus.model.Tcore;
import cn.believeus.model.Torigin;
import cn.believeus.service.RedisService;
import cn.believeus.utill.JsonUtils;
import cn.believeus.variables.Variables;

@Component
public class Initcore implements ApplicationListener<ApplicationEvent> {
	private boolean isread = true;

	@Resource
	private RedisService redisService;

	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		if (event instanceof ContextRefreshedEvent) {
			if (isread == true) {
				isread = false;
				redisService.redisFlushdb(Variables.DB_RELATIONSHIP);
				redisService.redisFlushdb(Variables.DB_SYNDINFO);
				// 获取项目classes存放目录
				String url = JsonTest.class.getResource("/").getFile()
						.toString();
				url = url + "开源医疗/问诊备要/咳嗽";
				File file = new File(url);
				try {
					String jsondata = IOUtils.toString(new FileReader(file));
					Torigin origin = JsonUtils.json2Bean(jsondata);
					cacheOrigin(origin);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void cacheOrigin(Torigin origin) {
		String key = origin.getAction();
		for (Tcore c : origin.getCores()) {
			cache(key, c.getKey(), Variables.DB_RELATIONSHIP);
		}
		json2cache(origin.getCores());
	}

	private void json2cache(List<Tcore> cores) {
		for (Tcore core : cores) {
			String key = core.getKey();
			String data = (String) redisService.getCacheValue(key,Variables.DB_SYNDINFO);
			if (data == null) {
				redisService.setCacheValue(key, core.toString(), Variables.DB_SYNDINFO);
			}
			for (Tcore c : core.getCores()) {
				cache(key, c.getKey(), Variables.DB_RELATIONSHIP);
				cache(c.getKey(), c.toString(), Variables.DB_SYNDINFO);
			}
			json2cache(core.getCores());
		}
	}

	private void cache(String key, String value, int dbindex) {
		String data = (String) redisService.getCacheValue(key, dbindex);
		data = (data == null) ? value : data + "|" + value;
		redisService.setCacheValue(key, data, dbindex);

	}

}