package com.slapp.user;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.geedi.service.IUserService;
import com.slapp.base.JunitBaseTest;

public class UserServiceTest extends JunitBaseTest{
	@Autowired
	private IUserService userService;
	
	@Test
	public void testCheckUsername(){
		System.out.println(userService.checkUsername("hhh"));
	}
}
