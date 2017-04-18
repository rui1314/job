package org.job.biz.impl;

import java.util.List;

import org.job.biz.IResumeService;
import org.job.biz.IWorkExpService;
import org.job.dao.DaoTemplate;
import org.job.entity.Resume;
import org.job.entity.WorkExp;
import org.job.pager.Compare;
import org.job.pager.Condition;
import org.job.pager.Order;
import org.job.pager.OrderDirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("workexpService")
public class WorkExpServiceImpl implements IWorkExpService {

	@Autowired DaoTemplate daoTemplate;
	
	@Autowired IResumeService resumeService;
	
	@Override
	public List<WorkExp> queryMyWorkExps(int userId) {
		return daoTemplate.find(WorkExp.class, new Condition("userId",Compare.EQ,userId),new Condition(new Order("id", OrderDirect.DESC))).getList();
	}

	@Override
	public boolean addWorkExp(WorkExp exp) {
		Resume resume = resumeService.getResume(exp.getUserId());
		resumeService.updateResume(resume);
		return daoTemplate.save(exp);
	}

	@Override
	public boolean updateWorkExp(WorkExp exp) {
		Resume resume = resumeService.getResume(exp.getUserId());
		resumeService.updateResume(resume);
		return daoTemplate.update(exp);
	}

	@Override
	public boolean removeWorkExp(int id) {
		WorkExp exp = getWorkExp(id);
		if(exp!=null){
			return daoTemplate.delete(exp);
		}
		return false;
	}

	@Override
	public WorkExp getWorkExp(int id) {
		List<WorkExp> workExps = daoTemplate.find(WorkExp.class, new Condition("id",Compare.EQ,id)).getList();
		if(workExps!=null && workExps.size()>0){
			return workExps.get(0);
		}
		return null;
	}

}
