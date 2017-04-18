package org.job.biz.impl;

import java.util.Calendar;
import java.util.List;

import org.job.biz.IEducationService;
import org.job.biz.IResumeService;
import org.job.biz.IUserService;
import org.job.biz.IWorkExpService;
import org.job.dao.DaoTemplate;
import org.job.entity.Resume;
import org.job.entity.Users;
import org.job.pager.Compare;
import org.job.pager.Condition;
import org.job.web.po.UserResume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("resumeService")
public class ResumeServiceImpl implements IResumeService {

	@Autowired DaoTemplate daoTemplate;
	
	@Autowired IUserService userService;
	
	@Autowired IWorkExpService workExpService;
	
	@Autowired IEducationService educationService;
	
	@Override
	public Resume getResume(int userId) {
		List<Resume> resumes = daoTemplate.find(Resume.class, new Condition("userId",Compare.EQ,userId)).getList();
		if(resumes!=null && resumes.size()>0){
			return resumes.get(0);
		}
		return null;
	}

	@Override
	public boolean addResume(Resume resume) {
		resume.setUpdateTime(Calendar.getInstance().getTime());
		return daoTemplate.save(resume);
	}

	@Override
	public boolean updateResume(Resume resume) {
		resume.setUpdateTime(Calendar.getInstance().getTime());
		return daoTemplate.update(resume);
	}

	@Override
	public Resume getResumeById(int id) {
		List<Resume> resumes = daoTemplate.find(Resume.class, new Condition("id",Compare.EQ,id)).getList();
		if(resumes!=null && resumes.size()>0){
			return resumes.get(0);
		}
		return null;
	}

	@Override
	public UserResume getUserResume(int userId) {
		UserResume resume = new UserResume();
		resume.setUsers( userService.getUser(userId));
		resume.setEducations(educationService.queryUserEducations(userId));
		resume.setResume(this.getResume(userId));
		resume.setWorkExps(workExpService.queryMyWorkExps(userId));
		return resume;
	}

}
