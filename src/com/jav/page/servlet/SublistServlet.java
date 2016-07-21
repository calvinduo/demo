package com.jav.page.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jav.page.module.Pager;
import com.jav.page.service.SubListServiceImpl;
import com.jav.page.service.VideoService;
import com.jav.util.Video;

/**
 * Servlet implementation class SublistServlet
 */
@WebServlet("/SublistServlet")
public class SublistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    VideoService vs=new SubListServiceImpl();
    
    public SublistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//����request�����Ϣ
		String videoname=request.getParameter("search");
		String pageNumStr=request.getParameter("pageNum");
		int pageNum=Integer.parseInt(pageNumStr);
		String pageSizeStr=request.getParameter("pageSize");
		int pageSize=Integer.parseInt(pageSizeStr);
		//��ѯ���� 
		Video searchModle=new Video();
		searchModle.setName(videoname);
		Pager<Video> result=vs.findVideo(searchModle, pageNum, pageSize);
		//���ؽ��ҳ��
		request.setAttribute("result", result);;
		request.getRequestDispatcher("searchResult2.jsp").forward(request, response);
		
	}

}
