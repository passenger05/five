package com.zhiyou100.vo;

/**
 * 视频页面数据获取条件的的封装
 * @author yblh0
 *
 */
public class VideoQueryVo extends PageVo {

	/**
	 * 标题
	 */
	private String name;
	
	/**
	 * 
	 * 主讲人 id
	 */
	private Long speakerId;
	
	/**
	 * 课程 id
	 */
	private Long courseId;

	@Override
	public String toString() {
		return "VideoQueryVo [name=" + name + ", speakerId=" + speakerId + ", courseId=" + courseId + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getSpeakerId() {
		return speakerId;
	}

	public void setSpeakerId(Long speakerId) {
		this.speakerId = speakerId;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}
}
