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
import cn.edu.hbpu.erp.pojo.Customer;
import cn.edu.hbpu.erp.service.ICustomerService;

@Controller
public class CustomerController {	
	@Autowired
	private ICustomerService customerService;
	@RequestMapping("/addcustomer.action")
	@ResponseBody
	public Map<String, String> addCustomer(Customer customer){
		Map<String, String> map = new HashMap<>();
		int res = customerService.addCustomer(customer);
		if(res != 0){
			map.put("result", "OK");
		}else{
			map.put("result", "error");
		}
		return map;
	}
	    @RequestMapping("/getCustomers.action")
	    @ResponseBody
	    public PageInfo<Customer>  getCustomerList(int page,int row,String cname){
	    	PageInfo<Customer> pageInfo = null;
	    	
	    	cname = cname.trim();
	    	
	    	if(cname == null || cname.equals(" ") || cname.equals("")){
	    		pageInfo = customerService.getCustomers(page, row);
	    	}else{	
				try {
					String content = URLDecoder.decode(cname, "UTF-8");
					pageInfo = customerService.getCustomersByName(page, row, content);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}	    		
	    	}
	    	return pageInfo;
	    }    	    
	    @RequestMapping("/getCustomerInfo.action")
	    @ResponseBody
	    public Customer getCustomerInfo(int cid){	    	
	    	return customerService.getCustomerInfo(cid);
	    }	    
	    @RequestMapping("/editCustomerInfo.action")
	    @ResponseBody
	    public Map<String, String> editCustomer(Customer customer){	    	
	    	Map<String, String> map = new HashMap<>();	    	
	    	int res = customerService.updateCustomer(customer);    	
	    	if(res != 0){
	    		map.put("result", "OK");
	    	}else{
	    		map.put("result", "error");
	    	}	    	
	    	return map;
	    }
	    
	    @RequestMapping("/delCustomer.action")
	    @ResponseBody
	    public Map<String, String> deleteCustomer(int cid){
	    	Map<String, String> map = new HashMap<>();
	    	
	    	int res = customerService.updateByStatus(cid);
	    	
	    	if(res != 0){
	    		map.put("result", "OK");
	    	}else{
	    		map.put("result", "error");
	    	}
	    	
	    	return map ;
	    }
	    
	    @RequestMapping("/batchdelCustomer.action")  
		@ResponseBody
	    public String batchDelStaff(@RequestParam(value="cIds[]")Integer[] cIds){
			  for(int i=0;i<cIds.length;i++){
				  
				  customerService.updateByStatus(cIds[i]);
			  }
			  return "OK";
		  }
	      
	    @RequestMapping("/findCustomerById.action")
	    @ResponseBody
	    public Customer findCustomerById(int cid){
		   
		   Customer customer ;
		   
		   if(customerService.findCustomerById(cid)==null){
			   customer = new Customer();
		   }else{
			  customer =  customerService.findCustomerById(cid);
		   }
			 
		   return  customer;
	   }

}
