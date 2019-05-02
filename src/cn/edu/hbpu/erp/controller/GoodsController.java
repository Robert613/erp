package cn.edu.hbpu.erp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Goods;
import cn.edu.hbpu.erp.service.IGoodsService;

@Controller
public class GoodsController {
	
	@Autowired
	private IGoodsService goodsService;

	@RequestMapping("/getGoodsList.action")
	@ResponseBody
	public PageInfo<Goods> getGoodsByName(int page,int row,String gname){
		
		String content="";
		gname = gname.trim();
	   try {
		content = URLDecoder.decode(gname, "utf-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	   
      PageInfo<Goods> pageInfo = goodsService.getGoodsByName(page, row, content);   
   
	 return pageInfo;
	}
	
	@RequestMapping("/saveGoods.action")
	@ResponseBody
	public String saveGoods(Goods goods,HttpSession session){
		//System.out.println(goods);
		session.setAttribute("goods", goods);
		return "OK";
	}
	
	@RequestMapping("/getGoods.action")
	@ResponseBody
	public Goods getGoods(HttpSession session){
		
		Goods goods = (Goods)session.getAttribute("goods");
		
		if(goods==null){
			goods = new Goods();
		}else{
			goodsService.updateGoodsById(goods);
		}
		//System.out.println(goods);
		
		session.removeAttribute("goods");
		
		return goods;
				
	}
}
