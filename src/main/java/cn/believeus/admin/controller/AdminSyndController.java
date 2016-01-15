package cn.believeus.admin.controller;

import java.util.Arrays;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import mydfs.storage.server.MydfsTrackerServer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Tsynd;
import cn.believeus.service.IService;
import cn.believeus.service.MySQLService;

@Controller
public class AdminSyndController {
	
	private static final Log log=LogFactory.getLog(AdminSyndController.class);
	
	
	@Resource
	private IService mysqlService;

	/**
	 * 新闻列表
	 * @return
	 */
	@RequestMapping(value="/admin/synd/list")
	public String list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),20);
		String hql="From Tsynd";
		Page<?> page = ((MySQLService)mysqlService).findObjectList(hql, pageable);
		request.setAttribute("page",page);
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		
		return "/WEB-INF/back/synd/list.jsp";
	}
	
	/**
	 * 新闻添加
	 * @return
	 */
	@RequestMapping(value="/admin/synd/addView")
	public String addView(){
		return "/WEB-INF/back/synd/addView.jsp";
	}
	
	@RequestMapping(value="/admin/synd/save")
	public String save(Tsynd synd){
		mysqlService.saveOrUpdate(synd);
		return "redirect:/admin/synd/list.jhtml";
	}
	
	@RequestMapping(value="/admin/synd/edit")
	public String edit(Integer myNewId, HttpServletRequest request){
		return "/WEB-INF/back/synd/edit.jsp";
	}
	
	/**
	 * 新闻删除
	 * @return
	 */
	@RequestMapping(value="/admin/synd/delete")
	public @ResponseBody String delete(Integer[] ids){
		List<Integer> list = Arrays.asList(ids); 
		return "{\"type\":\"success\"}";
	}
	
	
}