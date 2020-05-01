package com.oldbook.service;

import java.util.List;

import com.oldbook.domain.ShopDo;

public interface ShopService {
	
	void insertShop(ShopDo shop);

	void updateShop(ShopDo shop) throws Exception;

	void deleteShop(ShopDo shop);

	ShopDo selectShopById(int shopId);
	
	public List<ShopDo> listShop(ShopDo shop) throws Exception;
}
