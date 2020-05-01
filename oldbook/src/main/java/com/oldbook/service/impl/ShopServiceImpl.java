package com.oldbook.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldbook.dao.ShopDao;
import com.oldbook.domain.ShopDo;
import com.oldbook.service.ShopService;

@Transactional
@Service("ShopService")
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDao ShopDao;

	@Override
	public void insertShop(ShopDo shop) {
		ShopDao.insertShop(shop);
	}

	@Override
	public void updateShop(ShopDo shop) throws Exception {
		ShopDao.updateShop(shop);
	}

	@Override
	public void deleteShop(ShopDo shop) {
		ShopDao.deleteShop(shop);
	}

	@Override
	public ShopDo selectShopById(int shopId) {
		return ShopDao.selectShopById(shopId);
	}

	@Override
	public List<ShopDo> listShop(ShopDo shop) throws Exception {
		return ShopDao.listShop(shop);
	}

}
