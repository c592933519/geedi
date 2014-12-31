package com.slapp.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/error")
public class ErrorController {
	@RequestMapping(value = "/notFound")
	public String notFound() {
		return "error/notFound";
	}

	@RequestMapping(value = "/error")
	public String error() {
		return "error/error";
	}
}
