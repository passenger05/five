package com.zhiyou100.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou100.model.Subject;
import com.zhiyou100.service.SubjectService;

@Controller
public class SubjectController {

	@Autowired
	private SubjectService service;
	
	@RequestMapping("")
	public List<Subject> listSubject(){
		
		return service.listSubjects();
		
	}
	
}
