package com.geedi.controller.user;

import java.sql.Timestamp;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geedi.mapper.dao.User;
import com.geedi.pojo.ReturnInfo;
import com.geedi.service.IUserService;
import com.geedi.util.MD5Tool;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping(value = "login")
	public String toLogin() {
		return "user/login";
	}

	@RequestMapping(value = "fpwd")
	public String fpwd() {
		return "user/fpwd";
	}

	@RequestMapping(value = "/index")
	public String index() {
		return "main/index";
	}

	@RequestMapping(value = "/checkUsername")
	@ResponseBody
	public ReturnInfo checkUsername(
			@RequestParam(required = true) String username) {
		return userService.checkUsername(username);
	}

	@RequestMapping(value = "/checkEmail")
	@ResponseBody
	public ReturnInfo checkEmail(@RequestParam(required = true) String email) {
		return userService.checkEmail(email);
	}

	@RequestMapping(value = "/submitLogin")
	public String login(@RequestParam(required = true) String username,
			@RequestParam(required = true) String password,
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
		return "forward:login";
	}

	@RequestMapping(value = "/signUp")
	public String signUp() {
		return "user/signUp";
	}

	@RequestMapping(value = "/submitSignUp")
	public String submitSignUp(@RequestParam(required = true) String username,
			@RequestParam(required = true) String password,
			@RequestParam(required = true) String email, HttpSession session) {
		User user = new User();
		user.setPassword(MD5Tool.MD5Encrypt(password));
		user.setUsername(username);
		user.setEmail(email);
		userService.saveUser(user);
		session.setAttribute("user", user);
		return "redirect:restPwd";
	}

	@RequestMapping(value = "/restPwd")
	public String restPwd(@RequestParam(required = true) String username,
			@RequestParam(required = true) String token,
			HttpServletRequest request) {
		request.setAttribute("username", username);
		request.setAttribute("token", token);
		return "user/restPwd";
	}

	@RequestMapping(value = "/submitFpwd")
	public String submitFpwd(@RequestParam(required = true) String username,
			HttpServletRequest request) throws MessagingException {
		User user = new User();
		user.setUsername(username);
		if (userService.submitFpwd(user)) {
			request.setAttribute("succmsg", "重置邮件已发送");
		} else {
			request.setAttribute("errmsg", "用户名不存在");
		}
		return "user/fpwd";
	}

	@RequestMapping(value = "/submitRestPwd")
	public String submitRestPwd(@RequestParam(required = true) String password,
			@RequestParam(required = true) String username,
			@RequestParam(required = true) String token,
			HttpServletRequest request) {
		String string = "user/fpwd";
		User user = new User();
		user.setUsername(username);
		// update user from sql
		user = userService.getUser(user);
		if (user == null) {
			request.setAttribute("errmsg", "用户名不存在");
		} else {
			Timestamp updateTime = user.getUpdateTime();
			// 重置链接有效时间为1小时
			if (((new Date().getTime() - updateTime.getTime()) / 1000 / 60 / 60.0) > 1) {
				request.setAttribute("errmsg", "链接已超时");
			} else {
				if (!token.equals(user.getToken())) {
					request.setAttribute("errmsg", "验证参数不正确");
				} else {
					user.setPassword(MD5Tool.MD5Encrypt(password));
					userService.updatePwdAndRestTokenInUser(user);
					request.getSession().setAttribute("user", user);
					string = "redirect:index";
				}
			}
		}
		return string;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}
}
