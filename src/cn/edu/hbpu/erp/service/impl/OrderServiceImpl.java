package cn.edu.hbpu.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.mapper.OrdersMapper;
import cn.edu.hbpu.erp.pojo.Orders;
import cn.edu.hbpu.erp.pojo.OrdersExample;
import cn.edu.hbpu.erp.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {
	@Autowired
	private OrdersMapper ordersMapper;
	@Override
	public int addOrder(Orders orders) {
		ordersMapper.insertSelective(orders);
		return orders.getOid();
	}
	@Override
	public PageInfo<Orders> getOrders(int page, int row) {
		PageHelper.startPage(page, row);
		OrdersExample example = new OrdersExample();
		example.createCriteria().andIsdelEqualTo(0);
		example.setOrderByClause("createtime desc");
		List<Orders> list = ordersMapper.selectByExample(example);
		PageInfo<Orders> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	@Override
	public PageInfo<Orders> getOrders(int page, int row, String name) {		
		PageHelper.startPage(page, row);
		OrdersExample example = new OrdersExample();
		example.createCriteria().andNameLike("%"+name+"%");
		example.createCriteria().andIsdelEqualTo(0);
		example.setOrderByClause("createtime desc");
		List<Orders> list = ordersMapper.selectByExample(example);
		PageInfo<Orders> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}


	@Override
	public Orders getOrderById(int oid) {
		 
		return ordersMapper.getOrderById(oid);
	}


	@Override
	public int delOrder(int oid) {
 
		return ordersMapper.updateOrderByIsDel(oid);
	}

	

}
