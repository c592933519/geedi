package com.geedi.mapper;

import java.util.List;

import com.geedi.mapper.dao.TaskBoard;
import com.geedi.mapper.dao.TaskSet;

public interface MainDOMapper {
	void saveTaskBoard(TaskBoard taskBoard);

	List<TaskBoard> getTaskBoards(int taskSetId);

	void saveTaskSet(TaskSet taskSet);

	List<TaskSet> getTaskSets();

}
