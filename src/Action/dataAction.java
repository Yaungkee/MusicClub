package Action;

import javabean.Share;
import net.sf.json.JSONObject;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import javabean.DBUtil;

import javax.servlet.http.*;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;
public class dataAction extends ActionSupport {
	private Share share;
	public Share getShare() {
		return share;
	}
	public void setShare(Share share) {
		this.share = share;
	}
	public void load() throws Exception {
		ActionContext ctx = ActionContext.getContext();       
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		JSONObject json=new JSONObject();
		Share share = new Share();
		Connection conn = DBUtil.connectDB();
		String sql = "select * from share order by commentid desc";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		int count=1;
		while(rs.next()){
			share.setCommentid(rs.getInt("commentid"));
			share.setUsername(rs.getString("username"));
			share.setComment(rs.getString("comment"));
			String create_dt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(rs.getTimestamp("create_dt"));
			share.setCreate_dt(create_dt);
			share.setLike(rs.getInt("likes"));
			share.setMusicid(rs.getString("musicid"));
			share.setMusicname(rs.getString("musicname"));
			json.put("share"+count, share);
			count++;
		}
		out.print(json);
		out.close();
		/*return SUCCESS;*/
	}
	public void delete() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String username=(String)request.getParameter("username");
		int commentid=Integer.parseInt((String)request.getParameter("commentid"));
		Connection conn = DBUtil.connectDB();
		String sql = "delete from share where username=? and commentid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setInt(2, commentid);
		pstmt.execute();
		out.print("true");
		out.close();
	}
	public void like() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String username=(String)request.getParameter("username");
		String id=request.getParameter("commentid");
		int commentid=Integer.parseInt(id);
		Connection conn = DBUtil.connectDB();
		String sql = "select count(*) from likecomment where username=? and likecommentid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setInt(2, commentid);
		ResultSet rs=pstmt.executeQuery();
		int count=0;
		if(rs.next()){
			count=rs.getInt(1);
		}
		if(count==0){//该用户没有点赞该评论
			//先插入用户点赞信息
			sql = "insert into likecomment values(?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setInt(2, commentid);
			pstmt.execute();
			//再更新点赞数
			sql = "update share set likes=likes+1 where commentid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, commentid);
			pstmt.execute();
			out.print("like");
		}
		else{
			//先删除用户点赞信息
			sql = "delete from likecomment where likecommentid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, commentid);
			pstmt.execute();
			//再更新点赞数
			sql = "update share set likes=likes-1 where commentid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, commentid);
			pstmt.execute();
			out.print("dislike");
		}
		out.close();
	}
}
