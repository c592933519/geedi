package com.slapp.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "user/login";
	}
}
