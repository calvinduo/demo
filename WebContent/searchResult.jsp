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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	   div{
	      float:left;
	      margin: 10px;
	   }
	   div dd{
	      margin:0px;
	      font-size:10pt;
	   }
	   div dd.dd_name
	   {
	      color:red;
	      width:300px;
	      white-space:nowrap;
	      overflow:hidden;
	      text-overflow:ellipsis;
	   }
	   div dd.dd_city
	   {
	      color:#000;
	   }
	</style>
  </head>
  
  <body>
    <h1>商品展示</h1>
    <hr>
  
    <center>
    <table width="1500" height="100" cellpadding="0" cellspacing="0" border="0">
      <tr>
        <td>
          
          <!-- 商品循环开始 -->
           <% 
           List<Video> vs=videoDao.getJoy(request.getParameter("search"));
           out.print(request.getParameter("rearch"));
           if(vs!=null&&vs.size()>0){
        	   for(int i=0;i<vs.size();i++){
        		   Video v=vs.get(i);
           %>   
          <div>
             <dl>
               <dt>
                 <a href="details.jsp?id=<%=v.getId()%>" target="_blank"><img src=<%=v.getPiclink() %> width="280" height="210" border="1"/></a>
               </dt>
               <dd class="dd_name"><%=v.getName() %></dd> 
               <dd class="dd_city">产地:<%="日本" %>&nbsp;&nbsp;价格:￥ <%="100日元" %></dd> 
             </dl>
          </div>
          <!-- 商品循环结束 -->
        
          <%
                   }
              } 
          %>
        </td>
      </tr>
    </table>
    </center>
  </body>
</html>
