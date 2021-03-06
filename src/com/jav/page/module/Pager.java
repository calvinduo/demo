package com.jav.page.module;

import java.io.Serializable;
import java.util.List;


public class Pager<T> implements Serializable {

	
	private static final long serialVersionUID = 7838930287018616586L;
	private int pageSize;//每页显示多少条记录
	private int currentPage;//当前页数
	private int totalRecord;//一共有多少记录
	private int totalPage;//一共有多少页记录
	private List<T> dataList;//要显示的数据
	
	public Pager(int pageNum,int pageSize,List<T> sourceList){
		if(sourceList==null){
			return;
		}
		this.totalRecord=sourceList.size();
		
		this.pageSize=pageSize;
		
		this.totalPage=this.totalRecord/this.pageSize;
		if(this.totalRecord%this.pageSize!=0){
			this.totalPage++;
		}
		this.currentPage=pageNum>this.totalPage?this.totalPage:pageNum;
//		if(pageNum>this.totalPage){
//			this.currentPage=this.totalPage;
//		}
//		else{
//			this.currentPage=pageNum;
//		}
		
		int fromIndex=this.pageSize*(this.currentPage-1);
		int toIndex=this.pageSize*this.currentPage>this.totalRecord?this.totalRecord:this.pageSize*this.currentPage;
//		if(this.pageSize*this.currentPage>this.totalRecord){
//			toIndex=this.totalRecord;
//		}
//		else{
//			toIndex=this.pageSize*this.currentPage;
//		}
		dataList=sourceList.subList(fromIndex, toIndex);
	}
	
	
	
	
	public Pager() {
		super();
	}
	public Pager(int pageSize, int currentPage, int totalRecord, int totalPage, List<T> dataList) {
		super();
		this.pageSize = pageSize;
		this.currentPage = currentPage;
		this.totalRecord = totalRecord;
		this.totalPage = totalPage;
		this.dataList = dataList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getDataList() {
		return dataList;
	}
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
	
}
