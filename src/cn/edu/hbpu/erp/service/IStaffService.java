package cn.edu.hbpu.erp.service;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Staff;

public interface IStaffService {
	
	public int addStaff(Staff staff);
	
	public PageInfo<Staff> getStaffs(int page,int row);
	
	public PageInfo<Staff> getStaffsByName(int page,int row,String content);
	
	public Staff getStaffInfo(int sid);
	
	public int updateStaff(Staff staff);
	
	public int deleteStaffByIsDel(int sid);
	

}
