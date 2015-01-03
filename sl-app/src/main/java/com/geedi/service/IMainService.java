package com.geedi.service;

import java.util.List;

import com.geedi.mapper.dao.TaskBoard;
import com.geedi.mapper.dao.TaskSet;
import com.geedi.pojo.ReturnInfo;

public interface IMainService {


	ReturnInfo newTaskSet(TaskSet taskSet);

	List<TaskSet> getTaskSets();

	ReturnInfo newTaskBoard(TaskBoard taskBoard);

	List<TaskBoard> getTaskBoards(int taskSetId);

}
