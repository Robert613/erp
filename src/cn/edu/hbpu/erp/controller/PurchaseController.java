package cn.edu.hbpu.erp.controller;

 
 
import java.io.UnsupportedEncodingException;

import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageInfo;
import cn.edu.hbpu.erp.pojo.Goods;
import cn.edu.hbpu.erp.pojo.Purchase;
import cn.edu.hbpu.erp.service.IGoodsService;
import cn.edu.hbpu.erp.service.IPurchaseService;



/**
 * 
 * @author Mr.Jiang
 *
 */

@Controller
public class PurchaseController {
	
	@Autowired
	private  IPurchaseService purchaseService;
	@Autowired
	private IGoodsService goodsService;
	
	
	
	/**
	 *  
	 * @param purchase
	 * @return
	 */
	@RequestMapping("/addPurchase.action")
	@ResponseBody
	public Map<String, String> addPurchase(Purchase purchase){
		
		purchase.setTime(new Date());
		
		Map<String, String> map = new HashMap<>();
		
		int res = purchaseService.addPurchase(purchase);
		
		Goods goods = null;
		if(res != 0){			
			goods = new Goods();
			
			goods.setGname(purchase.getGname());
			
			goods.setGprice(purchase.getGprice());
			
			goods.setSupplier(purchase.getSupplier());
			
			goods.setTotal(purchase.getCount());
			
			if(goodsService.addGoods(goods) != 0){
				map.put("result", "OK");
			}
			
		}else{
			map.put("result", "error");
		}
		
		
		return map ;
	}
	
	@RequestMapping("/getPurchaseList.action")
	@ResponseBody
	public PageInfo<Purchase> getPurchaseList(int page,int row,String gname){
		
		PageInfo<Purchase> pageInfo = null;
		gname = gname.trim();
		if(gname == null || gname.equals(" ") || gname.equals("")){
			pageInfo = purchaseService.getPurchases(page, row);
		}else{
			
			try {
				gname = URLDecoder.decode(gname, "UTF-8");
				pageInfo = purchaseService.getPurchases(page, row, gname);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
			
		return pageInfo;
	}
	
	
	
    @RequestMapping("/getPurchaseInfo.action")	
    @ResponseBody
	public Purchase getPurchaseInfo(Integer pid){
		
		return purchaseService.getPurchaseInfo(pid);
	}
}
