package org.job.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.job.biz.IResumeService;
import org.job.biz.IWorkService;
import org.job.dao.DaoTemplate;
import org.job.entity.Resume;
import org.job.entity.Users;
import org.job.entity.Work;
import org.job.pager.Compare;
import org.job.pager.Condition;
import org.job.web.po.WorkPo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("workService")
public class WorkServiceImpl implements IWorkService {

	@Autowired DaoTemplate daoTemplate;
	
	@Autowired IResumeService resumeService;
	
	@Override
	public boolean createWork(Work work) {
		return daoTemplate.save(work);
	}

	@Override
	public Work getWork(int id) {
		List<Work> works = daoTemplate.find(Work.class, new Condition("id",Compare.EQ,id)).getList();
		if(works!=null && works.size()>0){
			return works.get(0);
		}
		return null;
	}

	@Override
	public int getNewWorkId() {
		return (Integer) daoTemplate.getMaxId(Work.class, "id");
	}

	@Override
	public List<WorkPo> queryWorksByUser(int userId) {
		List<Work> works = daoTemplate.find(Work.class, new Condition("userId",Compare.EQ,userId)).getList();
		List<WorkPo> workPos=null;
		if(works!=null){
			workPos=new ArrayList<WorkPo>(works.size());
			for (Work work : works) {
				WorkPo workPo = new WorkPo();
				BeanUtils.copyProperties(work, workPo);
				if(work.getSalary()!=null){
					String[] salarys = work.getSalary().split("-");
					workPo.setSalaryMin(Integer.valueOf(salarys[0]));
					workPo.setSalaryMax(Integer.valueOf(salarys[1]));
				}
				workPos.add(workPo);
			}
		}
		return workPos;
	}

	@Override
	public boolean updateWork(Work work) {
		return daoTemplate.update(work);
	}

	@Override
	public boolean delete(int id) {
		Work work = getWork(id);
		if(work!=null){
			return daoTemplate.delete(work);
		}
		return false;
	}

	@Override
	public List<WorkPo> queryAllWorks(String key) {
		List<Work> works = daoTemplate.find(Work.class).getList();
		List<WorkPo> workPos=null;
		if(works!=null){
			workPos=new ArrayList<WorkPo>(works.size());
			for (Work work : works) {
				WorkPo workPo = new WorkPo();
				BeanUtils.copyProperties(work, workPo);
				if(work.getSalary()!=null){
					String[] salarys = work.getSalary().split("-");
					workPo.setSalaryMin(Integer.valueOf(salarys[0]));
					workPo.setSalaryMax(Integer.valueOf(salarys[1]));
				}
				if(key!=null){
					if(work.getName().toUpperCase().contains(key.toUpperCase()) || work.getDescribe().toUpperCase().contains(key.toUpperCase()) || work.getCity().equals(key) || work.getType().equals(key)){
						workPos.add(workPo);
					}
				}else{
					workPos.add(workPo);
				}
			}
		}
		return workPos;
	}

	@Override
	public List<WorkPo> queryRecomWorks(Users user) {
		List<Work> works = daoTemplate.find(Work.class).getList();
		List<WorkPo> workPos=null;
		if(works!=null){
			workPos=new ArrayList<WorkPo>(works.size());
			for (Work work : works) {
				WorkPo workPo = new WorkPo();
				BeanUtils.copyProperties(work, workPo);
				if(work.getSalary()!=null){
					String[] salarys = work.getSalary().split("-");
					workPo.setSalaryMin(Integer.valueOf(salarys[0]));
					workPo.setSalaryMax(Integer.valueOf(salarys[1]));
				}
				if(user!=null){
					Resume resume = resumeService.getResume(user.getId());
					if(resume!=null){
						if(work.getEducation().equals(user.getEducation()) || work.getWorkExp().equals(user.getWorkExp())
								|| resume.getExpectPosition().equals(work.getType()) || work.getNature().equals(resume.getType())){
							workPos.add(workPo);
						}
					}
				}else{
					workPos.add(workPo);
				}
			}
		}
		return workPos;
	}
}
