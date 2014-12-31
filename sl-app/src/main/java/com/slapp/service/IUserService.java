package com.slapp.service;

import com.slapp.pojo.ReturnInfo;
import com.slapp.pojo.User;

public interface IUserService {

	User getUser(User user);

	ReturnInfo checkUsername(String username);

	ReturnInfo checkEmail(String email);

	void saveUser(User user);
}
