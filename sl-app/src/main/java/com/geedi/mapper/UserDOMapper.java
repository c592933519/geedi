package com.geedi.mapper;

import java.util.Map;

import com.geedi.mapper.dao.User;

public interface UserDOMapper {

	User getUser(User user);

	int countUser(Map<String, String> paramMap);

	void saveUser(User user);

	void updateTokenInUser(Map<String, Object> paramMap);


	void updatePwdAndRestTokenInUser(User user);
	
}

