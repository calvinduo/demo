package com.jav.util;



public class Video {
	private int id;
	private String name;
	private String dlink;
	private String piclink;
	
	public void addPic(){
		String temp=Integer.toString(id);
		while(true){
		if(temp.length()<6){
			temp="0"+temp;
		}
		else if (temp.length()==6) {
			break;
		} 
		}
		String part1=temp.substring(0, 3);
		String part2=temp.substring(3, 6);
		piclink="http://tmb-51avi.51cdn.us/000/"+part1+"/"+part2+"/1.jpg";
		//http://tmb-51avi.51cdn.us/000/709/200/1.jpg
	}

	
	
	
	
	
	
	
	
	
	
	public Video(String name) {
		super();
		this.name = name;
	}











	public Video(){
		
	}
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
	public String getDlink() {
		return dlink;
	}
	public void setDlink(String dlink) {
		this.dlink = dlink;
	}
	public String getPiclink() {
		return piclink;
	}
	public void setPiclink(String piclink) {
		this.piclink = piclink;
	}
	

}
