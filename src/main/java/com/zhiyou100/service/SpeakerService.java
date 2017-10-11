package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.Speaker;

public interface SpeakerService {

	List<Speaker> listSpeakersByPage(long page);
	
	int deleteSpeaker(long id);
	
	void addSpeaker(Speaker speaker);
	
	void updateSpeaker(Speaker speaker);
	
	long getPageCount();
}
