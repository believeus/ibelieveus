package cn.believeus.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.model.Tsynd;
import cn.believeus.model.Tsyndset;
import cn.believeus.service.IService;

/**
 * 首页面
 * */
@Controller
public class ControllerIndex {
	@Resource
	private IService mysqlService;
	private Map<String, Map<String, String>> usersyndmap=new HashMap<String, Map<String,String>>();
	@RequestMapping("/areY")
	public @ResponseBody String areY(String username,String syndname,String answer) {
		String code = DigestUtils.md5Hex(syndname);
		Tsyndset syndset=(Tsyndset)mysqlService.findObject(Tsyndset.class,"code", code);
		Map<String, String> syndmap = usersyndmap.get(username);
		//加载数据
		if(syndmap==null||syndmap.isEmpty()){
			for(String refer :syndset.getRefer().split("\\s+")){
				Pattern regex = Pattern.compile("[0-9]+");
				Matcher matcher = regex.matcher(refer);
				if(matcher.find()){
					int syndId = Integer.parseInt(matcher.group());
					//查找关联的"证"
					Tsynd syndObj = (Tsynd)mysqlService.findObject(Tsynd.class,syndId);
					for(String synd :syndObj.getSynd().split("\\s+")){
						syndmap.put(synd, syndObj.getTitle());
					}
				}
				
			}
			usersyndmap.put(username, syndmap);
		}
		if(syndmap==null||syndmap.isEmpty()){
			return "还未收录该症状";
		}
		return "";
	}

}
