package cn.edu.hbpu.erp.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cn.edu.hbpu.erp.mapper.AdminMapper;
import cn.edu.hbpu.erp.pojo.Admin;
import cn.edu.hbpu.erp.pojo.AdminExample;
import cn.edu.hbpu.erp.pojo.AdminExample.Criteria;
import cn.edu.hbpu.erp.service.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Override
	public Admin login(Admin admin) {
		 
		AdminExample example = new AdminExample();
		
		Criteria criteria = example.createCriteria();
		
		criteria.andPhoneEqualTo(admin.getPhone());
		
		criteria.andPasswordEqualTo(admin.getPassword());
		
	   List<Admin> list = adminMapper.selectByExample(example);
	   
	   if(list.size()>0){
		   admin = list.get(0);
	   }else{
		   admin = null;
	   }
		
		return admin;
	}

	@Override
	public String getDataBaseVersion() {
	
		return adminMapper.getDataBaseVersion();
	}

	@Override
	public Admin findById(int id) {
		 
		return adminMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateAdminInfo(Admin admin) {
		 
		return adminMapper.updateByPrimaryKeySelective(admin);
	}

}
