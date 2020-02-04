package Action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;

import javabean.DBUtil;
import javabean.User;
import javabean.UserLogin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class userLoginAction extends ActionSupport implements ModelDriven<UserLogin>{
	private UserLogin user=new UserLogin();
	public UserLogin getModel(){
		return user;
	}
	Cookie cookie1=new Cookie("name", user.getUser());
	Cookie cookie2=new Cookie("pwd",user.getPwd());
	public void validateLogin() throws Exception {//数据库校验
		Connection conn = DBUtil.connectDB();
		String sql = "select count(*) from userinfo where username=? and password=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,user.getUser());
		pstmt.setString(2,user.getPwd());
		int count=0;
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		if(count<1){
			ActionContext ctx = ActionContext.getContext();       
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			request.setAttribute("err", "用户名或者密码错误！请重新登录");
			this.addFieldError("error","用户名或者密码错误！请重新登录");
		}
	}
	public String login(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("username", user.getUser());
		session.setAttribute("password", user.getPwd());
		session.setMaxInactiveInterval(60*60*24*7);
		ActionContext ctx = ActionContext.getContext();       
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		response.addCookie(cookie1);
		response.addCookie(cookie2);//向客户端添加密码Cookie
		return SUCCESS;
	}
}
//	异步登录
/*public class userLoginAction extends ActionSupport{
	Cookie cookie1=new Cookie("name", user.getUser());
	Cookie cookie2=new Cookie("pwd",user.getPwd());
	public void login() throws Exception{
		ActionContext ctx = ActionContext.getContext();       
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String user=request.getParameter("user");
		String pwd=request.getParameter("pwd");
		Connection conn = DBUtil.connectDB();
		String sql = "select count(*) from userinfo where username=? and password=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,user);
		pstmt.setString(2,pwd);
		int count=0;
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		if(count<1){
			out.print("false");
		}
		else{
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("username", user);
			session.setAttribute("password", pwd);
			session.setMaxInactiveInterval(60*60*24*7);
		}
	}
}*/
/*public void login() throws Exception{
ActionContext ctx = ActionContext.getContext();       
HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
response.setContentType("text/html;charset=UTF-8");
PrintWriter out=response.getWriter();

String user=request.getParameter("user");
String pwd=request.getParameter("pwd");
Connection conn = DBUtil.connectDB();
String sql = "select count(*) from userinfo where username=? and password=?";
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1,user);
pstmt.setString(2,pwd);
int count=0;
ResultSet rs=pstmt.executeQuery();
if(rs.next()){
	count=rs.getInt(1);
}
if(count<1){
	out.print("false");
}
else{
	HttpSession session = ServletActionContext.getRequest().getSession();
	session.setAttribute("username", user);
	session.setAttribute("password", pwd);
	session.setMaxInactiveInterval(60*30);
}
}*/	