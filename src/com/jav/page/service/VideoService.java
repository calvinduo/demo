package com.jav.page.service;

import com.jav.page.module.Pager;
import com.jav.util.Video;

public interface VideoService {
	public Pager<Video> findVideo(Video searchModle,int pageNum,int pageSize);
}
