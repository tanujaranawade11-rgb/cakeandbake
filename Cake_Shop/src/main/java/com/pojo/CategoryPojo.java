package com.pojo;

public class CategoryPojo {
	private int id;
	private String name;
	private String desc;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public CategoryPojo( String name, String desc) {
		super();
		
		this.name = name;
		this.desc = desc;
	}
	public CategoryPojo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
