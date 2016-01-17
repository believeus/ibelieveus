package cn.believeus.admin.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
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
	
	@RequestMapping("/admin/syndset/update")
	public String update(@ModelAttribute("syndset")Tsyndset syndset){
		mysqlService.saveOrUpdate(syndset);
		return "redirect:/admin/syndset/list.jhtml";
	}
}
