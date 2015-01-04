package com.geedi.pojo;

import com.geedi.enums.ReturnCode;

public class FailReturnInfo extends ReturnInfo {
	private String msg;
	private int code;

	public FailReturnInfo(String msg) {
		this.code = ReturnCode.FAIL.ordinal();
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public int getCode() {
		return code;
	}
}
