package com.jav.page.dao;


import java.util.List;

import com.jav.page.module.Pager;
import com.jav.util.Video;

public class SublistVideoDaoImpl implements VideoDao {
	
	


	@Override
	public Pager<Video> findVideo(Video searchModle, int pageNum, int pageSize) throws Exception {
		List<Video> allVideo= com.jav.dao.videoDao.getJoy(searchModle);
		Pager<Video> pager=new Pager<Video>(pageNum,pageSize,allVideo);
		return pager;
	}

}
