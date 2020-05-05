package com.oldbook.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.oldbook.dao.BookCartDao;
import com.oldbook.domain.BookCartDo;

@Repository
public class BookCartDaoImpl extends HibernateDaoSupport implements BookCartDao {

	@Autowired
	public void setMyFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void insertBookCart(BookCartDo bookCart) {
		super.getHibernateTemplate().save(bookCart);
	}

	@Override
	public void updateBookCart(BookCartDo bookCart) {
		super.getHibernateTemplate().update(bookCart);
	}

	@Override
	public void deleteBookCart(BookCartDo bookCart) {
		super.getHibernateTemplate().delete(bookCart);
	}

	@Override
	public BookCartDo selectBookCartById(int bookCartId) {
		return super.getHibernateTemplate().get(BookCartDo.class, bookCartId);
	}

	@Override
	public List<BookCartDo> listBookCart(BookCartDo bookCart) {
		StringBuffer hql = new StringBuffer();
		hql.append(" from BookCartDo where 1=1");
		if(StringUtils.isNoneEmpty(bookCart.getBookName())) {
			hql.append(" and bookName like '%"+bookCart.getBookName()+"%'  ");
		}
		if(bookCart.getUserId()!=null) {
			hql.append(" and userId ="+bookCart.getUserId());
		}
		@SuppressWarnings("unchecked")
		List<BookCartDo> list = (List<BookCartDo>) super.getHibernateTemplate().find(hql.toString());
		return list;
	}

}
