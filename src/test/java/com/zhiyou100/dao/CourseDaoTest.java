package com.zhiyou100.dao;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Course;

import junit.framework.TestCase;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class CourseDaoTest {

	@Autowired
	private CourseDao dao;
	
	@Test
	public void testUpdateCourse() {
		
		Course course = new Course(1, "Web前端入门小项目+++我改过了哈哈哈", "来学", 1);
		
		TestCase.assertEquals(1, dao.updateCourse(course));
	}

	@Test
	public void testDeleteCourse() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddCourse() {
		fail("Not yet implemented");
	}

	@Test
	public void testListCoursesbyPage() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetPageCount() {
		fail("Not yet implemented");
	}

}
