package cn.edu.hbpu.erp.service;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Orders;

public interface IOrderService {
	
	
	public int addOrder(Orders orders);
	
	
	public PageInfo<Orders> getOrders(int page,int row);
	
	
	public PageInfo<Orders> getOrders(int page,int row,String name);
	
	
	public Orders getOrderById(int oid);
	
	public int delOrder(int oid);

}
