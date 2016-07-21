package com.jav.page.dao;

import com.jav.page.module.Pager;
import com.jav.util.Video;

public interface VideoDao {
	public Pager<Video> findVideo(Video searchModle,int pageNum,int pageSize) throws Exception;

}
