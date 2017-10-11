package com.zhiyou100.service.Impl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Course;
import com.zhiyou100.service.CourseService;

import junit.framework.TestCase;


@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class CourseServiceImplTest {
	
	@Autowired
	private CourseService service;

	@Test
	public void testUpdateCourse() {

		Course course = new Course(1, "aa", "bb", 2);
		
		int i = service.updateCourse(course);
		
		System.out.println(i);
	}

	@Test
	public void testDeleteCourse() {
		
		TestCase.assertEquals(1, service.deleteCourse(1));
	}

	@Test
	public void testAddCourse() {
		
		Course course = new Course("aa", "bb", 1);
		
		service.addCourse(course);
		
	}

	@Test
	public void testListCoursesbyPage() {
		
		List<Course> list = service.listCoursesbyPage(1);
		
		for (Course course : list) {
			
			System.out.println(course);
		}
	}

	@Test
	public void testGetPageCount() {
		
		long count = service.getPageCount();
		
		System.out.println(count);
	}

	@Test
	public void testGetCourse() {

		Course course = service.getCourse(7);
		
		System.out.println(course);
	
	}

}
