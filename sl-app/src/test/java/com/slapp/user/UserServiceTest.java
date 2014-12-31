package com.slapp.user;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.slapp.base.JunitBaseTest;
import com.slapp.service.IUserService;

public class UserServiceTest extends JunitBaseTest{
	@Autowired
	private IUserService userService;
	
	@Test
	public void testCheckUsername(){
		System.out.println(userService.checkUsername("hhh"));
	}
}
