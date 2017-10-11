package com.zhiyou100.model;

public class Course {

	private long id;
	
	private String title;
	
	private String introduction;
	
	private long subjectId;

	public Course() {
		super();
	}
	

	public Course(String title, String introduction, long subjectId) {
		super();
		this.title = title;
		this.introduction = introduction;
		this.subjectId = subjectId;
	}

	public Course(long id, String title, String introduction, long subjectId) {
		super();
		this.id = id;
		this.title = title;
		this.introduction = introduction;
		this.subjectId = subjectId;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", title=" + title + ", introduction=" + introduction + ", subjectId=" + subjectId
				+ "]";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}
	
	
	
}
