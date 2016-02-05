package cn.believeus.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.TsyndMaster;
import cn.believeus.model.TsyndMajor;
import cn.believeus.service.IService;
import cn.believeus.service.MySQLService;

@Controller
public class AdminSyndmasterController {
	
	@Resource
	private IService mysqlService;
	
	@RequestMapping("/admin/syndmaster/list")
	public ModelAndView list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),12);
		String hql="From TsyndMaster";
		Page<?> page = ((MySQLService)mysqlService).findObjectList(hql, pageable);
		request.setAttribute("page",page);
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		ModelAndView modelView=new ModelAndView();
		String viewName="/WEB-INF/back/syndmaster/list.jsp";
		modelView.setViewName(viewName);
		return modelView;
	}
	
	@RequestMapping("/admin/syndmaster/addView")
	public ModelAndView addView(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/back/syndmaster/addView.jsp");
		return modelView;
	}
	@RequestMapping("/admin/syndmaster/save")
	public String save(String synd,String syndmajor,String pulse){
		String code=DigestUtils.md5Hex(synd.trim());
		TsyndMaster master=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, "code", code);
		if(master==null){
			master=new TsyndMaster();
			master.setCode(code);
			master.setSynd(synd);
			master.setPulse(pulse.trim());
			TsyndMajor major=new TsyndMajor();
			if(syndmajor!=null){
				major.setCode(DigestUtils.md5Hex(syndmajor.trim()));
				major.setSynd(syndmajor);
			}
			master.getSyndmajors().add(major);
			mysqlService.saveOrUpdate(master);
		}
		return "redirect:/admin/syndmaster/editView.jhtml?id="+master.getId();
	}
	
	@RequestMapping("/admin/syndmaster/ajaxSynd")
	public @ResponseBody String ajaxSynd(String synd){
		String code=DigestUtils.md5Hex(synd.trim());
		TsyndMaster syndmaster=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, "code", code);
		if(syndmaster!=null){
			return syndmaster.getId()+"";
		}
		return "false";
	}
	
	@RequestMapping("/admin/syndmaster/updatePluse")
	public @ResponseBody String updatePulse(Integer id,String pulse){
		TsyndMaster syndmaster=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, id);
		if(pulse!=null&&!"".equals(pulse)){
			syndmaster.setPulse(pulse.trim());
		}else{
			syndmaster.setPulse("");
		}
		mysqlService.saveOrUpdate(syndmaster);
		return "true";
		
	}
	@RequestMapping("/admin/syndmaster/editView")
	public ModelAndView editView(Integer id){
		ModelAndView modelView=new ModelAndView();
		TsyndMaster syndmaster=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, id);
		modelView.addObject("syndmaster", syndmaster);
		modelView.setViewName("/WEB-INF/back/syndmaster/editView.jsp");
		return modelView;
	}
	
	@RequestMapping("/admin/syndmaster/update")
	public @ResponseBody String update(Integer id,String syndmaster){
		TsyndMaster master=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, id);
		String code=DigestUtils.md5Hex(syndmaster.trim());
		for(TsyndMajor syndmajor:master.getSyndmajors()){
			if(syndmajor.getCode().equals(code)){
				return "false";
			}
		}
		TsyndMajor syndmajor=new TsyndMajor();
		syndmajor.setCode(code);
		syndmajor.setSynd(syndmaster);
		master.getSyndmajors().add(syndmajor);
		mysqlService.saveOrUpdate(master);
		return "true";
	}
	
	@RequestMapping("/admin/syndmaster/delete")
	public @ResponseBody String delete(Integer id,String syndmaster){
		TsyndMaster master=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, id);
		String code=DigestUtils.md5Hex(syndmaster.trim());
		for(TsyndMajor syndmajor:master.getSyndmajors()){
			if(syndmajor.getCode().equals(code)){
				master.getSyndmajors().remove(syndmajor);
				mysqlService.saveOrUpdate(master);
				mysqlService.delete(syndmajor);
				return "true";
			}
		}
		return "false";
	}
	@RequestMapping("/admin/syndmaster/deleteById")
	public String deleteById(Integer id){
		mysqlService.delete(TsyndMaster.class, id);
		return "redirect:/admin/syndmaster/list.jhtml";
	}
	
	
}
