package com.jav.page.service;

import com.jav.page.dao.SublistVideoDaoImpl;
import com.jav.page.dao.VideoDao;
import com.jav.page.module.Pager;
import com.jav.util.Video;

public class SubListServiceImpl implements VideoService {

	private VideoDao videoDao;
	public SubListServiceImpl (){
		videoDao=new SublistVideoDaoImpl();
	}
	
	@Override
	public Pager<Video> findVideo(Video searchModle, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		Pager<Video> result=videoDao.findVideo(searchModle, pageNum, pageSize);
		return result;
	}	
	


	public VideoDao getVideoDao() {
		return videoDao;
	}
	public void setVideoDao(VideoDao videoDao) {
		this.videoDao = videoDao;
	}









}
