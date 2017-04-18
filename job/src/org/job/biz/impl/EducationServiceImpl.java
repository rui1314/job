package org.job.biz.impl;

import java.util.List;

import org.job.biz.IEducationService;
import org.job.biz.IResumeService;
import org.job.dao.DaoTemplate;
import org.job.entity.Education;
import org.job.entity.Resume;
import org.job.pager.Compare;
import org.job.pager.Condition;
import org.job.pager.Order;
import org.job.pager.OrderDirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("educationService")
public class EducationServiceImpl implements IEducationService {
	
	@Autowired DaoTemplate daoTemplate;
	
	@Autowired IResumeService resumeService;
	

	@Override
	public List<Education> queryUserEducations(int userId) {
		return daoTemplate.find(Education.class, new Condition("userId",Compare.EQ,userId),new Condition(new Order("id", OrderDirect.DESC))).getList();
	}

	@Override
	public Education getEducation(int id) {
		List<Education> educations = daoTemplate.find(Education.class, new Condition("id",Compare.EQ,id)).getList();
		if(educations!=null && educations.size()>0){
			return educations.get(0);
		}
		return null;
	}

	@Override
	public boolean addEduction(Education education) {
		Resume resume = resumeService.getResume(education.getUserId());
		if(resume!=null){
			resumeService.updateResume(resume);
		}
		return daoTemplate.save(education);
	}

	@Override
	public boolean updateEduction(Education education) {
		Resume resume = resumeService.getResume(education.getUserId());
		if(resume!=null){
			resumeService.updateResume(resume);
		}
		return daoTemplate.update(education);
	}

	@Override
	public boolean removeEduction(int id) {
		Education education = getEducation(id);
		if(education!=null){
			return daoTemplate.delete(education);
		}
		return false;
	}

}
