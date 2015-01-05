package com.geedi.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取mail.properties文件数据
 * 
 * @author sl
 * 
 */
public enum MailConstantUtil {
	INSTANCE;
	private final Properties PROPERTIES = new Properties();
	private MailConstantUtil() {
		InputStream in = null;
		try {
			in = this.getClass().getResourceAsStream("/mail.properties");
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

	public String getGeediMail(){
		return PROPERTIES.getProperty("geediMail");
	}
	
	public String getFpwdMailSubject(){
		return PROPERTIES.getProperty("fPwdMailSubject");
	}
	public String getFpwdMailContent(){
		return PROPERTIES.getProperty("fPwdMailContent");
	}
}
