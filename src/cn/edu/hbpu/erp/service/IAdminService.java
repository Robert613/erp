package cn.edu.hbpu.erp.service;

import cn.edu.hbpu.erp.pojo.Admin;

public interface IAdminService {
	
	public  Admin login(Admin admin);
	
	public  String getDataBaseVersion();
	
	public Admin findById(int id);
	
	public int updateAdminInfo(Admin admin);
	

}
