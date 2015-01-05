package com.geedi.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Service;

import com.geedi.mapper.UserDOMapper;
import com.geedi.mapper.dao.User;
import com.geedi.pojo.FailReturnInfo;
import com.geedi.pojo.ReturnInfo;
import com.geedi.pojo.SuccessReturnInfo;
import com.geedi.service.IUserService;
import com.geedi.util.GeediConstantUtil;
import com.geedi.util.MD5Tool;
import com.geedi.util.SendMail;

/**
 * 用户service实现类
 * 
 * @author sl
 *
 */
@Service("userService")
public class UserServiceimpl implements IUserService {

	@Autowired
	private UserDOMapper userDOMapper;

	@Autowired
	private MailSender mailSender;

	public User getUser(User user) {
		return userDOMapper.getUser(user);
	}

	@Override
	public ReturnInfo checkUsername(String username) {
		Map<String, String> paramMap = new HashMap<String, String>(1);
		paramMap.put("username", username);
		return checkUsernameOrEmail(paramMap);
	}

	@Override
	public ReturnInfo checkEmail(String email) {
		Map<String, String> paramMap = new HashMap<String, String>(1);
		paramMap.put("email", email);
		return checkUsernameOrEmail(paramMap);
	}

	private ReturnInfo checkUsernameOrEmail(Map<String, String> paramMap) {
		ReturnInfo returnInfo;
		int count = userDOMapper.countUser(paramMap);
		if (count == 1) {
			returnInfo = new FailReturnInfo("已存在");
		} else {
			returnInfo = new SuccessReturnInfo();
		}
		return returnInfo;
	}

	@Override
	public void saveUser(User user) {
		userDOMapper.saveUser(user);
	}

	@Override
	public boolean submitFpwd(User user) throws MessagingException {
		// update user to getEmail
		boolean b = false;
		user = getUser(user);
		if (user != null) {
			String toEmail = user.getEmail();
			String username = user.getUsername();
			String url = getFpwdUrl(username, user.getUserId());
			SendMail sendMail = new SendMail(mailSender);
			sendMail.sendFpwdMail(toEmail, username, url);
			b = true;
		}
		return b;
	}

	private String getFpwdUrl(String username, int userId) {
		StringBuilder getParam = new StringBuilder();
		getParam.append(GeediConstantUtil.INSTANCE.getGeediFpwdAction())
				.append("?username=").append(username);
		getParam.append("&token=").append(getToken(username, userId));
		return getParam.toString();
	}

	private String getToken(String username, int userId) {
		UUID uuid = UUID.randomUUID();
		Map<String, Object> paramMap = new HashMap<String, Object>(2);
		paramMap.put("token", MD5Tool.MD5Encrypt(username + uuid));
		paramMap.put("userId", userId);
		userDOMapper.updateTokenInUser(paramMap);
		return (String) paramMap.get("token");
	}

	@Override
	public void updatePwdAndRestTokenInUser(User user) {
		userDOMapper.updatePwdAndRestTokenInUser(user);
	}
}
