package org.job.web.po;

import java.util.List;

import org.job.entity.Education;
import org.job.entity.Resume;
import org.job.entity.ResumeDelivery;
import org.job.entity.Users;
import org.job.entity.WorkExp;

public class UserResume extends ResumeDelivery {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5579412805853138716L;

	private String workName;
	
	private Users users;
	
	private Resume resume;
	
	private List<WorkExp> workExps;
	
	private List<Education> educations;

	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public List<WorkExp> getWorkExps() {
		return workExps;
	}

	public void setWorkExps(List<WorkExp> workExps) {
		this.workExps = workExps;
	}

	public List<Education> getEducations() {
		return educations;
	}

	public void setEducations(List<Education> educations) {
		this.educations = educations;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}
	
	
	
}
