package com.zhiyou100.model;

public class Speaker {

	private long id;
	
	private String name;
	
	private String position;
	
	private String imageURL;
	
	private String description;

	public Speaker() {
		super();
	}
	

	public Speaker(String name, String position, String imageURL, String description) {
		super();
		this.name = name;
		this.position = position;
		this.imageURL = imageURL;
		this.description = description;
	}

	public Speaker(long id, String name, String position, String imageURL, String description) {
		super();
		this.id = id;
		this.name = name;
		this.position = position;
		this.imageURL = imageURL;
		this.description = description;
	}
	
	

	@Override
	public String toString() {
		return "Speaker [id=" + id + ", name=" + name + ", position=" + position + ", imageURL=" + imageURL
				+ ", description=" + description + "]";
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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
