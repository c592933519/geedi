package com.slapp.controller.user;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.slapp.pojo.User;
import com.slapp.service.IUserService;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "user/login";
	}

	@RequestMapping(value = "/index")
	public String index() {
		return "main/index";
	}
	
	@RequestMapping(value="/checkUsername")
	public Boolean checkUsername(String username){
		return userService.checkUsername(username);
	}

	@RequestMapping(value = "/login")
	public String login(String username, String password, HttpSession session) {
		User user = new User();
		user.setPassword(password);
		user.setUsername(username);
		if ((user=userService.getUser(user))!=null) {
			session.setAttribute("user", user);
		}
		return "redirect:index";
	}

	@RequestMapping(value = "/signUp")
	public String signUp() {
		return "user/signUp";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		@SuppressWarnings("unchecked")
		Enumeration<String> enums = session.getAttributeNames();
		while (enums.hasMoreElements()) {
			session.removeAttribute(enums.nextElement());
			;
		}
		return "redirect:toLogin";
	}
}
