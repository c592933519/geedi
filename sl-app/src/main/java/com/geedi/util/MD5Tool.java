package com.geedi.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class MD5Tool {

	public static void main(String[] args) throws IOException {

		/*
		 * File f1 = new File("d://11.jpg"); File f2 = new File("d://1.jpg");
		 * 
		 * FileInputStream fis = new FileInputStream(f1); ByteArrayOutputStream
		 * out = new ByteArrayOutputStream(); byte[] b = new byte[1024]; int i =
		 * -1; while ((i = fis.read(b)) != -1) { out.write(b, 0, i); }
		 * fis.close();
		 * 
		 * FileInputStream fis2 = new FileInputStream(f2); ByteArrayOutputStream
		 * out2 = new ByteArrayOutputStream(); byte[] b2 = new byte[1024]; int
		 * i2 = -1; while ((i2 = fis2.read(b2)) != -1) { out2.write(b2, 0, i2);
		 * } fis2.close();
		 * 
		 * String s1 = MD5Encrypt(out.toString()); String s2 =
		 * MD5Encrypt(out2.toString()); System.out.println(s1);
		 * System.out.println(s2);
		 */
		System.out.println(MD5Encrypt("1"));
	}

	// 该方法将你输入的字符串，通过md5加密，返回一个加密後的字符串
	public static String MD5Encrypt(String inStr) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		try {
			md.update(inStr.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (md != null) {
			byte[] digest = md.digest();
			if (digest != null) {
				StringBuffer md5 = new StringBuffer();
				for (int i = 0; i < digest.length; i++) {
					md5.append(Character.forDigit((digest[i] & 0xF0) >> 4, 16));
					md5.append(Character.forDigit((digest[i] & 0xF), 16));
				}
				return md5.toString();
			}
		}
		return null;
	}
}