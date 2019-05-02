package cn.edu.hbpu.erp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Orders;
import cn.edu.hbpu.erp.service.IDeliveryService;
import cn.edu.hbpu.erp.service.IOrderService;

@Controller
public class OrdersController {
	
	@Autowired
	private IOrderService orderService;
	
	
	@Autowired
	private IDeliveryService deliveryService;
	
	/**
	 * 添加客户订单
	 * @param orders  订单对象
	 * @return  一个判断添加订单是否成功map集合
	 */
	@RequestMapping("/addOrder.action")
	@ResponseBody
	public Map<String, String> addOrders(Orders orders){
		
		orders.setCreatetime(new Date());
		
		orders.setIsdel(0);
		
		//System.out.println(orders);
		
		Map<String, String> map = new HashMap<String, String>();
		
		int res =  orderService.addOrder(orders);
		
		//System.out.println(res);
		
		if(res != 0 ){
			map.put("result", ""+res);
		}else{
			map.put("result", "0");
		}
		
		return map;
	}
	
	@RequestMapping("/getOrdersList.action")
	@ResponseBody
	public PageInfo<Orders> getOrderList(int page,int row , String name){
		PageInfo<Orders> pageInfo = null;
		name = name.trim();
		if(name == null || name.equals(" ") || name.equals("")){
			pageInfo = orderService.getOrders(page, row);
		}else{
			try {
				String content = URLDecoder.decode(name, "UTF-8");
				pageInfo = orderService.getOrders(page, row, content);
			} catch (UnsupportedEncodingException e) {
 				e.printStackTrace();
			}
		}
		
		return pageInfo;
	}
	
	
	@RequestMapping("/getOrdersInfo.action")
	@ResponseBody
	public Orders getOrdersById(int oid){
		
		return orderService.getOrderById(oid);
	}
	
	
	@RequestMapping("/delOrder.action")
	@ResponseBody
	public Map<String, String> updateOrderStatus(int oid){
		Map<String, String> map = new HashMap<>();
		
		int res2 = deliveryService.delDelivery(oid);
		
		int res1 = orderService.delOrder(oid);
		
		if(res1 != 0 && res2 != 0){
			map.put("result", "OK");
		}else{
			map.put("result", "error");
		}
		
		return map;
	}
	
	
	  @RequestMapping("/batchdelOrder.action")  
	  @ResponseBody
	  public String batchDelStaff(@RequestParam(value="oIds[]")Integer[] oIds){
		  for(int i=0;i<oIds.length;i++){
			 deliveryService.delDelivery(oIds[i]);
			 orderService.delOrder(oIds[i]);
		  }
		  return "OK";
	  }
	

}
