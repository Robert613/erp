package cn.edu.hbpu.erp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.mapper.DeliveryMapper;
import cn.edu.hbpu.erp.pojo.Delivery;
import cn.edu.hbpu.erp.service.IDeliveryService;

@Service
public class DeliveryServiceImpl implements IDeliveryService {
	
    @Autowired
	private DeliveryMapper delieryMapper;

	@Override
	public int addDeliery(Delivery delivery) {
		 
		return delieryMapper.insertSelective(delivery);
	}

	@Override
	public PageInfo<Delivery> getDeliveryList(int page, int row) {
		PageHelper.startPage(page, row);
		List<Delivery> list = delieryMapper.getDeliveryList();
		PageInfo<Delivery> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public int delDelivery(int oid) {
		 
		return delieryMapper.updateDeliveryByIsDel(oid);
	}

	@Override
	public PageInfo<Delivery> getDeliveryList(int page, int row, Map<String, String> map) {
		PageHelper.startPage(page, row);
		List<Delivery> list = delieryMapper.selectByMultiQuery(map);
		PageInfo<Delivery> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public Delivery findByDid(int did) {
		 
		return delieryMapper.selectByDid(did);
	}

}
