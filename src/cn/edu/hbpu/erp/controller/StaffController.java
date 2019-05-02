package cn.edu.hbpu.erp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageInfo;
import cn.edu.hbpu.erp.pojo.Staff;
import cn.edu.hbpu.erp.service.IStaffService;

@Controller
public class StaffController {
	
	@Autowired
	private IStaffService staffService;
	
	
	@RequestMapping("/addStaff.action")
	@ResponseBody
	public Map<String, String> addStaff(Staff staff){
		Map<String, String> map = new HashMap<String, String>();
	     int result =staffService.addStaff(staff);
	     if(result != 0 ){
	    	 map.put("result", "OK");    	 
	     }else{
	    	 map.put("result", "error");
	     }
		return map;
		
	}
	@RequestMapping("/getStaffs.action")
    @ResponseBody
    public PageInfo<Staff>  getStaffList(int page,int row,String staffname){
    	PageInfo<Staff> pageInfo = null;     
    	staffname = staffname.trim();
    	if(staffname == null || staffname.equals(" ") || staffname.equals("")){
    		pageInfo = staffService.getStaffs(page, row);
    	}else{	
			try {
				String content = URLDecoder.decode(staffname, "UTF-8");
				pageInfo = staffService.getStaffsByName(page, row, content);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} 		
    	}
    	return pageInfo;
    }
	@RequestMapping("/getStaffInfo.action")
    @ResponseBody
    public Staff getCustomerInfo(int sid){  	
    	return staffService.getStaffInfo(sid);
    }	
	@RequestMapping("/delStaff.action")
    @ResponseBody
    public Map<String, String> deleteCustomer(int sid){
    	Map<String, String> map = new HashMap<>();   	
    	int res = staffService.deleteStaffByIsDel(sid);  	
    	if(res != 0){
    		map.put("result", "OK");
    	}else{
    		map.put("result", "error");
    	}  	
    	return map ;
	}
	@RequestMapping("/batchdelStaff.action")  
	  @ResponseBody
    public String batchDelStaff(@RequestParam(value="sIds[]")Integer[] sIds){
		  for(int i=0;i<sIds.length;i++){
			  
			  staffService.deleteStaffByIsDel(sIds[i]);
		  }
		  return "OK";
	  }

}
