package org.job.util;

public class ResultData {

	private String msg;
	private Boolean success;
	private Object data;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public ResultData(String msg, Object data) {
		super();
		this.msg = msg;
		this.data = data;
		this.success = true;
	}

	public ResultData() {
		super();
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public ResultData(String msg, Boolean success, Object data) {
		super();
		this.msg = msg;
		this.success = success;
		this.data = data;
	}

	public ResultData(Boolean success) {
		super();
		this.success = success;
	}

	public ResultData(String msg) {
		super();
		this.msg = msg;
	}
	
	
	
	
}
