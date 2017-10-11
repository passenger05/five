package com.zhiyou100.service.Impl;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;
import com.zhiyou100.util.PageInfo;
import com.zhiyou100.vo.VideoQueryVo;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class VideoServiceImplTest {
	
	@Autowired
	private VideoService service;

	@Test
	public void testListVideo() {
		
		VideoQueryVo videoQueryVo = new VideoQueryVo();
		
		videoQueryVo.setPageIndex(1);
		videoQueryVo.setPageSize(10);

		PageInfo<Video> list = service.listVideo(videoQueryVo);
	
		System.out.println(list);
	}

	@Test
	public void testDeleteVideoById() {

		Long[] longs = new Long[]{2l,5l};
		
		service.deleteVideoById(longs);
		
	}

	@Test
	public void testAddVideo() {
		
		Video video = new Video("bcsa", 1, 2, 123, "cc", "qq", "word");
	
		service.addVideo(video);
	}
	

	@Test
	public void testUpdateVideo() {
		
		Video video = new Video(2,"aa", 1, 2, 123, "cc", "dd", "word");
		
		service.updateVideo(video);
		
	}
	
	@Test
	public void testListVideosByTerm() {
	
		List<Video> list = service.listVideosByTerm("人", null, null);
		
		for (Video video : list) {
			System.out.println(video);
		}
	}

	@Test
	public void testGetPageCount() {
		fail("Not yet implemented");
	}

}
