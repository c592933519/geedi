package com.slapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.slapp.mapper.UserDOMapper;
import com.slapp.pojo.User;
import com.slapp.service.IUserService;

/**
 * 用户service实现类
 * 
 * @author sl
 *
 */
@Service("userService")
public class UserServiceimpl implements IUserService {

	@Autowired
	private UserDOMapper userDOMapper;

	public User getUser(User user) {
		return userDOMapper.getUser(user);
	}

	@Override
	public Boolean checkUsername(String username) {
		boolean b = false;
		int count = userDOMapper.countUserByUsername(username);
		if (count == 1) {
			b = true;
		}
		return b;
	}
}
