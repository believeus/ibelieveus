package cn.believeus.admin.controller;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.model.TsyndMaster;
import cn.believeus.model.TsyndMinor;
import cn.believeus.service.IService;

@Controller
public class AdminSyndminorController {
	
	@Resource
	private IService mysqlService;
	
	@RequestMapping("/admin/syndminor/delete")
	public @ResponseBody String deleteminor(Integer id,String syndminor){
		TsyndMaster syndmaster=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, id);
		String code=DigestUtils.md5Hex(syndminor);
		for(TsyndMinor minor :syndmaster.getSyndminors()){
			if(minor.getCode().equals(code)){
				syndmaster.getSyndminors().remove(minor);
				mysqlService.saveOrUpdate(syndmaster);
				mysqlService.delete(minor);
				return "true";
			}
		}
		return "false";
	}
	
	@RequestMapping("/admin/syndminor/updateminor")
	public @ResponseBody String updateminor(Integer id,String syndminor){
		TsyndMaster syndmaster=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, id);
		String code=DigestUtils.md5Hex(syndminor);
		for(TsyndMinor minor :syndmaster.getSyndminors()){
			if(minor.getCode().equals(code)){
				return "false";
			}
		}
		TsyndMinor minor=new TsyndMinor();
		minor.setCode(code);
		minor.setSynd(syndminor);
		syndmaster.getSyndminors().add(minor);
		mysqlService.saveOrUpdate(syndmaster);
		return "true";
	}
}
