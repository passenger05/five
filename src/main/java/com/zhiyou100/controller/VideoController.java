package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.Video;
import com.zhiyou100.service.VideoService;
import com.zhiyou100.util.PageInfo;
import com.zhiyou100.vo.ResponseVo;
import com.zhiyou100.vo.VideoQueryVo;

@Controller
public class VideoController {
	
	@Autowired
	private VideoService service;
	
	
	@RequestMapping(path="/video/listVideos",method=RequestMethod.POST)
	
	public @ResponseBody ResponseVo<PageInfo<Video>> list(@RequestBody VideoQueryVo vo) {
		
		PageInfo<Video> pageInfo = service.listVideo(vo);
		
		ResponseVo<PageInfo<Video>> result = new ResponseVo<PageInfo<Video>>(0, "", pageInfo);
		
		return result;
	}
	

	@RequestMapping(path="/video/delete",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> deleteVideoById(@RequestBody HashMap<String, Long[]> param) {
		
		service.deleteVideoById(param.get("videoId"));
		
		return new ResponseVo<String>(0, "删除成功", null);
	}
	
	@RequestMapping(path="/video/addVideo",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> addVideo(@RequestBody Video video) {
		
		service.addVideo(video);
		
		return new ResponseVo<String>(0, "添加成功", null);
	}

	@RequestMapping(path="/video/search",method=RequestMethod.POST)
	public @ResponseBody List<Video> listVideosByTerm(@RequestBody HashMap<String,Object> param) {
		
		Object speakerIdObj = param.get("speakerId");
		Object courseIdObj = param.get("courseId");
		Object titleObj = param.get("title");
		
		Long speakerId = null;
		Long courseId = null;
		String title = null;
		
		if(!speakerIdObj.equals("")){
			speakerId = Long.parseLong((String)speakerIdObj);
		}
		
		if(!courseIdObj.equals("")){
			courseId = Long.parseLong((String)courseIdObj);
		}
		if(titleObj != null ){
			title = (String)titleObj;
		}
		
		List<Video> list = service.listVideosByTerm(title,speakerId,courseId);
		
		for (Video video : list) {
			System.out.println(video);
		}
		return list;
	}
	
	@RequestMapping(path="/video/updateVideo",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> updateVideo(@RequestBody Video video) {
		
		service.updateVideo(video);
		
		return new ResponseVo<String>(0, "更新成功", null);
	}
	
}
