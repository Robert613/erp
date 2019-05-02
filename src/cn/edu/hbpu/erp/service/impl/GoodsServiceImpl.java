package cn.edu.hbpu.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.mapper.GoodsMapper;
import cn.edu.hbpu.erp.pojo.Goods;
import cn.edu.hbpu.erp.pojo.GoodsExample;
import cn.edu.hbpu.erp.service.IGoodsService;

@Service
public class GoodsServiceImpl implements IGoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public int addGoods(Goods goods) {
		 
		return goodsMapper.insertSelective(goods);
	}

	@Override
	public PageInfo<Goods> getGoodsByName(int page,int row,String gname) {
		PageHelper.startPage(page, row);
		GoodsExample example = new GoodsExample();
		example.createCriteria().andGnameLike("%"+gname+"%");
		List<Goods> list = goodsMapper.selectByExample(example);
		PageInfo<Goods> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public int updateGoodsById(Goods goods) {
		
		//System.out.println(goods);
		Goods goods2 = goodsMapper.selectByPrimaryKey(goods.getGid());
		//System.out.println(goods2);
		if(goods2.getTotal()<=0){
			goods2.setTotal(0);
		}else{
			goods2.setTotal(goods2.getTotal()-goods.getTotal());
		}	 
		return goodsMapper.updateGoodsById(goods2);
	}

}
