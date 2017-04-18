package org.job.pager;

import java.util.List;

public class ResultList {
	private List list;//返回对像结果
	private Pager pager;
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public ResultList(List list, Pager pager) {
		super();
		this.list = list;
		this.pager = pager;
	}
	public ResultList() {
		super();
	}

	
	
}
