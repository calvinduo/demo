<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.jav.util.Video"%>
<%@ page import="com.jav.dao.videoDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style type="text/css">
	div.searchbox{
	font-size:50px;
	text-align:center;
	}
	</style>
  </head>
  
  <body>
  <center><h1>欢迎来到我的网页</h1><hr></center>
  <form action="searchResult2.jsp" method=get>
 <div class="searchbox">查询<input  type="text" name="search"  style="width:500px;height:60px;">
  <input type="submit"  value="GO!"></div> 
  <%request.setAttribute("sql", "select * from videotest"); %>
  <a href="searchResult2.jsp" style="text-align:center">click!</a>
  </form>
  </body>
</html>
