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

import cn.edu.hbpu.erp.pojo.Department;
import cn.edu.hbpu.erp.service.IDepartmentService;

@Controller
public class DepartmentController {
	@Autowired
	private IDepartmentService departmentService;	
	@RequestMapping("/addDepartment.action")
	@ResponseBody
	public Map<String, String> addDepartment(Department department){
		Map<String, String> map = new HashMap<>();
		int result = departmentService.addDepartment(department);
		if(result != 0){
			map.put("result", "OK");
		}else{
			map.put("result", "error");
		}
		return map;
	}
    @RequestMapping("/getDepartments.action")
    @ResponseBody
	public PageInfo<Department> getDepartmentList(int page,int row ,String depname){
    	PageInfo<Department> pageInfo = null;
    	
    	depname = depname.trim();
    	if(depname==null || depname.equals(" ") || depname.equals("")){
    		pageInfo =  departmentService.getDepartments(page,row);
    	}else{
    		try {
				String content = URLDecoder.decode(depname, "UTF-8");
				pageInfo = departmentService.getDepartmentsByName(page, row, content);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
    	}    	
		return pageInfo;
	}  
    @RequestMapping("/getDepartmentInfo.action")
    @ResponseBody
	public Department getDepartmentInfo(int depid){
		return departmentService.getDepartmentInfo(depid);
	}    
    @RequestMapping("/updateDepartmentInfo.action")
    @ResponseBody
	public String updateDepartmentInfo(Department department){	
		 departmentService.updateDepartment(department);
		 return "OK";
	}   
    @RequestMapping("/delDepartment.action")
    @ResponseBody
	public Map<String, String>delDepartment(int depid){	
    	Map<String, String> map = new HashMap<>();
		 int res  = departmentService.deleteDepartment(depid);		 
		 if(res  != 0){
			 map.put("result", "OK");
		 }else{
			 map.put("result", "error");
		 }
		 
		 return map;
	}   
    @RequestMapping("/batchdelDepartment.action")
    @ResponseBody
    public String batchDelDepartment(@RequestParam(value="depIds[]")Integer[] depIds){
    	for(int i =0;i<depIds.length;i++){
    		departmentService.deleteDepartment(depIds[i]);
    	}
    	return "OK";
    }   
    @RequestMapping("/updateDepartmentStatus.action")
    @ResponseBody
	public Map<String, String> updateDepartmentStatus(int flag, int depid){	
    	Map<String, String> map = new HashMap<>();  	 
		 int   res  = departmentService.updateDepartmentStatus(flag, depid);	 
		 if(res != 0){
			 map.put("result", "OK");
		 }else{
			 map.put("result", "error");
		 }	 
		 return map;
	}
}
