package com.jav.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import com.jav.dao.videoDao;

public class DBHelper {
	private static final String driver="com.mysql.jdbc.Driver";
	private static final String url="jdbc:mysql://127.0.0.1:3306/videoinfo";
	private static final String user="root";
	private static final String password="xiao74";
	private static Connection conn=null;
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws Exception{
		if (conn==null){
			conn=DriverManager.getConnection(url, user, password);
			return conn;
		}
		return conn;
	}
	
//	public static void main(String[] args) throws Exception {
//		List<Video> vs=videoDao.getJoy();
//		for (Video video : vs) {
//			System.out.println(video.getName()+":"+video.getPiclink());
//		}
//	}
	
	
	

}
