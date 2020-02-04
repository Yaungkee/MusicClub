package javabean;

import java.sql.Date;

public class User {
	private String username;
	private String password;
	private String repassword;
	private String sex;
	/*private Date registerTime;
	private String comment;*/
	public User(String username, String password,String sex) {
		super();
		this.username = username;
		this.password = password;
		this.sex = sex;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return username;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getPassword(){
		return password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
}
