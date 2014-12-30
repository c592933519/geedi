package com.slapp.controller.user;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.slapp.pojo.User;

@Controller
public class UserController {
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "user/login";
	}

	@RequestMapping(value = "/index")
	public String index() {
		return "main/index";
	}

	@RequestMapping(value = "/login")
	public String login(String username, String password, HttpSession session) {
		User user = new User();
		user.setPassword(password);
		user.setUsername(username);
		session.setAttribute("user", user);
		return "redirect:index";
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
