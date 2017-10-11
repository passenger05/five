package com.zhiyou100.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.SpeakerDao;
import com.zhiyou100.model.Speaker;
import com.zhiyou100.service.SpeakerService;

@Service
public class SpeakerServiceImpl implements SpeakerService {


	@Autowired
	private SpeakerDao dao;

	public List<Speaker> listSpeakersByPage(long page) {

		long index = (page-1)*10;

		List<Speaker> list = dao.listSpeakersByPage(index);

		return list;
	}

	public int deleteSpeaker(long id) {

		int count = dao.deleteSpeaker(id);

		return count;
	}

	public void addSpeaker(Speaker speaker) {


		dao.addSpeaker(speaker);
	}

	public void updateSpeaker(Speaker speaker) {

		dao.updateSpeaker(speaker);

	}

	public long getPageCount() {
		
		long m = dao.getPageCount();

		long n = 10;

		return (m + n - 1)/n;

	}
}