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
import cn.believeus.model.Tsyndkey;
import cn.believeus.model.Tsyndset;
import cn.believeus.service.IService;
import cn.believeus.service.MySQLService;

@Controller
public class AdminSyndkeyController {
	
	@Resource
	private IService mysqlService;
	
	@RequestMapping("/admin/syndkey/list")
	public ModelAndView list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),12);
		String hql="From Tsyndkey";
		Page<?> page = ((MySQLService)mysqlService).findObjectList(hql, pageable);
		request.setAttribute("page",page);
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		ModelAndView modelView=new ModelAndView();
		String viewName="/WEB-INF/back/syndkey/list.jsp";
		modelView.setViewName(viewName);
		return modelView;
	}
	@RequestMapping("/admin/syndkey/editView")
	public ModelAndView editView(Integer id){
		ModelAndView modelView=new ModelAndView();
		Tsyndkey syndkey=(Tsyndkey)mysqlService.findObject(Tsyndkey.class, id);
		modelView.addObject("syndkey", syndkey);
		modelView.setViewName("/WEB-INF/back/syndkey/editView.jsp");
		return modelView;
	}
	
	@RequestMapping("/admin/syndkey/update")
	public @ResponseBody String update(Integer id,String keypoint){
		Tsyndkey syndkey=(Tsyndkey)mysqlService.findObject(Tsyndkey.class, id);
		String code=DigestUtils.md5Hex(keypoint.trim());
		for(Tsyndset syndset:syndkey.getSyndsetList()){
			if(syndset.getCode().equals(code)){
				return "false";
			}
		}
		Tsyndset syndset=new Tsyndset();
		syndset.setCode(code);
		syndset.setSynd(keypoint);
		syndset.getSyndkeyList().add(syndkey);
		mysqlService.saveOrUpdate(syndset);
		return "true";
	}
	
	@RequestMapping("/admin/syndkey/delete")
	public @ResponseBody String delete(Integer id,String keypoint){
		Tsyndkey syndkey=(Tsyndkey)mysqlService.findObject(Tsyndkey.class, id);
		String code=DigestUtils.md5Hex(keypoint.trim());
		for(Tsyndset syndset:syndkey.getSyndsetList()){
			if(syndset.getCode().equals(code)){
				syndset.getSyndkeyList().remove(syndkey);
				mysqlService.saveOrUpdate(syndset);
				return "true";
			}
		}
		return "false";
	}
}
