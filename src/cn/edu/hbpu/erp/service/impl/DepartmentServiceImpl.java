package cn.edu.hbpu.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.edu.hbpu.erp.mapper.DepartmentMapper;
import cn.edu.hbpu.erp.pojo.Department;
import cn.edu.hbpu.erp.pojo.DepartmentExample;
import cn.edu.hbpu.erp.service.IDepartmentService;

@Service
public class DepartmentServiceImpl implements IDepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;

	@Override
	public int addDepartment(Department department) {
		
		return  departmentMapper.insertSelective(department);
	}

	@Override
	public PageInfo<Department> getDepartments(int page,int row) {
		PageHelper.startPage(page, row);
		DepartmentExample example = new DepartmentExample();
		example.createCriteria().andIsdelEqualTo(0);
	    example.setOrderByClause("depId asc");
		List<Department> list = departmentMapper.selectByExample(example);
		PageInfo<Department> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public Department getDepartmentInfo(int depid) {
		
		return departmentMapper.selectByPrimaryKey(depid);
	}

	@Override
	public int updateDepartment(Department department) {
		
		return departmentMapper.updateByPrimaryKeySelective(department);
	}

	@Override
	public int deleteDepartment(int depid) {
		return departmentMapper.updateByIsDel(depid);
		
	}

	@Override
	public PageInfo<Department> getDepartmentsByName(int page, int row, String depname) {
		PageHelper.startPage(page,row);
		DepartmentExample example = new DepartmentExample();
		example.createCriteria().andDepnameLike("%"+depname+"%");
		List<Department> list = departmentMapper.selectByExample(example);
		PageInfo<Department> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public int updateDepartmentStatus(int flag, int depid) {
		int res = 0;
		if(flag==1){
			res = departmentMapper.updateByIsUse1(depid);
		}else if(flag == 2){
			res = departmentMapper.updateByIsUse2(depid);
		}
		return res;
	}

	@Override
	public List<Department> getDepartments() {
		
		return departmentMapper.getDepartmentsList();
	}

}
