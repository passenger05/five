package com.zhiyou100.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.dao.CourseDao;
import com.zhiyou100.model.Course;
import com.zhiyou100.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService	{

	@Autowired
	private CourseDao dao;
	
	public int updateCourse(Course course) {
		
		int count = dao.updateCourse(course);
		
		return count;
	}

	public int deleteCourse(long id) {
		
		int count = dao.deleteCourse(id);
		
		return count;
	}

	public void addCourse(Course course) {

		dao.addCourse(course);
	}

	public List<Course> listCoursesbyPage(long page) {
		
		long index = (page-1)*10;
		
		List<Course> list = dao.listCoursesbyPage(index);
		
		return list;
	}

	public long getPageCount() {

		long m = dao.getPageCount();
		
		long n = 10;
		
		return (m + n - 1)/n;
	}

	public Course getCourse(long id) {

		Course course = dao.getCourse(id);
		
		return course;
	}

}
