package com.oldbook.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.oldbook.dao.ShopDao;
import com.oldbook.domain.ShopDo;

@Repository
public class ShopDaoImpl extends HibernateDaoSupport  implements ShopDao {
	
	@Autowired
	public void setMyFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void insertShop(ShopDo shop) {
		super.getHibernateTemplate().save(shop);
	}

	@Override
	public void updateShop(ShopDo shop) {
		super.getHibernateTemplate().update(shop);
	}

	@Override
	public void deleteShop(ShopDo shop) {
		super.getHibernateTemplate().delete(shop);
	}

	@Override
	public ShopDo selectShopById(int shopId) {
		return super.getHibernateTemplate().get(ShopDo.class, shopId);
	}

	@Override
	public List<ShopDo> listShop(ShopDo shop) {
		StringBuffer hql=new StringBuffer();
		hql.append(" from ShopDo where 1=1");
//		if(StringUtils.isNoneEmpty(shop.getShopName())) {
//			hql.append(" and ShopNAME like '%"+shop.getShopName()+"%'  ");
//		}
		@SuppressWarnings("unchecked")
		List<ShopDo> list= (List<ShopDo>) super.getHibernateTemplate().find(hql.toString());
		return list;
	}

}
