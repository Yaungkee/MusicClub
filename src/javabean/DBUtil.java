package javabean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	private static final String url1="jdbc:mysql://localhost/javaweb?";
	private static final String url2="user=qyq&password=870724";
	private static final String url3="&useUnicode=true&characterEncoding=UTF-8";
	private static final String URL=url1+url2+url3;
	private static final String DRIVER="com.mysql.jdbc.Driver";
	public static Connection connectDB() throws Exception{
		//1���������ݿ�����
		Class.forName(DRIVER);
		//2����ȡ���ݿ�����
		Connection conn=DriverManager.getConnection(URL);
		return conn;
	}
}

