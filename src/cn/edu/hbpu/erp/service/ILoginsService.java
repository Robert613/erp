package cn.edu.hbpu.erp.service;



import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Logins;

public interface ILoginsService {
	
	
	public int addLogin(Logins logins);
	
    public PageInfo<Logins> getCustomers(int page,int row);
	
	public PageInfo<Logins> getCustomersByName(int page,int row,String content);

}
