package cn.believeus.utill;

import java.util.HashMap;
import java.util.Map;
import cn.believeus.model.Torigin;
import cn.believeus.model.Tcore;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.PropertyNameProcessor;

public class JsonUtils {

	public static Torigin json2Bean(String jsondata) {
		JsonConfig jsonConfig = new JsonConfig();
		Map<String, Class<?>> classMap = new HashMap<String, Class<?>>();
		classMap.put("cores", Tcore.class);
		jsonConfig.setClassMap(classMap);
		jsonConfig.setRootClass(Torigin.class);

		final Map<String, String> sympmap = new HashMap<String, String>();
		sympmap.put("主诉", "action");
		sympmap.put("兼症", "cores");
		jsonConfig.registerJavaPropertyNameProcessor(Torigin.class,
				new PropertyNameProcessor() {
					@Override
					public String processPropertyName(
							@SuppressWarnings("rawtypes") Class beanClass,
							String name) {
						if (sympmap.containsKey(name))
							return sympmap.get(name);
						return name;
					}
				});

		final Map<String, String> coremap = new HashMap<String, String>();
		coremap.put("标识", "key");
		coremap.put("症状", "detail");
		coremap.put("证名", "definition");
		coremap.put("病因", "etiology");
		coremap.put("别名", "alias");
		coremap.put("治法", "treatment");
		coremap.put("脉象", "pulse");
		coremap.put("舌象", "tongue");
		coremap.put("方剂", "drugname");
		coremap.put("组方", "anagraph");
		coremap.put("兼症", "cores");
		jsonConfig.registerJavaPropertyNameProcessor(Tcore.class,
				new PropertyNameProcessor() {

					@Override
					public String processPropertyName(
							@SuppressWarnings("rawtypes") Class clazz,
							String name) {
						if (coremap.containsKey(name))
							return coremap.get(name);
						return name;
					}
				});

		JSONObject jsonObject = JSONObject.fromObject(jsondata, jsonConfig);
		Torigin origin = (Torigin) JSONObject.toBean(jsonObject, jsonConfig);
		return origin;
	}
	
}
