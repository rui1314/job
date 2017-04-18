package org.job.pager;

public class FunctionDemand {
	
	private String pro;//放到聚合函数查询的属性
	
	private Function fun;//使用的聚合函数

	private String alia;//别名

	public String getPro() {
		return pro;
	}

	public void setPro(String pro) {
		this.pro = pro;
	}

	public Function getFun() {
		return fun;
	}

	public void setFun(Function fun) {
		this.fun = fun;
	}

	public String getAlia() {
		return alia;
	}

	public void setAlia(String alia) {
		this.alia = alia;
	}

	public FunctionDemand(String pro, Function fun, String alia) {
		super();
		this.pro = pro;
		this.fun = fun;
		this.alia = alia;
	}

	public FunctionDemand() {
		super();
	}
	
		
}
