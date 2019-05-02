package cn.edu.hbpu.erp.service;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Goods;

public interface IGoodsService {
	
	
	public int addGoods(Goods goods);
	
	public PageInfo<Goods> getGoodsByName(int page,int row,String gname);
	
	public int  updateGoodsById(Goods goods);
	
}
