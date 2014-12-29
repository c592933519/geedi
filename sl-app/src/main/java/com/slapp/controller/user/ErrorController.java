package com.slapp.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class ErrorController {

	@ExceptionHandler()
	public String exceptionHandle(Exception e){
		System.out.println("......"+e.getMessage());
		return null;
	}
}
