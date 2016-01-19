package cn.believeus.admin.controller;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Tsynd;
import cn.believeus.model.Tsyndset;
import cn.believeus.service.IService;
import cn.believeus.service.MySQLService;

@Controller
public class AdminSyndsetController {
	@Resource
	private IService mysqlService;
	
	@ModelAttribute
	public void getSyndset(HttpServletRequest request,@RequestParam(value="id",required=false)Integer id,Map<String, Object> map) {
		String uri = request.getRequestURI();
		if(uri.contains("/admin/syndset/update")){
			if(id!=null){
				Tsyndset syndset=(Tsyndset)mysqlService.findObject(Tsyndset.class, id);
				map.put("syndset", syndset);
			}
		}
	}
	
	@RequestMapping("/admin/syndset/list")
	public String list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql="From Tsyndset";
		Page<?> page = ((MySQLService)mysqlService).findObjectList(hql, pageable);
		request.setAttribute("page",page);
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		
		return "/WEB-INF/back/syndset/list.jsp";
	}
	
	@RequestMapping("/admin/syndset/editView")
	public ModelAndView editView(Integer id){
		ModelAndView modelView=new ModelAndView();
		Tsyndset syndset=(Tsyndset)mysqlService.findObject(Tsyndset.class, id);
		modelView.addObject("syndset", syndset);
		modelView.setViewName("/WEB-INF/back/syndset/editView.jsp");
		return modelView;
	}
	
	@RequestMapping("/admin/syndset/deleteRef")
	public String delete(Integer id,String[] refers){
		if(refers!=null && refers.length>0){
			Tsyndset syndset=(Tsyndset)mysqlService.findObject(Tsyndset.class, id);
			for (String refer : refers) {
				Matcher matcher = Pattern.compile("\\d+").matcher(refer);
				if(matcher.find()){
					Tsynd synd = (Tsynd)mysqlService.findObject(Tsynd.class, Integer.parseInt(matcher.group()));
					if(synd!=null){
						if(StringUtils.isNotEmpty(synd.getSynd())){
							synd.setSynd(synd.getSynd().replace(syndset.getSynd(), ""));
							mysqlService.saveOrUpdate(synd);
						}
					}
				}  
				
				if(syndset!=null){
					if(StringUtils.isNotEmpty(syndset.getRefer())){
						syndset.setRefer(syndset.getRefer().replace(refer, ""));
					}
				}
			}
			mysqlService.saveOrUpdate(syndset);
		}
		return "redirect:/admin/syndset/editView.jhtml?id="+id;
	}
	
	@RequestMapping("/admin/syndset/delete")
	public String delete(Integer id){
		Tsyndset syndset = (Tsyndset)mysqlService.findObject(Tsyndset.class, id);
		String refer=syndset.getRefer();
		if(StringUtils.isNotEmpty(refer)){
			for(String ref:refer.split("\\s")){
				Matcher matcher = Pattern.compile("\\d+").matcher(ref);
				while(matcher.find()){
					Tsynd synd=(Tsynd)mysqlService.findObject(Tsynd.class, Integer.parseInt(matcher.group()));
					synd.setSynd(synd.getSynd().replace(syndset.getSynd(), ""));
					mysqlService.saveOrUpdate(synd);
				}
			}
		}
		mysqlService.delete(syndset);
		return "redirect:/admin/syndset/list.jhtml";
	}
	
	@RequestMapping("/admin/syndset/update")
	public String update(@ModelAttribute("syndset")Tsyndset syndset){
		mysqlService.saveOrUpdate(syndset);
		return "redirect:/admin/syndset/list.jhtml";
	}
}
