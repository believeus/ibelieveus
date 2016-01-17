package cn.believeus.admin.controller;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

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
		String[] synds = synd.getSynd().split(",");
		for (String syndname : synds) {
			String code = DigestUtils.md5Hex(syndname);
			Tsyndset syndset = (Tsyndset)mysqlService.findObject(Tsyndset.class,"code", code);
			if(syndset!=null){
				String refer = syndset.getRefer();
				refer+="|"+synd.getId()+":"+synd.getTitle();
				log.debug("refer:"+refer);
				syndset.setRefer(refer);
			}else {
				syndset=new Tsyndset();
				syndset.setRefer(synd.getId()+":"+synd.getTitle());
				syndset.setCode(code);
				syndset.setSynd(syndname);
			}
			log.info("refer:"+syndset.getRefer());
			mysqlService.saveOrUpdate(syndset);
		} 
		return "redirect:/admin/synd/list.jhtml";
	}
	
	@RequestMapping(value="/admin/synd/editView")
	public String editView(Integer id){
		return "/WEB-INF/back/synd/edit.jsp";
	}
	
	/**
	 * 新闻删除
	 * @return
	 */
	@RequestMapping(value="/admin/synd/delete")
	public  String delete(Integer id){
		Tsynd synd = (Tsynd)mysqlService.findObject(Tsynd.class, id);
		String value=synd.getTitle();
		@SuppressWarnings("unchecked")  
		List<Tsyndset> syndsetList = (List<Tsyndset>) ((MySQLService) mysqlService).findObjecList(Tsyndset.class, "refer", value);
		log.info("hibernate search:"+syndsetList.size());
		for (Tsyndset tsyndset : syndsetList) {
			String refer = tsyndset.getRefer();
			log.info("begin refer:"+refer);
			System.out.println(refer);
			if (refer.contains("|" + id + ":" + value + "|")) {
				refer = refer.replace("|" + id + ":" + value + "|", "");
			} else if (refer.contains(id + ":" + value + "|")) {
				refer = refer.replace(id + ":" + value + "|", "");
			} else if (refer.contains("|" + id + ":" + value)) {
				refer = refer.replace("|" + id + ":" + value, "");
			}
			log.info("end refer:"+refer);
			tsyndset.setRefer(refer);
			mysqlService.saveOrUpdate(tsyndset);
		}
		mysqlService.delete(synd);
		return "/admin/synd/list.jhtml";
	}
	
	
}