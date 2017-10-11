package com.zhiyou100.model;

public class Video {

	private long id;
	
	private String name;
	
	private long speakerId;
	
	private String speakerName;
	
	private long courseId;
	
	private long timelong;
	
	private String imageURL;
	
	private String videoURL;
	
	private String presentation;
	
	private long playCount;
	

	public Video() {
		super();
	}


	public Video(String name, long speakerId, long courseId, long timelong, String imageURL, String videoURL,
			String presentation) {
		super();
		this.name = name;
		this.speakerId = speakerId;
		this.courseId = courseId;
		this.timelong = timelong;
		this.imageURL = imageURL;
		this.videoURL = videoURL;
		this.presentation = presentation;
	}
	
	public Video(long id,String name, long speakerId, long courseId, long timelong, String imageURL, String videoURL,
			String presentation) {
		super();
		
		this.id = id;
		this.name = name;
		this.speakerId = speakerId;
		this.courseId = courseId;
		this.timelong = timelong;
		this.imageURL = imageURL;
		this.videoURL = videoURL;
		this.presentation = presentation;
	}


	public Video(long id, String name, long speakerId, String speakerName, long courseId, long timelong,
			String imageURL, String videoURL, String presentation, long playCount) {
		super();
		this.id = id;
		this.name = name;
		this.speakerId = speakerId;
		this.speakerName = speakerName;
		this.courseId = courseId;
		this.timelong = timelong;
		this.imageURL = imageURL;
		this.videoURL = videoURL;
		this.presentation = presentation;
		this.playCount = playCount;
	}
	

	@Override
	public String toString() {
		return "Video [id=" + id + ", name=" + name + ", speakerId=" + speakerId + ", speakerName=" + speakerName
				+ ", courseId=" + courseId + ", timelong=" + timelong + ", imageURL=" + imageURL + ", videoURL="
				+ videoURL + ", presentation=" + presentation + ", playCount=" + playCount + "]";
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public long getSpeakerId() {
		return speakerId;
	}


	public void setSpeakerId(long speakerId) {
		this.speakerId = speakerId;
	}


	public String getSpeakerName() {
		return speakerName;
	}


	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
	}


	public long getCourseId() {
		return courseId;
	}


	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}


	public long getTimelong() {
		return timelong;
	}


	public void setTimelong(long timelong) {
		this.timelong = timelong;
	}


	public String getImageURL() {
		return imageURL;
	}


	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}


	public String getVideoURL() {
		return videoURL;
	}


	public void setVideoURL(String videoURL) {
		this.videoURL = videoURL;
	}


	public String getPresentation() {
		return presentation;
	}


	public void setPresentation(String presentation) {
		this.presentation = presentation;
	}


	public long getPlayCount() {
		return playCount;
	}


	public void setPlayCount(long playCount) {
		this.playCount = playCount;
	}

	
	
}
