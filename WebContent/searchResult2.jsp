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
      .gg
       {
	   font-size:20px;
	   color:red;
	   border:1px solid red;
	   }
	</style>
  </head>
  
  
  <body>
    <h1><%=request.getParameter("search") %>的结果</h1>
    <% 
    int currentPage;
    int pageSize=20;
    if(request.getParameter("currentPage")==null){
    	currentPage=1; 	
    }
    else {
    	String temp=request.getParameter("currentPage");
    	currentPage=Integer.parseInt(temp);
    }
    %>
    <hr>
  
    <center>
    <table width="1500" height="100" cellpadding="0" cellspacing="0" border="0">
      <tr>
        <td>
           <% 
           List<Video> vs=new ArrayList<Video>();
           if(request.getParameter("search")!=null){
        	   vs=videoDao.getJoy(request.getParameter("search"));
           }
           else{
        	   vs=videoDao.getVideos();
        	   out.print(vs.size());
           }
           
           int totalRecord=vs.size();
           int totalPage=vs.size()%pageSize==0?vs.size()/pageSize:vs.size()/pageSize+1;
           int fromIndex=pageSize*(currentPage-1);
   		   int toIndex=pageSize*currentPage>totalRecord?totalRecord:pageSize*currentPage;
           if(vs!=null&&vs.size()>0){
        	   for(int i=fromIndex;i<toIndex;i++){
        		   Video v=vs.get(i);
           %>   
          <div>
             <dl>
               <dt>
                 <a href="details.jsp?id=<%=v.getId()%>" target="_blank"><img src=<%=v.getPiclink() %> width="280" height="210" border="1"/></a>
               </dt>
               <dd class="dd_name"><%=v.getName() %></dd> 
             </dl>
          </div>        
          <%
                   }
              } 
          %>
        </td>
      </tr>
    </table>
    </center>
    <hr>

    <div class="gg" style="margin:0 auto;">
	<%
    //底部导航    
	if(currentPage>1){%>
	<a href="searchResult2.jsp?currentPage=1&search=<%=request.getParameter("search")%>" >第一页</a>
    <a href="searchResult2.jsp?currentPage=<%=currentPage-1%>&search=<%=request.getParameter("search")%>">上一页</a>
    <%}
    for(int i=1;i<11;i++){
    	
    	if(totalPage<=10){
    		if(i>totalPage) break;%>
	<a href="searchResult2.jsp?currentPage=<%=i%>&search=<%=request.getParameter("search")%>"><%=i %></a>	
    		
    	<% }
    	else{ 
    		if(currentPage<5){%>
	<a href="searchResult2.jsp?currentPage=<%=i%>&search=<%=request.getParameter("search")%>"><%=i %></a>		
    	<% }
    		else{
    			if(currentPage-5+i>totalPage) break;%>
	<a href="searchResult2.jsp?currentPage=<%=currentPage-5+i%>&search=<%=request.getParameter("search")%>"><%=currentPage-5+i %></a>    			
    		<% }
		
    	}
    }
  
    	if(currentPage<totalPage){
    	currentPage++;
    	request.setAttribute("currentPage", currentPage);     	
    %>
    <a href="searchResult2.jsp?currentPage=<%=currentPage%>&search=<%=request.getParameter("search")%>" >下一页</a>
    <a href="searchResult2.jsp?currentPage=<%=totalPage%>&search=<%=request.getParameter("search")%>" >到末页</a>
    <%} %>
    <a href="index.jsp">返回首页</a>
    </div>
  </body>
</html>
