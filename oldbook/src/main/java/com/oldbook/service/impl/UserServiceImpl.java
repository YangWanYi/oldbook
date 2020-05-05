package com.oldbook.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldbook.dao.UserDao;
import com.oldbook.domain.UserDo;
import com.oldbook.service.UserService;

@Transactional
@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

	@Override
	public void insertUser(UserDo user) {
		userDao.insertUser(user);		
	}

	@Override
	public void updateUser(UserDo user) throws Exception{
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(UserDo user) {
		userDao.deleteUser(user);		
	}

	@Override
	public UserDo selectUserById(int userId) {
		return userDao.selectUserById(userId);
	}

	@Override
	public UserDo loginUser(String account, String pwd, String roleTypeX) {
		UserDo user = new UserDo();
		user.setAccount(account);
		user.setPassword(pwd);
		user.setRoleTypeX(roleTypeX);
		return userDao.loginUser(user);
	}

	@Override
	public List<UserDo> listUser(UserDo user) throws Exception{
		return userDao.listUser(user);
	}

}
