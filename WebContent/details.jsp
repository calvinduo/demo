<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="com.jav.util.Video"%>
<%@ page import="com.jav.dao.videoDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <% Video v=videoDao.getVideoById(Integer.parseInt(request.getParameter("id")));%>
  <head>
    <base href="<%=basePath%>">
    
    <title><%=v.getName() %></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
	   div{
	      float:left;
	      margin-left: 30px;
	      margin-right:30px;
	      margin-top: 5px;
	      margin-bottom: 5px;
	   }
	   div dd{
	      margin:0px;
	      font-size:10pt;
	   }
	   div dd.dd_name
	   {
	      color:blue;
	   }
	   div dd.dd_city
	   {
	      color:#000;
	   }
	</style>
  </head>
  
  <body>
    <h1><%=v.getName() %></h1>
    <hr>
          <% 
           
           
            if (v!=null){
            	String pic=v.getPiclink();
            	String pic1=pic.substring(0,pic.lastIndexOf("1"));
            	for(int i=0;i<20;i++){
            		String temp=pic1+(i+1)+".jpg";
            		
            	
          %>
         <img alt="" src=<%=temp %>>
          <%
            		}            
            	}
          %>
          <a href=<%="http://www.51av.xyz/modules/video/player/ckplayer/config.php?id="+request.getParameter("id") %>>去找找</a>

          
       
  </body>
</html>
