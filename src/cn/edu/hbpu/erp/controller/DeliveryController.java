package cn.edu.hbpu.erp.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Delivery;
import cn.edu.hbpu.erp.service.IDeliveryService;

@Controller
public class DeliveryController {
	
	@Autowired
	private IDeliveryService deliveryService;
	
	@RequestMapping("/addDelivery.action")
	@ResponseBody
	public String addDelivery(Delivery delivery){
		
		  delivery.setIsdel(0);
		  delivery.setTime(new Date());
		  deliveryService.addDeliery(delivery);
		  
		  return "OK";
	}
	
	
	@RequestMapping("/getDeliveryList.action")
	@ResponseBody
	public PageInfo<Delivery> getDeliveryList(int page,int row,String gname,String starttime,String endtime){
		
		PageInfo<Delivery> pageInfo = null;
		gname = gname.trim();
		starttime = starttime.trim();
		endtime = endtime.trim();
//		System.out.println(gname);
//		System.out.println(starttime);
//		System.out.println(endtime);
		if(gname.equals("") && starttime.equals("") && endtime.equals("")){
//			System.out.println("¹þ¹þ");
			pageInfo = deliveryService.getDeliveryList(page, row);
		}else{
//			System.out.println("hehe");
			Map<String, String> map = new HashMap<String, String>();
			map.put("gname", gname);
			map.put("starttime", starttime);
			map.put("endtime", endtime);
			
			pageInfo = deliveryService.getDeliveryList(page, row, map);
		}
		
		return pageInfo;
		
	}
	
	
	@RequestMapping("/getDeliveryInfo.action")
	@ResponseBody
	public Delivery findDeliveryByDid(int did){
		
		return deliveryService.findByDid(did);
	}

}
