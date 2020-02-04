package Action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javabean.DBUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class shareAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();       
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		HttpSession session = ServletActionContext.getRequest().getSession();
		String username=(String)session.getAttribute("username");
		String comment=request.getParameter("comment");
		String musicid=request.getParameter("musicid");
		String musicname=request.getParameter("musicname");
		
		Connection conn = DBUtil.connectDB();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String create_dt=df.format(new Date());// new Date()为获取当前系统时间
		String sql = "INSERT INTO share(username,comment,create_dt,musicid,musicname) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,username);
		pstmt.setString(2,comment);
		pstmt.setString(3,create_dt);
		pstmt.setString(4,musicid);
		pstmt.setString(5,musicname);
		pstmt.execute();
		
		/*PrintWriter out=response.getWriter();
		out.write("success");
		out.close();*/
		return SUCCESS;
	}
	
}
