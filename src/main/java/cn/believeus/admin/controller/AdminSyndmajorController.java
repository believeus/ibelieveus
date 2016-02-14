package cn.believeus.admin.controller;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;
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
import cn.believeus.model.TsyndMaster;
import cn.believeus.model.TsyndMajor;
import cn.believeus.service.IService;
import cn.believeus.service.MySQLService;

@Controller
public class AdminSyndmajorController {
	@Resource
	private IService mysqlService;
	
	@ModelAttribute
	public void getsyndmajor(HttpServletRequest request,@RequestParam(value="id",required=false)Integer id,Map<String, Object> map) {
		String uri = request.getRequestURI();
		if(uri.contains("/admin/syndmajor/update")){
			if(id!=null){
				TsyndMajor syndmajor=(TsyndMajor)mysqlService.findObject(TsyndMajor.class, id);
				map.put("syndmajor", syndmajor);
			}
		}
	}
	
	@RequestMapping("/admin/syndmajor/list")
	public String list(HttpServletRequest request){
		String pageNumber = request.getParameter("pageNumber");
		// 如果为空，则设置为1
		if (StringUtils.isEmpty(pageNumber)) {
			pageNumber="1";
		}
		Pageable pageable=new Pageable(Integer.valueOf(pageNumber),12);
		String hql="From TsyndMajor";
		Page<?> page = ((MySQLService)mysqlService).findObjectList(hql, pageable);
		request.setAttribute("page",page);
		request.setAttribute("size",page.getTotal());
		// 分页
		PaginationUtil.pagination(request, page.getPageNumber(),page.getTotalPages(), 0);
		
		return "/WEB-INF/back/syndmajor/list.jsp";
	}
	
	@RequestMapping("/admin/syndmajor/addView")
	public ModelAndView addView(){
		ModelAndView modelView=new ModelAndView();
		modelView.setViewName("/WEB-INF/back/syndmajor/addView.jsp");
		return modelView;
	}
	
	@RequestMapping("/admin/syndmajor/ajaxsynd")
	public @ResponseBody String ajaxsynd(String synd){
		String code = DigestUtils.md5Hex(synd);
		TsyndMajor syndmajor = (TsyndMajor)mysqlService.findObject(TsyndMajor.class, "code", code);
		if (syndmajor!=null) {
			return "false";
		}
		return "true";
	}
	
	@RequestMapping("/admin/syndmajor/save")
	public String save(TsyndMajor syndmajor){
		String maybesynd=syndmajor.getMaybesynd();
		if(StringUtils.isNotEmpty(maybesynd)){
			TsyndMaster syndmaster=new TsyndMaster();
			syndmaster.setSynd(maybesynd);
			syndmajor.getSyndmasters().add(syndmaster);
		}
		mysqlService.saveOrUpdate(syndmajor);
		return "redirect:/admin/syndmajor/editView.jhtml?id="+syndmajor.getId();
	}
	
	@RequestMapping("/admin/syndmajor/editView")
	public ModelAndView editView(Integer id){
		ModelAndView modelView=new ModelAndView();
		TsyndMajor syndmajor=(TsyndMajor)mysqlService.findObject(TsyndMajor.class, id);
		modelView.addObject("syndmajor", syndmajor);
		modelView.setViewName("/WEB-INF/back/syndmajor/editView.jsp");
		return modelView;
	}
	
	@RequestMapping("/admin/syndmajor/deleteRef")
	public String delete(Integer id,String[] refers){
		if(refers!=null && refers.length>0){
			TsyndMajor syndmajor=(TsyndMajor)mysqlService.findObject(TsyndMajor.class, id);
			for (String refer : refers) {
				Matcher matcher = Pattern.compile("\\d+").matcher(refer);
				if(matcher.find()){
					Tsynd synd = (Tsynd)mysqlService.findObject(Tsynd.class, Integer.parseInt(matcher.group()));
					if(synd!=null){
						if(StringUtils.isNotEmpty(synd.getSynd())){
							synd.setSynd(synd.getSynd().replace(syndmajor.getSynd(), ""));
							mysqlService.saveOrUpdate(synd);
						}
					}
				}  
				if(syndmajor!=null){
					if(StringUtils.isNotEmpty(syndmajor.getRefer())){
						syndmajor.setRefer(syndmajor.getRefer().replace(refer, ""));
					}
				}
			}
			mysqlService.saveOrUpdate(syndmajor);
		}
		return "redirect:/admin/syndmajor/editView.jhtml?id="+id;
	}
	
	@RequestMapping("/admin/syndmajor/delete")
	public String delete(Integer id){
		TsyndMajor syndmajor = (TsyndMajor)mysqlService.findObject(TsyndMajor.class, id);
		
		mysqlService.delete(syndmajor);
		return "redirect:/admin/syndmajor/list.jhtml";
	}
	
	@RequestMapping("/admin/syndmajor/update")
	public String update(@ModelAttribute("syndmajor")TsyndMajor syndmajor,String hiddensynd){
		if(!hiddensynd.equals(syndmajor.getSynd())){
			for(String rid:syndmajor.getReferIds()){
				Tsynd synd=(Tsynd)mysqlService.findObject(Tsynd.class,Integer.parseInt(rid));
				if(synd.getSynd()!=null){
					String inputsynd=syndmajor.getSynd();
					String newsynd=synd.replace(hiddensynd,inputsynd);
					synd.setSynd(newsynd+" ");
					mysqlService.saveOrUpdate(synd);
				}
			}
			//获取更新的病证
			String code=DigestUtils.md5Hex(syndmajor.getSynd());
			TsyndMajor syndmajorobj=(TsyndMajor)mysqlService.findObject(TsyndMajor.class, "code", code);
			if(syndmajorobj==null){
				syndmajor.setCode(code);
				mysqlService.saveOrUpdate(syndmajor);
			}
		}
		return "redirect:/admin/syndmajor/editView.jhtml?id="+syndmajor.getId();
	}
	@RequestMapping("/admin/syndmajor/savesmaybesynd")
	public String savesmaybesynd(Integer id,String maybesynd){
		TsyndMajor syndmajor=(TsyndMajor)mysqlService.findObject(TsyndMajor.class, id);
		
		if(StringUtils.isNotEmpty(maybesynd)){
			maybesynd=maybesynd.replaceAll(",", "");
			String code=DigestUtils.md5Hex(maybesynd);
			TsyndMaster syndmaster=(TsyndMaster)mysqlService.findObject(TsyndMaster.class,"code", code);
			if(syndmaster==null){
				syndmaster=new TsyndMaster();
				syndmaster.setSynd(maybesynd);
			}
			syndmajor.getSyndmasters().add(syndmaster);
			mysqlService.saveOrUpdate(syndmajor);
		}
		return "redirect:/admin/syndmajor/editView.jhtml?id="+syndmajor.getId();
	}
	
	@RequestMapping("/admin/syndmajor/deletemaybesynd")
	public @ResponseBody String deletemaybesynd(Integer syndmajorId,Integer syndkeyId){
		TsyndMajor syndmajor=(TsyndMajor)mysqlService.findObject(TsyndMajor.class,syndmajorId);
		TsyndMaster syndmaster=(TsyndMaster)mysqlService.findObject(TsyndMaster.class, syndkeyId);
		syndmajor.getSyndmasters().remove(syndmaster);
		syndmaster.getSyndmajors().remove(syndmajor);
		mysqlService.saveOrUpdate(syndmajor);
		return "true";
	}
}
