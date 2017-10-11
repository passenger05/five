package com.zhiyou100.service.Impl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Speaker;
import com.zhiyou100.service.SpeakerService;


@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class SpeakerServiceImplTest {

	@Autowired
	private SpeakerService service;
	
	@Test
	public void testListSpeakersByPage() {

		List<Speaker> list = service.listSpeakersByPage(1);
	
		for (Speaker speaker : list) {
			System.out.println(speaker);
		}
	}

	@Test
	public void testDeleteSpeaker() {
		
		service.deleteSpeaker(1);
	}

	@Test
	public void testAddSpeaker() {

		Speaker speaker = new Speaker("aa", "bb", "cc", "dd");
		
		service.addSpeaker(speaker);
	
	}

	@Test
	public void testUpdateSpeaker() {
		
		Speaker speaker = new Speaker(2,"aa", "bb", "cc", "dd");
		
		service.updateSpeaker(speaker);
	}

	@Test
	public void testGetPageCount() {

		long count = service.getPageCount();
	
		System.out.println(count);
	}

}
