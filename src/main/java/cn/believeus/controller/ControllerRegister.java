package cn.believeus.controller;

import javax.annotation.Resource;
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
public class ControllerRegister {
	
	@Resource
	private IService mysqlService;

	
	@RequestMapping(value = "/register")
	public ModelAndView register() {
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/front/register.jsp");
		return modelView;
	}
	
	@RequestMapping(value = "/is_registered_un")
	public @ResponseBody String is_registered_un(String username) {
		Tuser user = (Tuser)mysqlService.findObject(Tuser.class, "username", username);
		if (user==null) {
			return "true";
		}else {
			return "false";
		}
	}
	@RequestMapping(value = "/is_registered_el")
	public @ResponseBody String is_registered_el(String email) {
		Tuser user = (Tuser)mysqlService.findObject(Tuser.class, "email", email);
		if (user==null) {
			return "true";
		}else {
			return "false";
		}
	}
	//保存注册用户 
	@RequestMapping(value = "/register/save")
	public String save(Tuser user) {
		mysqlService.saveOrUpdate(user);
		// 密码加密
		return "redirect:/login.jhtml";
	}
}
