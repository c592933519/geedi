package com.slapp.pojo;

import com.slapp.enums.ReturnCode;

public class ReturnInfo {
	private int code;
	private String msg;
	public int getCode() {
		return code;
	}
	public void setCode(ReturnCode returnCode) {
		this.code = returnCode.ordinal();
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "ReturnInfo [code=" + code + ", msg=" + msg + "]";
	}
}
