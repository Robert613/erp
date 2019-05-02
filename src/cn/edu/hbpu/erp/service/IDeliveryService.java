package cn.edu.hbpu.erp.service;

import java.util.Map;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Delivery;

public interface IDeliveryService {

	
	  public int addDeliery(Delivery delivery);
	  
	  public PageInfo<Delivery> getDeliveryList(int page,int row);
	  
	  public int delDelivery(int oid);
	  
	  public PageInfo<Delivery> getDeliveryList(int page,int row,Map<String, String> map);
	  
	  public Delivery findByDid(int did);
}
