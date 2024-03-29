package com.oldbook.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.oldbook.dao.BookItemDao;
import com.oldbook.domain.BookItemDo;

@Repository
public class BookItemDaoImpl extends HibernateDaoSupport implements BookItemDao {

	@Autowired
	public void setMyFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void insertBookItem(BookItemDo bookItem) {
		super.getHibernateTemplate().save(bookItem);
	}

	@Override
	public void updateBookItem(BookItemDo bookItem) {
		super.getHibernateTemplate().update(bookItem);
	}

	@Override
	public void deleteBookItem(BookItemDo bookItem) {
		super.getHibernateTemplate().delete(bookItem);
	}

	@Override
	public BookItemDo selectBookItemById(int bookItemId) {
		return super.getHibernateTemplate().get(BookItemDo.class, bookItemId);
	}

	@Override
	public List<BookItemDo> listBookItem(BookItemDo bookItem) {
		StringBuffer hql = new StringBuffer();
		hql.append(" from BookItemDo where 1=1");
		if(StringUtils.isNotEmpty(bookItem.getBookName())) {
			hql.append(" and bookName like '%"+bookItem.getBookName()+"%'  ");
		}
		if(StringUtils.isNotEmpty(bookItem.getBookTypeName())) {
			hql.append(" and bookTypeName like '%"+bookItem.getBookTypeName()+"%'  ");
		}
		if(StringUtils.isNotEmpty(bookItem.getParentBookTypeName())) {
			hql.append(" and parentBookTypeName like '%"+bookItem.getParentBookTypeName()+"%'  ");
		}
		if(StringUtils.isNotEmpty(bookItem.getShopName())) {
			hql.append(" and shopName like '%"+bookItem.getShopName()+"%'  ");
		}
		if(bookItem.getAmount()!=null) {
			hql.append(" and amount > 0");
		}
		if(bookItem.getShopId()!=null) {
			hql.append(" and shopId = "+bookItem.getShopId());
		}
		@SuppressWarnings("unchecked")
		List<BookItemDo> list = (List<BookItemDo>) super.getHibernateTemplate().find(hql.toString());
		return list;
	}

}
