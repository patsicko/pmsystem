package com.pms;

public class Project {
String projectName, description,user;

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

public Project(String projectName, String description, String user) {
	super();
	this.projectName = projectName;
	this.description = description;
	this.user = user;
}

public Project() {
	super();
}

}
