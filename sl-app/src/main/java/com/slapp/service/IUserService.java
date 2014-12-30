package com.slapp.service;

import com.slapp.pojo.User;


public interface IUserService{
	
	
	 User getUser(User user) ;

	Boolean checkUsername(String username);
}
