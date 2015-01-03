package com.geedi.mapper.dao;

public class TaskSet {
	private int id;
	private String taskSetName;
	private String summary;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTaskSetName() {
		return taskSetName;
	}
	public void setTaskSetName(String taskSetName) {
		this.taskSetName = taskSetName;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
}
