package cn.believeus.controller;


import javax.annotation.Resource;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.model.Tuser;
import cn.believeus.service.IService;

/**
 * 首页面
 * */
@Controller
public class ControllerLogin {
	
	@Resource
	private IService mysqlService;

	@RequestMapping(value = "/login")
	public ModelAndView loginView() {
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/login.jsp");
		return modelView;
	}
	
	@RequestMapping(value="/submit/login",produces = "text/plain; charset=UTF-8")
	public @ResponseBody String login(String email,String password){
		Tuser user = (Tuser) mysqlService.findObject(Tuser.class, "email", email);
		JSONObject jsonObject=new JSONObject();
		if(user!=null){
			if(user.getPassword().equals(password)){
				jsonObject.put("msg","success");
			}else {
				jsonObject.put("msg","密码错误");
			}
		}else {
			jsonObject.put("msg", "该邮箱未被注册");
		}
		return jsonObject.toString();
	}
	
}
