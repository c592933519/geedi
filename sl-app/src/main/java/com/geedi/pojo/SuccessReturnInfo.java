package com.geedi.pojo;

import com.geedi.enums.ReturnCode;

public class SuccessReturnInfo extends ReturnInfo {
	private String msg;
	private int code;

	public SuccessReturnInfo() {
		this.code = ReturnCode.SUCCESS.ordinal();
	}

	public SuccessReturnInfo(String msg) {
		this.code = ReturnCode.SUCCESS.ordinal();
		this.msg = msg;
	}

	@Override
	public String getMsg() {
		return this.msg;
	}

	@Override
	public int getCode() {
		return this.code;
	}

}
