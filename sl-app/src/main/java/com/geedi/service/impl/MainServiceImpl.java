package com.geedi.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.geedi.mapper.MainDOMapper;
import com.geedi.mapper.dao.TaskBoard;
import com.geedi.mapper.dao.TaskSet;
import com.geedi.pojo.FailReturnInfo;
import com.geedi.pojo.ReturnInfo;
import com.geedi.pojo.SuccessReturnInfo;
import com.geedi.service.IMainService;

@Service("mainService")
public class MainServiceImpl implements IMainService {

	private Logger log = Logger.getLogger(MainServiceImpl.class);
	@Autowired
	private MainDOMapper mainDOMapper;

	@Override
	public ReturnInfo newTaskBoard(TaskBoard taskBoard) {
		ReturnInfo returnInfo;
		try {
			returnInfo = new SuccessReturnInfo(taskBoard.getTitle() + " 创建成功");
			mainDOMapper.saveTaskBoard(taskBoard);
		} catch (Exception e) {
			log.error("MainServiceImpl newTask error:", e);
			returnInfo = new FailReturnInfo("服务器开小差了。。请重试");
		}

		return returnInfo;
	}

	@Override
	public List<TaskBoard> getTaskBoards(int taskSetId) {
		return mainDOMapper.getTaskBoards(taskSetId);
	}

	@Override
	public ReturnInfo newTaskSet(TaskSet taskSet) {
		ReturnInfo returnInfo;
		try {
			returnInfo = new SuccessReturnInfo(taskSet.getTaskSetName()
					+ " 创建成功");
			mainDOMapper.saveTaskSet(taskSet);
		} catch (Exception e) {
			log.error("MainServiceImpl newTaskSet error:", e);
			returnInfo = new FailReturnInfo("服务器开小差了。。请重试");
		}
		return returnInfo;
	}

	@Override
	public List<TaskSet> getTaskSets() {
		return mainDOMapper.getTaskSets();
	}

}
