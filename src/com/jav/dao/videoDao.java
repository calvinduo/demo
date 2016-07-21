package com.jav.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.jav.util.*;

public class videoDao {
	public static List<Video> getVideos() throws Exception{
		List<Video> videos=new ArrayList<>();
		Connection conn=DBHelper.getConnection();
		PreparedStatement pstmt=conn.prepareStatement("select * from videotest;");
		ResultSet rs=pstmt.executeQuery();
		while(rs.next()){
			Video v=new Video();
			v.setId(rs.getInt("videoid"));
			v.setName(rs.getString("videoname"));
			v.setDlink(rs.getString("videoadd"));
			v.addPic();
			videos.add(v);
			
		}
		return videos;
	}
	public static List<Video> getVideosByStatement(String sql) throws Exception{
		List<Video> videos=new ArrayList<>();
		Connection conn=DBHelper.getConnection();
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		
		for(int i=0;i<10;i++){
			rs.next();
			Video v=new Video();
			v.setId(rs.getInt("videoid"));
			v.setName(rs.getString("videoname"));
			v.setDlink(rs.getString("videoadd"));
			v.addPic();
			videos.add(v);
			
		}
		return videos;
	}
	
	public static Video getVideoById(int i) throws Exception{
		Connection conn=DBHelper.getConnection();
		PreparedStatement stmt=conn.prepareStatement("select * from videotest where videoid=?");
		stmt.setInt(1, i);
		ResultSet rs=stmt.executeQuery();
		if(rs.next()){
			Video v=new Video();
			v.setId(rs.getInt("videoid"));
			v.setName(rs.getString("videoname"));
			v.setDlink(rs.getString("videoadd"));
			v.addPic();
			return v;
		}		
		return null;		
	}
	
	public static List<Video> getJoy(String x) throws Exception{
		List<Video> vs=new ArrayList<Video>();
		Connection conn=DBHelper.getConnection();
		PreparedStatement stmt=conn.prepareStatement("select * from videotest where videoname like ?");
		stmt.setString(1, "%"+x+"%");
		ResultSet rs=stmt.executeQuery();
		while(rs.next()){
			Video v=new Video();
			v.setId(rs.getInt("videoid"));
			v.setName(rs.getString("videoname"));
			v.setDlink(rs.getString("videoadd"));
			v.addPic();
			vs.add(v);
		}
		return vs;
	}

}
