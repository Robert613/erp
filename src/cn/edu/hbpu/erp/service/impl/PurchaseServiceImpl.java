package cn.edu.hbpu.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.edu.hbpu.erp.mapper.PurchaseMapper;
import cn.edu.hbpu.erp.pojo.Purchase;
import cn.edu.hbpu.erp.pojo.PurchaseExample;
import cn.edu.hbpu.erp.service.IPurchaseService;

@Service
public class PurchaseServiceImpl implements IPurchaseService {
	
	@Autowired
	private PurchaseMapper purchaseMapper;

	@Override
	public int addPurchase(Purchase purchase) {
		 
		return purchaseMapper.insertSelective(purchase);
	}

	@Override
	public PageInfo<Purchase> getPurchases(int page, int row) {
		PageHelper.startPage(page, row);
		PurchaseExample example = new PurchaseExample();
		example.setOrderByClause("time desc");
		List<Purchase> list = purchaseMapper.selectByExample(example);
		PageInfo<Purchase> pageInfo = new PageInfo<>(list);
 		return pageInfo;
	}

	@Override
	public PageInfo<Purchase> getPurchases(int page, int row, String gname) {
		PageHelper.startPage(page, row);
		PurchaseExample example = new PurchaseExample();
		example.createCriteria().andGnameLike("%"+gname+"%");
		example.setOrderByClause("time desc");
		List<Purchase> list = purchaseMapper.selectByExample(example);
		PageInfo<Purchase> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public Purchase getPurchaseInfo(Integer pid) {
		 
		return purchaseMapper.selectByPrimaryKey(pid);
	}

}
