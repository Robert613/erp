package cn.edu.hbpu.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.mapper.StaffMapper;
import cn.edu.hbpu.erp.pojo.Staff;
import cn.edu.hbpu.erp.pojo.StaffExample;
import cn.edu.hbpu.erp.service.IStaffService;

@Service
public class StaffServiceImpl implements IStaffService {
	
	@Autowired
	private StaffMapper staffMapper;

	@Override
	public int addStaff(Staff staff) {
 		return staffMapper.insertSelective(staff);
	}

	@Override
	public PageInfo<Staff> getStaffs(int page, int row) {
		PageHelper.startPage(page, row);
		StaffExample example = new StaffExample();
		
		example.createCriteria().andIsdelEqualTo(0);
		
		example.setOrderByClause(" jointime desc");
		
		List<Staff> list = staffMapper.selectByExample(example);
		
		PageInfo<Staff> pageInfo = new PageInfo<>(list);
		
		return pageInfo;
	}

	@Override
	public PageInfo<Staff> getStaffsByName(int page, int row, String content) {
		
		PageHelper.startPage(page, row);
		
		StaffExample example = new StaffExample();
			
		example.createCriteria().andNameLike("%"+content+"%");
		
		example.createCriteria().andIsdelEqualTo(0);	
		
		example.setOrderByClause(" jointime desc");
		
		List<Staff> list = staffMapper.selectByExample(example);
		
		PageInfo<Staff> pageInfo = new PageInfo<>(list);
		
		return pageInfo;
	}

	
	@Override
	public Staff getStaffInfo(int sid) {
		 
		return staffMapper.selectByPrimaryKey(sid);
	}
	
	@Override
	public int updateStaff(Staff staff) {
		
		return staffMapper.updateByPrimaryKeySelective(staff);
	}

	@Override
	public int deleteStaffByIsDel(int sid) {
		 
		return staffMapper.deleteStaffByIsDel(sid);
	}

	

}
