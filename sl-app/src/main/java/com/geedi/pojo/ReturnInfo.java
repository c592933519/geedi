package com.geedi.pojo;

public abstract class ReturnInfo {
	public abstract String getMsg();
	public abstract int getCode();
	@Override
	public String toString() {
		return "ReturnInfo [getMsg()=" + getMsg() + ", getCode()=" + getCode()
				+ "]";
	}
}
