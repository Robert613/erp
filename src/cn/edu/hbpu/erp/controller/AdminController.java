package cn.edu.hbpu.erp.controller;

import cn.edu.hbpu.erp.pojo.Admin;
import cn.edu.hbpu.erp.pojo.Logins;
import cn.edu.hbpu.erp.service.IAdminService;
import cn.edu.hbpu.erp.service.ILoginsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AdminController {
	
	@Autowired
	private IAdminService adminService;
   
	@Autowired
	private ILoginsService loginsService;
	
	@RequestMapping("/login.action")
	public String  login(Admin admin,HttpServletRequest request,HttpSession session ,Model model ){
		Admin admin2 = adminService.login(admin);
		if(admin2 != null){
			//System.out.println(admin2);
			//System.out.println(admin2.getPhone()+"--- -"+admin2.getAdminname());
			session.setMaxInactiveInterval(24*60*60);
			session.setAttribute("admin", admin2);
			String loginName = admin2.getAdminname();
			Date loginTime = new Date();
			String loginIp = request.getRemoteAddr();
			Logins logins = new Logins();
			logins.setLoginIp(loginIp);
			logins.setLoginName(loginName);
			logins.setLoginTime(loginTime);
			loginsService.addLogin(logins);
			return "/index";
		}else{
			model.addAttribute("error", "����ֻ��ź����벻ƥ��,�����������");
			model.addAttribute("phone", admin.getPhone());
			model.addAttribute("password", admin.getPassword());
			return "/login";
		}
		 
		 
	}
	
	@RequestMapping("/getAdminInfo.action")
	@ResponseBody
	public Admin findAdminById(int id){
		return adminService.findById(id);
	}
	
	@RequestMapping("/editAdminInfo.action")
	@ResponseBody
	public Map<String, String> updateAdmin(Admin admin){
		Map<String, String> map = new HashMap<>();
		int res = adminService.updateAdminInfo(admin);
		if(res != 0){
			map.put("result", "OK");
		}else{
			map.put("result", "error");
		}
		return map ;
	}
	
	@RequestMapping("/exit.action")
	public String exit(HttpServletResponse response,HttpSession session){
		
		Object object = session.getAttribute("admin");
		
		if(object != null){
			session.removeAttribute("admin");
		}
		 
		return "/login";
	}
}
