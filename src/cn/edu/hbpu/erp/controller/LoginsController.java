package cn.edu.hbpu.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Logins;
import cn.edu.hbpu.erp.service.ILoginsService;

@Controller
public class LoginsController {
	
	@Autowired
	private ILoginsService loginsService;
	
	@RequestMapping("/getLoginsList.action")
	@ResponseBody
	public PageInfo<Logins> getLoginsList(int page,int row,String loginName){
		
		loginName = loginName.trim();
		
		PageInfo<Logins> pageInfo = null;
	    
		if(loginName == null || loginName.equals(" ") || loginName.equals("")){
			
			pageInfo = loginsService.getCustomers(page, row);
			
		}else{
			pageInfo = loginsService.getCustomersByName(page, row, loginName);
		}
		
		return pageInfo;
	}
	
	
	

}
