package cn.believeus.admin.controller;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.believeus.model.Tadmin;
import cn.believeus.model.Tauthority;
import cn.believeus.model.Trole;
import cn.believeus.service.IService;

@Controller
public class AdminPowerController {

	@Resource
	private IService mysqlService;
	
	@RequestMapping(value="/admin/addRoleLogic")
	public String addRoleLogic(ServletRequest request){
		
		Trole role = new Trole();
		String roleName = request.getParameter("roleName");
		String description = request.getParameter("description");
		role.setRoleName(roleName);
		role.setDescription(description);
		mysqlService.saveOrUpdate(role);
			
		// 获取被选中的checkbook 并且name="authority"
		String[] parameterValues = request.getParameterValues("authority");
		if(parameterValues !=null){
			for (String permission : parameterValues) {
				Tauthority authority = new Tauthority();
				authority.setPermission(permission);
				authority.setRole(role);
				mysqlService.saveOrUpdate(authority);
			}
		}
		return "redirect:/admin/roleList.jhtml";
	}
	@RequestMapping(value="/admin/updateRole")
	public String editRoleLogic(ServletRequest request){
		String roleId = request.getParameter("roleId");
		String roleName=request.getParameter("roleName");
		String description = request.getParameter("description");
		Trole role=(Trole)mysqlService.findObject(Trole.class, Integer.parseInt(roleId));
		role.setRoleName(roleName);
		role.setDescription(description);
		mysqlService.saveOrUpdate(role);
		List<Tauthority> authoritys = role.getAuthoritys();
		List<Integer> idList=new ArrayList<Integer>();
		if(authoritys!=null){
		 for (Tauthority authority : authoritys) {
			idList.add(authority.getId());
		 }
		}
		// 更新权限之前首先删除之前的权限
		mysqlService.delete(Tauthority.class, idList);
		// 获取被选中的checkbook 并且name="authority"
		String[] parameterValues = request.getParameterValues("authority");
		if(parameterValues!=null){
			for (String permission : parameterValues) {
				Tauthority authority = new Tauthority();
				authority.setPermission(permission);
				authority.setRole(role);
				mysqlService.saveOrUpdate(authority);
			}
		}
		
		return "redirect:/admin/roleList.jhtml";
	}
	@RequestMapping(value="/admin/updateRoleForAdmin")
	public String updateRoleForAdmin(ServletRequest request){
		String adminId = request.getParameter("adminId");
		String adminName = request.getParameter("adminName");
		String description = request.getParameter("description");
		String roleId=request.getParameter("roleId");
		String repass = request.getParameter("repass");
		Trole role=(Trole)mysqlService.findObject(Trole.class, Integer.parseInt(roleId));
		Tadmin admin=(Tadmin)mysqlService.findObject(Tadmin.class, Integer.parseInt(adminId));
		admin.setUsername(adminName);
		admin.setPassword(repass);
		admin.setDescription(description);
		role.setAdmin(admin);
		mysqlService.saveOrUpdate(role);
		return "redirect:/admin/adminList.jhtml";
		
		
	}
}
