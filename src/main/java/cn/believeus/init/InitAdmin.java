package cn.believeus.init;

import javax.annotation.Resource;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import cn.believeus.model.Tadmin;
import cn.believeus.model.Tauthority;
import cn.believeus.model.Trole;
import cn.believeus.service.IService;
import cn.believeus.variables.Variables;

@Component
public class InitAdmin implements ApplicationListener<ApplicationEvent>{
	
	@Resource
	private IService mysqlService;
	
	// tomcat第一次启动会调用这个方法
	@Override
	public void onApplicationEvent(ApplicationEvent event) {
		// tomcat启动完毕调用该方法
		if(event instanceof ContextRefreshedEvent){
			Tadmin admin = (Tadmin)mysqlService.findObject(Tadmin.class, Variables.USER_NAME, "admin");
			if(admin == null){
				 admin = new Tadmin();
				 admin.setUsername("admin");
				 admin.setPassword("admin");
				 admin.setDescription("该管理员拥有所有权限");
				 mysqlService.saveOrUpdate(admin);
				 Trole role=new Trole();
				 role.setDescription("该角色拥有所有权限");
				 role.setRoleName("root");
				 role.setAdmin(admin);
				 mysqlService.saveOrUpdate(role);
				 Tauthority authority=new Tauthority();
				 authority.setPermission("*");
				 authority.setRole(role);
				 mysqlService.saveOrUpdate(authority);
			}
		}
	}
}
