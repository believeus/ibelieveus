package cn.believeus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.model.Tsynd;
import cn.believeus.model.Tsyndset;
import cn.believeus.model.Tuser;
import cn.believeus.service.IService;
import cn.believeus.service.MySQLService;


@Controller
public class ControllerIndex {
	@Resource
	private IService mysqlService;
	@RequestMapping("/areY")
	public @ResponseBody String areY(String syndname) {
		Map<String, String> loadsynd = loadData(syndname);
		if(loadsynd.isEmpty()){
			return "0";
		}else {
			return loadsynd.toString();
		}
		
	}
	
	@RequestMapping("/getUser")
	public @ResponseBody String getUser(int id){
		Tuser user=(Tuser)mysqlService.findObject(Tuser.class, id);
		return user.toString().replaceAll("\\[|\\]","");
	}
	
	//加载数据
	public Map<String, String> loadData(String syndcode){
		//加载数据
		 Map<String, String> usersynd = new HashMap<String, String>();
			Tsyndset syndset=(Tsyndset)mysqlService.findObject(Tsyndset.class,"code", syndcode);
			if(syndset!=null){
				String[] refers = syndset.getRefer().split("\\s+");
				if (refers != null && refers.length != 0) {
					for (String refer : refers) {
							//[10:胃实热证]
							int syndId = Integer.parseInt(refer.substring(1,refer.indexOf(":")));
							// 查找关联的"证"
							Tsynd syndObj = (Tsynd) mysqlService.findObject(Tsynd.class, syndId);
							for (String synd : syndObj.getSynd().split("\\s+")) {
								usersynd.put(synd, syndObj.getTitle());
							}
						}
						
					}
				}
			return usersynd;
		}
	}
