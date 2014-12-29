package com.slapp.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/error")
public class ErrorController {
	@RequestMapping(value = "/notFound")
	public String notFound() {
		System.out.println(".........");
		return "error/notFound";
	}
}
