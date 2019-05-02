package cn.edu.hbpu.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.mapper.CustomerMapper;
import cn.edu.hbpu.erp.pojo.Customer;
import cn.edu.hbpu.erp.pojo.CustomerExample;
import cn.edu.hbpu.erp.service.ICustomerService;

@Service
public class CustomerServiceImpl implements ICustomerService {
	
	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public int addCustomer(Customer customer) {
 		return customerMapper.insertSelective(customer);
	}

	@Override
	public PageInfo<Customer> getCustomers(int page, int row) {
		PageHelper.startPage(page, row);
		CustomerExample example = new CustomerExample();
		example.createCriteria().andIsdelEqualTo(0);
	    List<Customer> list = customerMapper.selectByExample(example);
	    PageInfo<Customer> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public PageInfo<Customer> getCustomersByName(int page, int row, String content) {
		PageHelper.startPage(page, row);
		CustomerExample example = new CustomerExample();
		example.createCriteria().andCnameLike("%"+content+"%");
		example.createCriteria().andIsdelEqualTo(0);
		List<Customer> list = customerMapper.selectByExample(example);
		PageInfo<Customer> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	
	@Override
	public Customer getCustomerInfo(int cid) {
	
		return customerMapper.selectByPrimaryKey(cid);
	}

	@Override
	public int updateCustomer(Customer customer) {
		 
		return customerMapper.updateByPrimaryKeySelective(customer);
	}

	@Override
	public int updateByStatus(int cid) {
		
		return customerMapper.updateByStatus(cid);
	}

	@Override
	public Customer findCustomerById(Integer cid) {
		 
		return customerMapper.selectByPrimaryKey(cid);
	}

	@Override
	public int getCountBySource(String source) {
		 
		return customerMapper.selectCustomerBySource(source);
	}

	 

}
