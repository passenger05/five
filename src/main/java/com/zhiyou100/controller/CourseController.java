package com.zhiyou100.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.model.Course;
import com.zhiyou100.service.CourseService;
import com.zhiyou100.vo.ResponseVo;

@Controller
public class CourseController {

	@Autowired
	private CourseService service;
	
	@RequestMapping(path="/course/listCourses",method=RequestMethod.POST)
	public @ResponseBody List<Course> listCoursesbyPage() {
		
		return service.listCoursesbyPage(1);
	}
	
	@RequestMapping(path="/course/addCourse",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> addCourse(@RequestBody Course course) {

		service.addCourse(course);

		return new ResponseVo<String>(0, "添加成功", null);
	}
	
	@RequestMapping(path="/course/updateCourse",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> updateCourse(@RequestBody Course course) {

		service.updateCourse(course);

		return new ResponseVo<String>(0, "修改成功", null);
	}
	
	@RequestMapping(path="/course/delete",method=RequestMethod.POST)
	public @ResponseBody ResponseVo<String> deleteCourse(@RequestBody HashMap<String, Long> param) {
		
		service.deleteCourse(param.get("courseId"));
		
		return new ResponseVo<String>(0, "删除成功", null);
	}
	
	
}
