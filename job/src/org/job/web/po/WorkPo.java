package org.job.web.po;

import org.job.entity.Work;

public class WorkPo extends Work {
	private static final long serialVersionUID = 4376677654963529046L;
	private Integer salaryMin;
	private Integer salaryMax;
	public Integer getSalaryMin() {
		return salaryMin;
	}
	public void setSalaryMin(Integer salaryMin) {
		this.salaryMin = salaryMin;
	}
	public Integer getSalaryMax() {
		return salaryMax;
	}
	public void setSalaryMax(Integer salaryMax) {
		this.salaryMax = salaryMax;
	}
	
	
}
