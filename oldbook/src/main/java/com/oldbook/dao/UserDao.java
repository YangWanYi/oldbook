package com.oldbook.dao;

import java.util.List;

import com.oldbook.domain.UserDo;

public interface UserDao {

	void insertUser(UserDo user);
	
	void updateUser(UserDo user);

	void deleteUser(UserDo user);

	UserDo selectUserById(int userId);

	UserDo loginUser(UserDo user);

	List<UserDo> listUser(UserDo user);
}
