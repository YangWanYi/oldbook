package com.oldbook.dao;

import java.util.List;

import com.oldbook.domain.ShopDo;

public interface ShopDao {

	void insertShop(ShopDo shop);
	
	void updateShop(ShopDo shop);

	void deleteShop(ShopDo shop);

	ShopDo selectShopById(int shopId);

	List<ShopDo> listShop(ShopDo shop);
}
