package cn.edu.hbpu.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.mapper.LoginsMapper;
import cn.edu.hbpu.erp.pojo.Logins;
import cn.edu.hbpu.erp.pojo.LoginsExample;
import cn.edu.hbpu.erp.service.ILoginsService;

@Service
public class LoginsServiceImpl implements ILoginsService {
	
	@Autowired
	private LoginsMapper loginsMapper;

	@Override
	public int addLogin(Logins logins) {
		 
		return loginsMapper.insertSelective(logins);
	}

	@Override
	public PageInfo<Logins> getCustomers(int page, int row) {
		PageHelper.startPage(page, row);
		LoginsExample example = new LoginsExample();
		example.setOrderByClause("login_time desc");
		List<Logins> list = loginsMapper.selectByExample(example);
		PageInfo<Logins> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public PageInfo<Logins> getCustomersByName(int page, int row, String content) {
		PageHelper.startPage(page, row);
		LoginsExample example = new LoginsExample();
		example.createCriteria().andLoginNameLike("%"+content+"%");
		example.setOrderByClause("login_time desc");
		List<Logins> list = loginsMapper.selectByExample(example);
		PageInfo<Logins> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

}
