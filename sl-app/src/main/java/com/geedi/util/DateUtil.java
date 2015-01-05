package com.geedi.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 时间日期相关处理工具类
 * 
 * @author sl
 * 
 */
public final class DateUtil {
	/**
	 * 日期转1970到日期的毫秒数
	 * 
	 * @param date
	 *            日期
	 * @param pattern
	 *            日期格式
	 * @return long
	 * @throws ParseException
	 */
	public static long dateToTimeInMillis(String date, String pattern)
			throws ParseException {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		calendar.setTime(simpleDateFormat.parse(date));
		return calendar.getTimeInMillis();
	}

	public static String getNowByFormat(String pattern) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		return simpleDateFormat.format(new Date());
	}

	/**
	 * 获取默认格式的当前时间,默认格式为yyyyMMddHH24mmss
	 * 
	 * @return
	 */
	public static String getNowByDefaultFormat() {
		return getNowByFormat("yyyyMMddHHmmss");
	}

	/**
	 * 转换时间显示格式
	 * 
	 * @param date
	 *            时间
	 * @param nowPattern
	 *            当前时间格式
	 * @param swtchPattern
	 *            需转换的时间格式
	 * @return
	 * @throws ParseException
	 */
	public static String swtchDateFormat(String date, String nowPattern,
			String swtchPattern) throws ParseException {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(nowPattern);
		Date date2 = simpleDateFormat.parse(date);
		simpleDateFormat = new SimpleDateFormat(swtchPattern);
		return simpleDateFormat.format(date2);
	}

	/**
	 * 获取当前日期的这个星期里的星期一日期 格式为 yyyy-MM-dd 00:00:00
	 * 
	 * @return
	 */
	public static String getDateByMondayOfWeek() {
		return getDateByMondayOfWeek("yyyy-MM-dd 00:00:00");
	}

	/**
	 * 获取当前日期的这个星期里的星期五日期 格式为 yyyy-MM-dd 23:59:59
	 * 
	 * @return
	 */
	public static String getDateBySundayOfWeek() {
		return getDateBySundayOfWeek("yyyy-MM-dd 23:59:59");
	}

	public static String getDateBySundayOfWeek(String pattern) {
		Calendar calendar = Calendar.getInstance();
		if (calendar.get(Calendar.DAY_OF_WEEK) != 1) {
			calendar.add(Calendar.WEEK_OF_MONTH, 1);
		}
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		return simpleDateFormat.format(calendar.getTime());
	}

	public static String getDateByMondayOfWeek(String pattern) {
		Calendar calendar = Calendar.getInstance();
		if (calendar.get(Calendar.DAY_OF_WEEK) == 1) {
			calendar.add(Calendar.DAY_OF_WEEK, -1);
		}
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		return simpleDateFormat.format(calendar.getTime());
	}

	/**
	 * 获取当前时间月份1号，比如当前时间是4/23号，这个方法就返回4/1号
	 * 
	 * @param pattern
	 * @return
	 */
	public static String getDateBy1OfMonth(String pattern) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		return simpleDateFormat.format(calendar.getTime());
	}
	/**
	 * 获取当前年份从01.01号还是计算
	 * add by laichun.hu 
	 * @param pattern
	 * @return
	 */
	public static String getCurrentYear() {

		Calendar cal = Calendar.getInstance();
		cal.set(cal.get(Calendar.YEAR), 0, 01);
		return new SimpleDateFormat("yyyy-MM-dd 00:00:00")
				.format(cal.getTime());
	}

	/**
	 * 获取当前时间 add by laichun.hu
	 * @param pattern
	 * @return
	 */
	public static String getCurrentTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd 23:59:59");// 设置日期格式
		// new Date()为获取当前系统时间
		return df.format(new Date());
	}

	public static void main(String[] args) {
	}

}
