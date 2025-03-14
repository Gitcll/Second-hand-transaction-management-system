package com.wzh.secondshop.services;

import com.wzh.secondshop.mappers.UserMapper;
import com.wzh.secondshop.models.User;
import com.wzh.secondshop.utils.InfoCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;

	@Transactional
	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}

	@Transactional
	public User getUserById(int id) {
		return userMapper.getUserById(id);
	}

	@Transactional
	public User getUserByEmail(String email) {
		return userMapper.getUserByEmail(email);
	}

	@Transactional
	public User getUserByMobile(String mobile) {
		return userMapper.getUserByMobile(mobile);
	}

	@Transactional
	public Boolean registerUser(User user) {
		InfoCheck infoCheck = new InfoCheck();
		if(infoCheck.isNameLeng(user.getName())){
			return false;
		}
		return userMapper.insertUser(user) > 0;
	}

	@Transactional
	public Boolean updateUser(User user) {
		return userMapper.updateUser(user) > 0;
	}

	@Transactional
	public Boolean deleteUser(Integer userId) {
		return userMapper.deleteUser(userId) > 0;
	}

	@Transactional
	public Boolean updateUserStatus(Integer statusId, Integer userId) {
		return userMapper.updateUserStatus(statusId, userId) > 0;
	}

	@Transactional
	public Boolean updatePassword(String newPassword, String code,
			Integer userId) {
		return userMapper.updatePassword(newPassword, code, userId) > 0;
	}
}
