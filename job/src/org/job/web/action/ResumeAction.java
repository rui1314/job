package org.job.web.action;

import java.util.Calendar;

import org.job.biz.IEducationService;
import org.job.biz.IResumeService;
import org.job.biz.IWorkExpService;
import org.job.entity.Education;
import org.job.entity.Resume;
import org.job.entity.Users;
import org.job.entity.WorkExp;
import org.job.web.po.UserResume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("resumeAction")
@Scope("prototype")
public class ResumeAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8847360780810561811L;

	@Autowired IResumeService resumeService;
	
	@Autowired IWorkExpService workExpService;
	
	@Autowired IEducationService educationService;
	
	
	private Resume resume;
	
	private WorkExp exp;
	
	private Education edu;
	
	private String companyYearStart;
	private String companyMonthStart;
	private String companyYearEnd;
	private String companyMonthEnd;
	
	private UserResume userResume;
	private int userId;

	public String save(){
		Users user =  (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		boolean flag= false;
		if(resume!=null){
			if(resume.getId()!=null){
				Resume oldResume = resumeService.getResumeById(resume.getId());
				if(oldResume!=null){
					oldResume.setExpectCity(resume.getExpectCity());
					oldResume.setType(resume.getType());
					oldResume.setExpectPosition(resume.getExpectPosition());
					oldResume.setExpectSalary(resume.getExpectSalary());
					resumeService.updateResume(oldResume);
				}else{
					flag=true;
				}
			}else{
				flag=true;
			}
		}
		if(flag){
			resume.setUserId(user.getId());
			resumeService.addResume(resume);
		}
		return "save_success";
	}
	
	public String updatename(){
		Users user =  (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		boolean flag= false;
		if(resume!=null){
			if(resume.getId()!=null){
				Resume oldResume = resumeService.getResumeById(resume.getId());
				if(oldResume!=null){
					oldResume.setName(resume.getName());
					resumeService.updateResume(oldResume);
				}else{
					flag=true;
				}
			}else{
				flag=true;
			}
		}
		if(flag){
			resume.setUserId(user.getId());
			resumeService.addResume(resume);
		}
		return "save_success";
	}
	
	public String removeExp(){
		if(exp!=null && exp.getId()!=null){
			workExpService.removeWorkExp(exp.getId());
		}
		return "save_success";
	}
	
	public String saveExp(){
		Users user =  (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		boolean flag=false;
		if(exp!=null){
			if(exp.getId()!=null){
				WorkExp oldExp = workExpService.getWorkExp(exp.getId());
				if(oldExp!=null){
					oldExp.setName(exp.getName());
					Calendar calendar = Calendar.getInstance();
					calendar.set(Integer.valueOf(companyYearStart), Integer.valueOf(companyMonthStart), 1);
					oldExp.setBeginDate(calendar.getTime());
					if(companyYearEnd.equals("至今") || companyMonthEnd.equals("至今")){
						oldExp.setEndDate(Calendar.getInstance().getTime());
					}else{
						calendar.set(Integer.valueOf(companyYearEnd), Integer.valueOf(companyMonthEnd), 1);
						oldExp.setEndDate(calendar.getTime());
					}
					oldExp.setPosition(exp.getPosition());
					oldExp.setUserId(user.getId());
					workExpService.updateWorkExp(oldExp);
				}else{
					flag=true;
				}
			}else{
				flag=true;
			}
		}
		if(flag){
			exp.setUserId(user.getId());
			Calendar calendar = Calendar.getInstance();
			calendar.set(Integer.valueOf(companyYearStart), Integer.valueOf(companyMonthStart), 1);
			exp.setBeginDate(calendar.getTime());
			if(companyYearEnd.equals("至今") || companyMonthEnd.equals("至今")){
				exp.setEndDate(Calendar.getInstance().getTime());
			}else{
				calendar.set(Integer.valueOf(companyYearEnd), Integer.valueOf(companyMonthEnd), 1);
				exp.setEndDate(calendar.getTime());
			}
			workExpService.addWorkExp(exp);
		}
		return "save_success";
	}
	
	public String saveEdu(){
		Users user =  (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		boolean flag=false;
		if(edu!=null){
			if(edu.getId()!=null){
				Education oldEdu = educationService.getEducation(edu.getId());
				if(oldEdu!=null){
					Calendar calendar = Calendar.getInstance();
					calendar.set(Integer.valueOf(companyYearStart), 1, 1);
					oldEdu.setBeginDate(calendar.getTime());
					calendar.set(Integer.valueOf(companyYearEnd), 1,1);
					oldEdu.setEndDate(calendar.getTime());
					oldEdu.setEducation(edu.getEducation());
					oldEdu.setMajor(edu.getMajor());
					oldEdu.setName(edu.getName());
					oldEdu.setUserId(user.getId());
					educationService.updateEduction(oldEdu);
				}else{
					flag = true;
				}
			}else{
				flag = true;
			}
		}
		
		if(flag){
			Calendar calendar = Calendar.getInstance();
			calendar.set(Integer.valueOf(companyYearStart), 1, 1);
			edu.setBeginDate(calendar.getTime());
			calendar.set(Integer.valueOf(companyYearEnd), 1,1);
			edu.setEndDate(calendar.getTime());
			edu.setUserId(user.getId());
			educationService.addEduction(edu);
		}
		return "save_success";
	}
	
	public String preview(){
		userResume = resumeService.getUserResume(userId);
		return "resume_preview";
	}
	
	public Resume getResume() {
		return resume;
	}

	public void setResume(Resume resume) {
		this.resume = resume;
	}

	public WorkExp getExp() {
		return exp;
	}

	public void setExp(WorkExp exp) {
		this.exp = exp;
	}

	public String getCompanyYearStart() {
		return companyYearStart;
	}

	public void setCompanyYearStart(String companyYearStart) {
		this.companyYearStart = companyYearStart;
	}

	public String getCompanyMonthStart() {
		return companyMonthStart;
	}

	public void setCompanyMonthStart(String companyMonthStart) {
		this.companyMonthStart = companyMonthStart;
	}

	public String getCompanyYearEnd() {
		return companyYearEnd;
	}

	public void setCompanyYearEnd(String companyYearEnd) {
		this.companyYearEnd = companyYearEnd;
	}

	public String getCompanyMonthEnd() {
		return companyMonthEnd;
	}

	public void setCompanyMonthEnd(String companyMonthEnd) {
		this.companyMonthEnd = companyMonthEnd;
	}

	public Education getEdu() {
		return edu;
	}

	public void setEdu(Education edu) {
		this.edu = edu;
	}

	public UserResume getUserResume() {
		return userResume;
	}

	public void setUserResume(UserResume userResume) {
		this.userResume = userResume;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	
}
