package com.geedi.controller.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geedi.mapper.dao.TaskBoard;
import com.geedi.mapper.dao.TaskSet;
import com.geedi.mapper.dao.User;
import com.geedi.pojo.ReturnInfo;
import com.geedi.service.IMainService;

@Controller
@RequestMapping(value = "/main")
public class MainController {

	@Autowired
	private IMainService mainService;

	@RequestMapping(value = "/taskSet")
	public String taskSet() {
		return "main/taskSet";
	}

	@RequestMapping(value = "/taskBoard")
	public String task() {
		return "main/taskBoard";
	}

	@RequestMapping(value = "/newTaskBoard")
	@ResponseBody
	public ReturnInfo newTaskBoard(String title, int taskSetId,
			HttpSession session) {
		User user = getUser(session);
		TaskBoard taskBoard = new TaskBoard();
		taskBoard.setTitle(title);
		taskBoard.setTaskSetId(taskSetId);
		taskBoard.setUserId(user.getUserId());
		return mainService.newTaskBoard(taskBoard);
	}

	private User getUser(HttpSession session) {

		return (User) session.getAttribute("user");
	}

	@RequestMapping(value = "/getTaskBoards")
	@ResponseBody
	public List<TaskBoard> getTaskBoards(int taskSetId) {
		return mainService.getTaskBoards(taskSetId);
	}

	@RequestMapping(value = "/newTaskSet")
	@ResponseBody
	public ReturnInfo newTaskSet(String taskSetName, String summary,
			HttpSession session) {
		User user = getUser(session);
		TaskSet taskSet = new TaskSet();
		taskSet.setTaskSetName(taskSetName);
		taskSet.setSummary(summary);
		taskSet.setUserId(user.getUserId());
		return mainService.newTaskSet(taskSet);
	}

	@RequestMapping(value = "/getTaskSets")
	@ResponseBody
	public List<TaskSet> getTaskSets() {
		return mainService.getTaskSets();
	}

	@RequestMapping(value = "/task")
	public String task(int taskBoardId, String title, HttpServletRequest request) {
		request.setAttribute("title", title);
		return "main/task";
	}
}
