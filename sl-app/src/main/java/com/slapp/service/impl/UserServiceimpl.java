package com.slapp.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.slapp.enums.ReturnCode;
import com.slapp.mapper.UserDOMapper;
import com.slapp.pojo.ReturnInfo;
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
		ReturnInfo returnInfo = new ReturnInfo();
		int count = userDOMapper.countUser(paramMap);
		if (count == 1) {
			returnInfo.setCode(ReturnCode.FAIL);
			returnInfo.setMsg("已存在");
		} else {
			returnInfo.setCode(ReturnCode.SUCCESS);
		}
		return returnInfo;
	}

	@Override
	public void saveUser(User user) {
		userDOMapper.saveUser(user);
	}
}
