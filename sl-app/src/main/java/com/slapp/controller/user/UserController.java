package com.slapp.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.slapp.pojo.ReturnInfo;
import com.slapp.pojo.User;
import com.slapp.service.IUserService;
import com.slapp.util.MD5Tool;

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

	@RequestMapping(value = "/checkUsername")
	@ResponseBody
	public ReturnInfo checkUsername(String username) {
		return userService.checkUsername(username);
	}

	@RequestMapping(value = "/checkEmail")
	@ResponseBody
	public ReturnInfo checkEmail(String email) {
		return userService.checkEmail(email);
	}

	@RequestMapping(value = "/login")
	public String login(String username, String password,
			HttpServletRequest request) {
		User user = new User();
		user.setPassword(MD5Tool.MD5Encrypt(password));
		user.setUsername(username);
		if ((user = userService.getUser(user)) != null) {
			request.getSession().setAttribute("user", user);
			return "redirect:index";
		} else {
			request.setAttribute("msg", "用户名或密码不正确");
		}
		return "forward:toLogin";
	}

	@RequestMapping(value = "/signUp")
	public String signUp() {
		return "user/signUp";
	}

	@RequestMapping(value = "/submitSignUp")
	public String submitSignUp(String username, String password, String email,
			HttpSession session) {
		User user = new User();
		user.setPassword(MD5Tool.MD5Encrypt(password));
		user.setUsername(username);
		user.setEmail(email);
		userService.saveUser(user);
		session.setAttribute("user", user);
		return "redirect:index";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:toLogin";
	}
}
