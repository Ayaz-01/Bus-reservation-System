package com.masai.Dto;

public class Users {
private int id;
private String name;
private String email;
private String pass;
private String mobNo;
private boolean admin;
public Users() {}
public Users(int id, String name, String email, String pass, String mobNo, boolean admin) {
	super();
	this.id = id;
	this.name = name;
	this.email = email;
	this.pass = pass;
	this.mobNo = mobNo;
	this.admin = admin;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getMobNo() {
	return mobNo;
}
public void setMobNo(String mobNo) {
	this.mobNo = mobNo;
}
public boolean isAdmin() {
	return admin;
}
public void setAdmin(boolean admin) {
	this.admin = admin;
}
@Override
public String toString() {
	return "id=" + id + ", name=" + name + ", email=" + email + ", pass=" + pass + ", mobNo=" + mobNo
			+ ", admin=" + admin + "";
}

}
