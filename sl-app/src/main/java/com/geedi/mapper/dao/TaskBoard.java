package com.geedi.mapper.dao;

public class TaskBoard {
	private int id;
	private String title;
	private int taskSetId;
	private int userId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getTaskSetId() {
		return taskSetId;
	}

	public void setTaskSetId(int taskSetId) {
		this.taskSetId = taskSetId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	

}
