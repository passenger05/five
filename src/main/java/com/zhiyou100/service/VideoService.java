package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.Video;
import com.zhiyou100.util.PageInfo;
import com.zhiyou100.vo.VideoQueryVo;

public interface VideoService {

	PageInfo<Video> listVideo(VideoQueryVo videoQueryVo);
	
	int deleteVideoById(Long ...ids);
	
	void addVideo(Video video);
	
	int updateVideo(Video video );
	
	List<Video> listVideosByTerm(String videoName,Long speakerId,Long courseId);
	
}
