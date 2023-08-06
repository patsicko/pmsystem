package com.pms;

public class CurrentUser {
String currentEmail;

public String getCurrentEmail() {
	return currentEmail;
}

public void setCurrentEmail(String currentEmail) {
	this.currentEmail = currentEmail;
}

public CurrentUser(String currentEmail) {
	super();
	this.currentEmail = currentEmail;
}

public CurrentUser() {
	super();
}

}
