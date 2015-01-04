package com.geedi.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geedi.mapper.UserDOMapper;
import com.geedi.mapper.dao.User;
import com.geedi.pojo.FailReturnInfo;
import com.geedi.pojo.ReturnInfo;
import com.geedi.pojo.SuccessReturnInfo;
import com.geedi.service.IUserService;

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
	public ReturnInfo checkUsername(String username) {
		Map<String, String> paramMap = new HashMap<String, String>(1);
		paramMap.put("username", username);
		return checkUsernameOrEmail(paramMap);
	}

	@Override
	public ReturnInfo checkEmail(String email) {
		Map<String, String> paramMap = new HashMap<String, String>(1);
		paramMap.put("email", email);
		return checkUsernameOrEmail(paramMap);
	}

	private ReturnInfo checkUsernameOrEmail(Map<String, String> paramMap) {
		ReturnInfo returnInfo;
		int count = userDOMapper.countUser(paramMap);
		if (count == 1) {
			returnInfo = new FailReturnInfo("已存在");
		} else {
			returnInfo = new SuccessReturnInfo();
		}
		return returnInfo;
	}

	@Override
	public void saveUser(User user) {
		userDOMapper.saveUser(user);
	}

	@Override
	public void submitFpwd(User user) {
		// update user to getEmail
		user = getUser(user);
		if (user != null) {
			
		}
	}
}
