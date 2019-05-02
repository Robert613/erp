package cn.edu.hbpu.erp.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.edu.hbpu.erp.pojo.Admin;
import cn.edu.hbpu.erp.pojo.Department;
import cn.edu.hbpu.erp.service.IAdminService;
import cn.edu.hbpu.erp.service.ICustomerService;
import cn.edu.hbpu.erp.service.IDepartmentService;

@Controller
public class MainController {
	
	@Autowired
	private IAdminService adminService;
	
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private ICustomerService customterService;
	
	@RequestMapping("/getSystemInfo.action")
	@ResponseBody
	public Map<String, Object> getSystemInfo(HttpServletRequest request){
		Map<String, Object> map  = new HashMap<String, Object>();
		String path = request.getContextPath(); 
		String serverIp =request.getLocalName(); //获取服务器IP 
		String domainName = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		ServletContext context =request.getServletContext();
        String serverInfo = context.getServerInfo();
        Admin admin =(Admin)request.getSession().getAttribute("admin");
        List<Department> list = departmentService.getDepartments();
        String[] depNames = new String[list.size()]; 
        int[] count = new int[list.size()];
        for (int i=0;i<list.size();i++) {
			depNames[i] = list.get(i).getDepname();
			count[i] = list.get(i).getDepcount();
		}
        
        String[] names  ={"朋友推荐","网络渠道","企业直访","市场专员"};
		Integer[] values = new Integer[4];
		for (int i=0;i<values.length;i++) {
			values[i] = customterService.getCountBySource(names[i]);
		}
		map.put("version", "YUNHUI ERP V_1.0");
		map.put("domainName", domainName);
		map.put("hostName", "Mr_Jiang");
		map.put("serverInfo", serverInfo);
		map.put("serverIp", serverIp);
		map.put("databaseVersion", "MySQL "+adminService.getDataBaseVersion());
		map.put("loginName",admin.getAdminname());
		map.put("depName", depNames);
		map.put("count", count);
		map.put("values", values);
		return map ;
	}

}
