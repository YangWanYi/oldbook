package com.oldbook.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.oldbook.dao.TradeOrderDao;
import com.oldbook.domain.TradeOrderDo;

@Repository
public class TradeOrderDaoImpl extends HibernateDaoSupport  implements TradeOrderDao {
	
	@Autowired
	public void setMyFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void insertTradeOrder(TradeOrderDo TradeOrder) {
		super.getHibernateTemplate().save(TradeOrder);
	}

	@Override
	public void updateTradeOrder(TradeOrderDo TradeOrder) {
		super.getHibernateTemplate().update(TradeOrder);
	}

	@Override
	public void deleteTradeOrder(TradeOrderDo TradeOrder) {
		super.getHibernateTemplate().delete(TradeOrder);
	}

	@Override
	public TradeOrderDo selectTradeOrderById(int TradeOrderId) {
		return super.getHibernateTemplate().get(TradeOrderDo.class, TradeOrderId);
	}

	@Override
	public List<TradeOrderDo> listTradeOrder(TradeOrderDo tradeOrder) {
		StringBuffer hql=new StringBuffer();
		hql.append(" from TradeOrderDo where 1=1");
		if(StringUtils.isNoneEmpty(tradeOrder.getBookName())) {
			hql.append(" and bookName like '%"+tradeOrder.getBookName()+"%'  ");
		}
		if(tradeOrder.getShopId()!=null) {
			hql.append(" and shopId = "+tradeOrder.getShopId());
		}
		@SuppressWarnings("unchecked")
		List<TradeOrderDo> list= (List<TradeOrderDo>) super.getHibernateTemplate().find(hql.toString());
		return list;
	}

}
