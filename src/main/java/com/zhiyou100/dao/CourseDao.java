package com.zhiyou100.dao;

import java.util.List;

import com.zhiyou100.model.Course;

public interface CourseDao {

	int updateCourse(Course Course);
	
	/**
	 * 			删除这个课程的时候，删除对应的视频
	 * @param id
	 * @return
	 */
	
	Course getCourse(long id);
	
	int deleteCourse(long id);
	
	void addCourse(Course course);
	
	List<Course> listCoursesbyPage(long index);	//	(page-1)*10  // 1   >> 0,10	2	>>  10,10	3 >> 20,10
	
	long getPageCount();
	
}
