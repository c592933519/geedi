package com.slapp.mapper;

import com.slapp.pojo.User;

public interface UserDOMapper {

	User getUser(User user);

	int countUserByUsername(String username);
	
}

