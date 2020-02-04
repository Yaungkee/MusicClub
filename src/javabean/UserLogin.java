package javabean;

public class UserLogin {
	private String user;
	private String pwd;
	public UserLogin() {
	}
	public UserLogin(String user, String pwd) {
		super();
		this.user = user;
		this.pwd = pwd;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
