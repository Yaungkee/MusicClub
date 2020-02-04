package Action;

import javabean.User;
import javabean.DBUtil;
import java.util.Date;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/*public class userRegisterAction extends ActionSupport implements ModelDriven<User>{
	private User user=new User();
	public User getModel(){
		return user;
	}
	public void validateRegister() throws Exception {//���ݿ�У��
		Connection conn = DBUtil.connectDB();
		String sql = "select count(*) from userinfo where username=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,user.getUsername());
		int count=0;
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		if(count>=1){
			ActionContext ctx = ActionContext.getContext();       
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			request.setAttribute("err", "���û����Ѵ��ڣ����������û���ע��");
			this.addFieldError("error","���û����Ѵ��ڣ����������û���ע��");
		}
		else{
			ActionContext ctx = ActionContext.getContext();       
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
			request.setAttribute("success", "ע��ɹ���");
			HttpServletRequest request=ServletActionContext.getRequest();
		}
	}
	public String register() throws Exception{
		Connection conn = DBUtil.connectDB();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
		String datetime=df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
		String sql = "INSERT INTO userinfo VALUES(?,?,?,?)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,user.getUsername());
		pstmt.setString(2,user.getPassword());
		pstmt.setString(3,user.getSex());
		pstmt.setString(4,datetime);

		pstmt.execute();
		return SUCCESS;
	}
}*/
//�첽ע��
public class userRegisterAction extends ActionSupport{
	/*private User user=new User();
	public User getModel(){
		return user;
	}*/
	public void register() throws Exception{
		Connection conn = DBUtil.connectDB();
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String registeruser=request.getParameter("registeruser");
		String registerpwd=request.getParameter("registerpwd");
		String sql = "select count(*) from userinfo where username=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,registeruser);
		int count=0;
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		if(count>=1){
			out.print("fault");
		}
		else{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
			String datetime=df.format(new Date());// new Date()Ϊ��ȡ��ǰϵͳʱ��
			sql = "INSERT INTO userinfo(username,password,usercreatetime) VALUES(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,registeruser);
			pstmt.setString(2,registerpwd);
			pstmt.setString(3,datetime);
			pstmt.execute();
			out.print("success");
		}
		out.close();
	}
}