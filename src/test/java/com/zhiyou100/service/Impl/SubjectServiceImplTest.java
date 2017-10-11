package com.zhiyou100.service.Impl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zhiyou100.model.Subject;
import com.zhiyou100.service.SubjectService;


@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class SubjectServiceImplTest {

	@Autowired
	private SubjectService service;

	@Test
	public void testListSubjects() {

		List<Subject> list = service.listSubjects();

		for (Subject subject : list) {

			System.out.println(subject);
		}

	}

}
