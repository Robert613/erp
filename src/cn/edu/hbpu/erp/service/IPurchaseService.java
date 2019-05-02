package cn.edu.hbpu.erp.service;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.erp.pojo.Purchase;

public interface IPurchaseService {
	
	
	public int addPurchase(Purchase purchase);
	
    public PageInfo<Purchase> getPurchases(int page,int row);
	
	public PageInfo<Purchase> getPurchases(int page,int row,String gname);
	
	public Purchase getPurchaseInfo(Integer pid);

}
