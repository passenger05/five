package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.Speaker;
import com.zhiyou100.service.SpeakerService;
import com.zhiyou100.vo.ResponseVo;

@Controller
public class SpeakerController {

	@Autowired
	private SpeakerService service;

	@RequestMapping(path="/speaker/listSpeakers",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<List<Speaker>> listSpeakersByPage() {

		List<Speaker> list = service.listSpeakersByPage(1);
		
		return new ResponseVo<List<Speaker>>(0, "", list);
	}

	@RequestMapping(path="/speaker/addSpeaker",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> addSpeaker(@RequestBody Speaker speaker) {

		service.addSpeaker(speaker);

		return new ResponseVo<String>(0, "添加成功", null);
	}
	
	@RequestMapping(path="/speaker/updateSpeaker",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> updateSpeaker(@RequestBody Speaker speaker) {

		service.updateSpeaker(speaker);

		return new ResponseVo<String>(0, "修改成功", null);
	}
	
	@RequestMapping(path="/speaker/delete",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> deleteSpeaker(@RequestBody HashMap<String, Long> param) {
		
		service.deleteSpeaker(param.get("speakerId"));
		
		return new ResponseVo<String>(0, "删除成功", null);
	}
	
	

}
