package cn.edu.hbpu.erp.service;

import com.github.pagehelper.PageInfo;
import cn.edu.hbpu.erp.pojo.Customer;



public interface ICustomerService {
	
	
	public int addCustomer(Customer customer);
	
	public PageInfo<Customer> getCustomers(int page,int row);
	
	public PageInfo<Customer> getCustomersByName(int page,int row,String content);
	
	public Customer getCustomerInfo(int cid);
	
	public int updateCustomer(Customer customer);
	
	public int updateByStatus(int cid);
	
	public Customer findCustomerById(Integer cid);
	
	public int getCountBySource(String source);
	

}
