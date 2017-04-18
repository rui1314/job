package org.job.biz.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.job.biz.IEducationService;
import org.job.biz.IResumeDeliveryService;
import org.job.biz.IResumeService;
import org.job.biz.IUserService;
import org.job.biz.IWorkExpService;
import org.job.biz.IWorkService;
import org.job.dao.DaoTemplate;
import org.job.entity.Resume;
import org.job.entity.ResumeDelivery;
import org.job.entity.Users;
import org.job.pager.Compare;
import org.job.pager.Condition;
import org.job.web.po.UserResume;
import org.job.web.po.WorkPo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("resumeDeliveryService")
public class ResumeDeliveryServiceImpl implements IResumeDeliveryService {

	private static int STATUS_INIT=0;
	private static int STATUS_PASS=1;
	private static int STATUS_REFUSE=2;
	
	@Autowired DaoTemplate daoTemplate;
	
	@Autowired IWorkService workService;
	
	@Autowired IUserService userService;
	
	@Autowired IResumeService resumeService;
	
	@Autowired IEducationService educationService;
	
	
	@Autowired IWorkExpService workExpService;
	
	@Override
	public boolean addDelivery(ResumeDelivery delivery) {
		delivery.setCreateDate(Calendar.getInstance().getTime());
		return daoTemplate.save(delivery);
	}

	@Override
	public boolean updateDelivery(ResumeDelivery delivery) {
		delivery.setCreateDate(Calendar.getInstance().getTime());
		return daoTemplate.update(delivery);
	}

	@Override
	public List<UserResume> queryRecommendResumes(Users users) {
		List<WorkPo> works = workService.queryWorksByUser(users.getId());
		List<UserResume> userResumes = this.queryAllResumes();
		Integer[] workIds = this.queryWorkIds(users);
		List<ResumeDelivery> deliveries = daoTemplate.find(ResumeDelivery.class,new Condition("workId",Compare.IN,workIds)).getList();
		return recommendResumes(userResumes,works,deliveries);
	}

	@Override
	public List<UserResume> queryCanInterviewResumes(Users users) {
		Integer[] workIds = this.queryWorkIds(users);
		List<ResumeDelivery> deliveries = daoTemplate.find(ResumeDelivery.class,new Condition("workId",Compare.IN,workIds), new Condition("status",Compare.EQ,STATUS_INIT)).getList();
		List<UserResume> resumes = new ArrayList<UserResume>();
		if(deliveries!=null && deliveries.size()>0){
			for (ResumeDelivery delivery : deliveries) {
				UserResume resume = new UserResume();
				BeanUtils.copyProperties(delivery, resume);
				resume.setUsers(userService.getUser(delivery.getUserId()));
				resume.setResume(resumeService.getResume(delivery.getUserId()));
				resume.setEducations(educationService.queryUserEducations(delivery.getUserId()));
				resume.setWorkExps(workExpService.queryMyWorkExps(delivery.getUserId()));
				resumes.add(resume);
			}
		}
		return resumes;
	}

	@Override
	public List<UserResume> queryNotifiedResumes(Users users) {
		Integer[] workIds = this.queryWorkIds(users);
		List<ResumeDelivery> deliveries = daoTemplate.find(ResumeDelivery.class,new Condition("workId",Compare.IN,workIds), new Condition("status",Compare.EQ,STATUS_PASS)).getList();
		List<UserResume> resumes = new ArrayList<UserResume>();
		if(deliveries!=null && deliveries.size()>0){
			for (ResumeDelivery delivery : deliveries) {
				UserResume resume = new UserResume();
				BeanUtils.copyProperties(delivery, resume);
				resume.setUsers(userService.getUser(delivery.getUserId()));
				resume.setResume(resumeService.getResume(delivery.getUserId()));
				resume.setEducations(educationService.queryUserEducations(delivery.getUserId()));
				resume.setWorkExps(workExpService.queryMyWorkExps(delivery.getUserId()));
				resumes.add(resume);
			}
		}
		return resumes;
	}

