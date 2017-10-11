package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Speaker;

public interface SpeakerDao {

	List<Speaker> listSpeakersByPage(long index);
	
	
	/**
	 * 		删除这个主讲人的时候，删除对应的视频
	 * @param id
	 * @return
	 */
	int deleteSpeaker(long id);		
	
	void addSpeaker(Speaker speaker);
	
	void updateSpeaker(Speaker speaker);
	
	long getPageCount();
	
}
