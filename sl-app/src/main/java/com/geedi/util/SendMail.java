package com.geedi.util;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 * 发送邮件工具类
 * 
 * @author shaoling727
 *
 */
public class SendMail {
	private static final Logger LOGGER = Logger.getLogger(SendMail.class);
	private MailSender mailSender;

	public SendMail(MailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendFpwdMail(String mailTo, String username, String url) throws MessagingException {
		MimeMessage mailMessage = ((JavaMailSender) mailSender)
				.createMimeMessage();
		// 设置utf-8或GBK编码，否则邮件会有乱码
			MimeMessageHelper messageHelper = new MimeMessageHelper(
					mailMessage, true, "utf-8");
			messageHelper.setTo(mailTo);// 接受者
			messageHelper.setFrom(MailConstantUtil.INSTANCE.getGeediMail());// 发送者
			messageHelper.setSubject(MailConstantUtil.INSTANCE
					.getFpwdMailSubject());// 主题
			// 邮件内容，注意加参数true
			Map<String, String> rMap = new HashMap<String, String>();
			rMap.put("username", username);
			rMap.put("br", System.getProperty("line.separator"));
			rMap.put("url", url);
			messageHelper.setText(
					formatContent(
							MailConstantUtil.INSTANCE.getFpwdMailContent(),
							rMap), true);
			((JavaMailSender) mailSender).send(mailMessage);
	}

	private String formatContent(String fpwdMailContent,
			Map<String, String> rMap) {
		for (String key : rMap.keySet()) {
			fpwdMailContent = fpwdMailContent.replaceAll("\\[" + key + "\\]",
					rMap.get(key));
		}
		return fpwdMailContent;
	}

}