package com.slapp.mapper;

import java.util.Map;

import com.slapp.pojo.User;

public interface UserDOMapper {

	User getUser(User user);

	int countUser(Map<String, String> paramMap);

	void saveUser(User user);
	
}

