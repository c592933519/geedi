package com.geedi.service;

import com.geedi.mapper.dao.User;
import com.geedi.pojo.ReturnInfo;

public interface IUserService {

	User getUser(User user);

	ReturnInfo checkUsername(String username);

	ReturnInfo checkEmail(String email);

	void saveUser(User user);
}
