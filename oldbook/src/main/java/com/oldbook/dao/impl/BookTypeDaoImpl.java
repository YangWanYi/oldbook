package com.oldbook.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.oldbook.dao.BookTypeDao;
import com.oldbook.domain.BookTypeDo;

@Repository
public class BookTypeDaoImpl extends HibernateDaoSupport implements BookTypeDao {

	@Autowired
	public void setMyFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void insertBookType(BookTypeDo bookType) {
		super.getHibernateTemplate().save(bookType);
	}

	@Override
	public void updateBookType(BookTypeDo bookType) {
		super.getHibernateTemplate().update(bookType);
	}

	@Override
	public void deleteBookType(BookTypeDo bookType) {
		super.getHibernateTemplate().delete(bookType);
	}

	@Override
	public BookTypeDo selectBookTypeById(int bookTypeId) {
		return super.getHibernateTemplate().get(BookTypeDo.class, bookTypeId);
	}

	@Override
	public List<BookTypeDo> listBookType(BookTypeDo bookType) {
		StringBuffer hql = new StringBuffer();
		hql.append(" from BookTypeDo where 1=1");
		if(StringUtils.isNotEmpty(bookType.getTypeName())) {
			hql.append(" and TYPENAME like '%"+bookType.getTypeName()+"%'  ");
		}
		if(StringUtils.isNotEmpty(bookType.getParentTypeName())) {
			hql.append(" and PARENTTYPENAME like '%"+bookType.getParentTypeName()+"%'  ");
		}
		if(bookType.getParentTypeId()!=null&&0==bookType.getParentTypeId()) {
			hql.append(" and PARENTTYPEID is null");
		}
		if(StringUtils.isNotEmpty(bookType.getpNameForSearch())) {
			hql.append(" and PARENTTYPEID ="+bookType.getpNameForSearch());
		}
		@SuppressWarnings("unchecked")
		List<BookTypeDo> list = (List<BookTypeDo>) super.getHibernateTemplate().find(hql.toString());
		return list;
	}

}
