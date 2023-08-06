package com.pms;

public class Updated {
int projectId;
String projectName, description, user, status;

public Updated() {
	super();
}
public Updated(String projectName, String description, String user, String status,int projectId) {
	super();
	this.projectId = projectId;
	this.projectName = projectName;
	this.description = description;
	this.user = user;
	this.status = status;
}
public int getProjectId() {
	return projectId;
}
public void setProjectId(int projectId) {
	this.projectId = projectId;
}
public String getProjectName() {
	return projectName;
}
public void setProjectName(String projectName) {
	this.projectName = projectName;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

}
