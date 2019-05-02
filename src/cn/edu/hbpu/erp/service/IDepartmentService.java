package cn.edu.hbpu.erp.service;

 

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Department;

public interface IDepartmentService {
	
	public int addDepartment(Department department);
	
	public PageInfo<Department> getDepartments(int page,int row);
	
	public  Department getDepartmentInfo(int depid);
	
	public int updateDepartment(Department department);
	
	public int deleteDepartment(int depid);
	
	public PageInfo<Department> getDepartmentsByName(int page,int row,String content);

	public int updateDepartmentStatus(int flag, int depid);
	
	public List<Department> getDepartments();
}
