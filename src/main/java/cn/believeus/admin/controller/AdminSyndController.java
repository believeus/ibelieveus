package cn.believeus.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.believeus.PaginationUtil.Page;
import cn.believeus.PaginationUtil.Pageable;
import cn.believeus.PaginationUtil.PaginationUtil;
import cn.believeus.model.Tsynd;
import cn.believeus.model.Tsyndset;
import cn.believeus.service.IService;
import cn.believeus.service.MySQLService;

@Controller
public class AdminSyndController {
	
	private static final Log log=LogFactory.getLog(AdminSyndController.class);
	
	
	@Resource
	private IService mysqlService;
	
	@ModelAttribute
	public void getSynd(HttpServletRequest request,@RequestParam(value="id",required=false)Integer id,Map<String, Object> map){
		String uri = request.getRequestURI();
		if(uri.contains("/admin/synd/update")){
			Tsynd synd = (Tsynd)mysqlService.findObject(Tsynd.class, id);
			map.put("synd", synd);
		}
	}
	
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
	
	@RequestMapping(value="/admin/synd/addView")
	public String addView(){
		return "/WEB-INF/back/synd/addView.jsp";
	}
	
	@RequestMapping(value="/admin/synd/save")
	public String save(Tsynd synd){
		mysqlService.saveOrUpdate(synd);
		String[] synds = synd.getSynd().split(",");
		for (String syndname : synds) {
			String code = DigestUtils.md5Hex(syndname.trim());
			Tsyndset syndset = (Tsyndset)mysqlService.findObject(Tsyndset.class,"code", code);
			if(syndset!=null){
				String refer = syndset.getRefer();
				refer+="["+synd.getId()+":"+synd.getTitle()+"] ";
				log.debug("refer:"+refer);
				syndset.setRefer(refer);
			}else {
				syndset=new Tsyndset();
				String refer=synd.getId()+":"+synd.getTitle();
				syndset.setRefer("["+refer+"] ");
				syndset.setCode(code);
				syndset.setSynd(syndname);
			}
			log.info("refer:"+syndset.getRefer());
			mysqlService.saveOrUpdate(syndset);
		} 
		return "redirect:/admin/synd/list.jhtml";
	}
	
	@RequestMapping(value="/admin/synd/editView")
	public ModelAndView editView(Integer id){
		Tsynd synd=(Tsynd)mysqlService.findObject(Tsynd.class, id);
		ModelAndView modelView=new ModelAndView();
		modelView.addObject("synd", synd);
		modelView.setViewName("/WEB-INF/back/synd/editView.jsp");
		return modelView;
	}
	@RequestMapping(value="/admin/synd/update")
	public String update(@ModelAttribute(value="synd") Tsynd synd){
		mysqlService.saveOrUpdate(synd);
		for(String syndname :synd.getSynd().split(",")){
			String code=DigestUtils.md5Hex(syndname.trim());
			Tsyndset syndset=(Tsyndset)mysqlService.findObject(Tsyndset.class,"code", code);
			if(syndset==null){
				syndset=new Tsyndset();
				String refer=synd.getId()+":"+synd.getTitle();
				syndset.setRefer("["+refer+"]");
				syndset.setCode(code);
				syndset.setSynd(syndname);
				mysqlService.saveOrUpdate(syndset);
			}
		}
		return "redirect:/admin/synd/list.jhtml";
	}
	
	@RequestMapping(value="/admin/synd/delete")
	public  String delete(Integer id){
		Tsynd synd = (Tsynd)mysqlService.findObject(Tsynd.class, id);
		String value=synd.getTitle().trim();
		@SuppressWarnings("unchecked")  
		List<Tsyndset> syndsetList = (List<Tsyndset>) ((MySQLService) mysqlService).findObjecList(Tsyndset.class, "refer", value);
		log.info("hibernate search:"+syndsetList.size());
		for (Tsyndset tsyndset : syndsetList) {
			String refer = tsyndset.getRefer();
			log.info("begin refer:"+refer);
			refer = refer.replace("[" + id + ":" + value + "]", "");
			log.info("end refer:"+refer);
			tsyndset.setRefer(refer);
			mysqlService.saveOrUpdate(tsyndset);
		}
		mysqlService.delete(synd);
		return "/admin/synd/list.jhtml";
	};
	
	@RequestMapping("/autocomplete/getSynd")
	public @ResponseBody String getSynd(@RequestParam(value="keywords")String keywords) {
		StringBuilder sb=new StringBuilder();
		if(StringUtils.isNotEmpty(keywords)){
			System.out.println(keywords);
			@SuppressWarnings("unchecked")
			List<Tsyndset> syndset = (List<Tsyndset>) ((MySQLService)mysqlService).findObjecList(Tsyndset.class, "synd", keywords);
			for (Tsyndset synd : syndset) {
				sb.append("<span>").append(synd.getSynd()).append("</span><br>");
			}
		}
		return sb.toString();
	}
	
}