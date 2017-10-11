package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Video;
import com.zhiyou100.vo.VideoQueryVo;

public interface VideoDao {

	List<Video> listVideo(VideoQueryVo videoQueryVo);
	
	int deleteVideoById(Long ...ids);
	
	int deleteVideoBySpeakerId(long speakerId);
	
	int deleteVideoByCourseId(long courseId);
	
	void addVideo(Video video);
	
	int updateVideo(Video video );
	
	List<Video> listVideosByTerm(String videoName,Long speakerId,Long courseId);
	
	int getPageCount(VideoQueryVo videoQueryVo);
	
	
}
