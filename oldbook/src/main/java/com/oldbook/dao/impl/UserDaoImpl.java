package com.oldbook.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.oldbook.dao.UserDao;
import com.oldbook.domain.UserDo;

@Repository
public class UserDaoImpl extends HibernateDaoSupport  implements UserDao {
	
	@Autowired
	public void setMyFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
	public void insertUser(UserDo user) {
		super.getHibernateTemplate().save(user);
	}

	@Override
	public void updateUser(UserDo user) {
		super.getHibernateTemplate().update(user);
	}

	@Override
	public void deleteUser(UserDo user) {
		super.getHibernateTemplate().delete(user);
	}

	@Override
	public UserDo selectUserById(int userId) {
		return super.getHibernateTemplate().get(UserDo.class, userId);
	}

	@Override
	public UserDo loginUser(UserDo user) {
		UserDo userDo = null;
		StringBuffer hql=new StringBuffer();
		hql.append(" from UserDo where 1=1");
		if(StringUtils.isNoneEmpty(user.getAccount())) {
			hql.append(" and ACCOUNT ='"+user.getAccount()+"'");
		}
		if(StringUtils.isNoneEmpty(user.getPassword())) {
			hql.append(" and PASSWORD ='"+user.getPassword()+"'");
		}
		if(StringUtils.isNoneEmpty(user.getRoleTypeX())) {
			hql.append(" and roleTypeX like '%"+user.getRoleTypeX()+"%'  ");
		}
		@SuppressWarnings("unchecked")
		List<UserDo> list= (List<UserDo>) super.getHibernateTemplate().find(hql.toString());
		if (list.size() > 0) { // 同一个账号只可能存在一个 所以取第一条数据即可
			userDo = list.get(0);
		}
		return userDo;
	}
	
	@Override
	public List<UserDo> listUser(UserDo user) {
		StringBuffer hql=new StringBuffer();
		hql.append(" from UserDo where 1=1");
		if(StringUtils.isNoneEmpty(user.getUserName())) {
			hql.append(" and USERNAME like '%"+user.getUserName()+"%'  ");
		}
		@SuppressWarnings("unchecked")
		List<UserDo> list= (List<UserDo>) super.getHibernateTemplate().find(hql.toString());
		return list;
	}

}
