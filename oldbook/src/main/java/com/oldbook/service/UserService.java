package com.oldbook.service;

import java.util.List;

import com.oldbook.domain.UserDo;

public interface UserService {
	
	void insertUser(UserDo user);

	void updateUser(UserDo user) throws Exception;

	void deleteUser(UserDo user);

	UserDo selectUserById(int userId);
	
	UserDo loginUser(String account, String pwd, Integer roleType);

	public List<UserDo> listUser(UserDo user) throws Exception;
}
