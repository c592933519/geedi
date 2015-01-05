package com.geedi.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取geedi.properties文件数据
 * 
 * @author sl
 * 
 */
public enum GeediConstantUtil {
	INSTANCE;
	private final Properties PROPERTIES = new Properties();
	private GeediConstantUtil() {
		InputStream in = null;
		try {
			in = this.getClass().getResourceAsStream("/geedi.properties");
			PROPERTIES.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			in = null;
		}
	}

	/**
	 * 获取constant.properties里数据
	 * @param key
	 * @return
	 * @see constant.properties
	 */
	public String getProperty(String key) {
		return PROPERTIES.getProperty(key);
	}
	
	public String getGeediHost(){
		return PROPERTIES.getProperty("geediHost");
	}
	public String getGeediFpwdAction(){
		return PROPERTIES.getProperty("fpwdAction");
	}
}