	@Override
	public List<UserResume> queryInappropriateResumes(Users users) {
		Integer[] workIds = this.queryWorkIds(users);
		List<ResumeDelivery> deliveries = daoTemplate.find(ResumeDelivery.class,new Condition("workId",Compare.IN,workIds), new Condition("status",Compare.EQ,STATUS_REFUSE)).getList();
		List<UserResume> resumes = new ArrayList<UserResume>();
		if(deliveries!=null && deliveries.size()>0){
			for (ResumeDelivery delivery : deliveries) {
				UserResume resume = new UserResume();
				BeanUtils.copyProperties(delivery, resume);
				resume.setUsers(userService.getUser(delivery.getUserId()));
				resume.setResume(resumeService.getResume(delivery.getUserId()));
				resume.setEducations(educationService.queryUserEducations(delivery.getUserId()));
				resume.setWorkExps(workExpService.queryMyWorkExps(delivery.getUserId()));
				resumes.add(resume);
			}
		}
		return resumes;
	}
	
	private Integer[] queryWorkIds(Users user){
		List<WorkPo> works = workService.queryWorksByUser(user.getId());
		List<Integer> workIds = new ArrayList<Integer>();
		if(works!=null && works.size()>0){
			for (WorkPo work : works) {
				workIds.add(work.getId());
			}
		}
		return workIds.toArray(new Integer[]{});
	}
	
	
	private List<UserResume> queryAllResumes(){
		List<UserResume> userResumes = new ArrayList<UserResume>();
		List<Users> users = userService.queryAllOrdinaryUser();
		if(users!=null && users.size()>0){
			for (Users user : users) {
				Resume resume = resumeService.getResume(user.getId());
				if(resume!=null){
					UserResume userResume = new UserResume();
					userResume.setUsers(user);
					userResume.setUserId(user.getId());
					userResume.setResume(resume);
					userResume.setEducations(educationService.queryUserEducations(user.getId()));
					userResume.setWorkExps(workExpService.queryMyWorkExps(user.getId()));
					userResumes.add(userResume);
				}
			}
		}
		return userResumes;
	}
	

	private List<UserResume> recommendResumes(List<UserResume> resumes,List<WorkPo> workPos,List<ResumeDelivery> deliveries){
		List<UserResume> resultResumes = new ArrayList<UserResume>();
		for (UserResume userResume : resumes) {
			boolean flag = false;
			for (WorkPo work : workPos) {
				UserResume uresume = new UserResume();
				BeanUtils.copyProperties(userResume, uresume);
				Resume resume = uresume.getResume();
				Users user = uresume.getUsers();
				if(work.getEducation().equals(user.getEducation()) || work.getWorkExp().equals(user.getWorkExp())
						|| resume.getExpectPosition().equals(work.getType()) || work.getNature().equals(resume.getType())){
					
					boolean reflag = false;
					if(deliveries!=null && deliveries.size()>0){
						for (ResumeDelivery delivery : deliveries) {
							if(!delivery.getWorkId().equals(work.getId()) || !delivery.getUserId().equals(user.getId())){
								reflag = true;
							}
						}
						if(reflag){
							flag = true;
							uresume.setWorkName(work.getName());
							uresume.setWorkId(work.getId());
						}
					}else{
						flag = true;
						uresume.setWorkName(work.getName());
						uresume.setWorkId(work.getId());
					}
					
				}
				if(flag){
					resultResumes.add(uresume);
				}
			}
		}
		return resultResumes;
	}

	@Override
	public List<UserResume> queryWorkApplyResumes(int workId) {
		List<ResumeDelivery> deliveries = daoTemplate.find(ResumeDelivery.class,new Condition("workId",Compare.EQ,workId), new Condition("status",Compare.EQ,STATUS_INIT)).getList();
		List<UserResume> resumes = new ArrayList<UserResume>();
		if(deliveries!=null && deliveries.size()>0){
			for (ResumeDelivery delivery : deliveries) {
				UserResume resume = new UserResume();
				BeanUtils.copyProperties(delivery, resume);
				resume.setUsers(userService.getUser(delivery.getUserId()));
				resume.setResume(resumeService.getResume(delivery.getUserId()));
				resume.setEducations(educationService.queryUserEducations(delivery.getUserId()));
				resume.setWorkExps(workExpService.queryMyWorkExps(delivery.getUserId()));
				resumes.add(resume);
			}
		}
		return resumes;
	}
	
}
