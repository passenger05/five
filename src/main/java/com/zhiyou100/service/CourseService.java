package com.zhiyou100.service;

import java.util.List;

import com.zhiyou100.model.Course;

public interface CourseService {

	int updateCourse(Course course);
	
	int deleteCourse(long id);
	
	void addCourse(Course course);
	
	List<Course> listCoursesbyPage(long page);
	
	Course getCourse(long id);
	
	long getPageCount();
}
