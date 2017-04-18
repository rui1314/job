package org.job.web.action;

import java.util.Calendar;
import java.util.List;

import org.job.biz.INewsService;
import org.job.biz.IResumeDeliveryService;
import org.job.biz.IWorkService;
import org.job.entity.News;
import org.job.entity.ResumeDelivery;
import org.job.entity.UserTypeConstant;
import org.job.entity.Users;
import org.job.entity.Work;
import org.job.web.po.UserResume;
import org.job.web.po.WorkPo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("workAction")
@Scope("prototype")
public class WorkAction extends ActionSupport {
	private static final long serialVersionUID = -7162297956637000668L;

	@Autowired
	IWorkService workService;
	
	@Autowired IResumeDeliveryService resumeDeliveryService;
	
	@Autowired INewsService newsService;

	private Work work;
	private Integer salaryMin;
	private Integer salaryMax;
	private Integer workId;
	private List<WorkPo> works;
	private String key;
	
	private ResumeDelivery delivery;
	
	private List<UserResume> resumes;
	
	private List<News> news;
	
	public String add() {
		boolean flag = false;
		if (work != null) {
			Users user = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
			work.setSalary(salaryMin + "-" + salaryMax);
			work.setUserId(user.getId());
			work.setCreateDate(Calendar.getInstance().getTime());
			work.setDescribe(work.getDescribe().replaceAll("\r\n", "-@-@-"));
			flag = workService.createWork(work);
		}
		if (flag) {
			workId = workService.getNewWorkId();
			return "add_success";
		} else {
			return "add_input";
		}
	}
	
	public String update(){
		boolean flag = false;
		if (work != null) {
			Users user = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
			work.setSalary(salaryMin + "-" + salaryMax);
			work.setUserId(user.getId());
			work.setCreateDate(Calendar.getInstance().getTime());
			work.setDescribe(work.getDescribe().replaceAll("\r\n", "-@-@-"));
			flag = workService.updateWork(work);
		}
		if (flag) {
			workId = work.getId();
			return "update_success";
		} else {
			return "update_input";
		}
	}

	public String remove(){
		boolean flag = workService.delete(workId);
		return flag?"remove_success":"remove_input";
	}
	
	public String detail() {
		if(workId!=null){
			Work wk = workService.getWork(workId);
			work = new WorkPo();
			BeanUtils.copyProperties(wk, work);
			if(work.getSalary()!=null){
				String[] salarys = work.getSalary().split("-");
				salaryMax = Integer.valueOf(salarys[1]);
				salaryMin = Integer.valueOf(salarys[0]);
			}
			work.setDescribe(work.getDescribe().replaceAll("-@-@-", "\r\n"));
		}
		return "toEditDetail";
	}
	
	public String info(){
		if(workId!=null){
			Work wk = workService.getWork(workId);
			work = new WorkPo();
			BeanUtils.copyProperties(wk, work);
			if(work.getSalary()!=null){
				String[] salarys = work.getSalary().split("-");
				salaryMax = Integer.valueOf(salarys[1]);
				salaryMin = Integer.valueOf(salarys[0]);
			}
			work.setDescribe(work.getDescribe().replaceAll("-@-@-", "\r\n"));
		}
		return "toInfoDetail";
	}
	
	public String list(){
		Users user = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		//企业会员获取自己创建的职位
		if(user!=null && user.getType().equals(UserTypeConstant.USER_TYPE_ENTERPRISE_VIP)){
			works = workService.queryWorksByUser(user.getId());
			return "work_positions";
		}else{
			news = newsService.queryAllNews();
			works = workService.queryAllWorks(key);//普通用户查询所有职位
			return "work_job_list";
		}
		
	}
	
	/**
	 * 待处理简历
	 * @return
	 */
	public String canInterviewResumes(){
		Users users = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		resumes=resumeDeliveryService.queryCanInterviewResumes(users);
		return "to_canInterviewResumes";
	}
	
	/**
	 * 推荐简历
	 * @return
	 */
	public String recommendResumes(){
		Users users = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		resumes=resumeDeliveryService.queryRecommendResumes(users);
		return "to_recommendResumes";
	}
	
	/**
	 * 不合适的简历
	 * @return
	 */
	public String inappropriateResumes(){
		Users users = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		resumes=resumeDeliveryService.queryInappropriateResumes(users);
		return "to_inappropriateResumes";
	}
	
	/**
	 * 通知面试简历
	 * @return
	 */
	public String notifiedResumes(){
		Users users = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		resumes=resumeDeliveryService.queryNotifiedResumes(users);
		return "to_notifiedResumes";
	}
	
	public String notice(){
		if(delivery!=null){
			delivery.setStatus(1);
			if(delivery.getId()!=null){
				resumeDeliveryService.updateDelivery(delivery);
			}else {
				resumeDeliveryService.addDelivery(delivery);
			}
		}
		return "notice_success";
	}
	
	public String apply(){
		resumes=resumeDeliveryService.queryWorkApplyResumes(workId);
		return "to_applyResumes";
	}
	
	public String delivery(){
		Users users = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		ResumeDelivery delivery = new ResumeDelivery();
		delivery.setUserId(users.getId());
		delivery.setWorkId(workId);
		delivery.setStatus(0);
		resumeDeliveryService.addDelivery(delivery);
		return "delivery_success";
	}
	
	public String refuse(){
		if(delivery!=null){
			delivery.setStatus(2);
			if(delivery.getId()!=null){
				resumeDeliveryService.updateDelivery(delivery);
			}else {
				resumeDeliveryService.addDelivery(delivery);
			}
		}
		return "refuse_success";
	}

	/*------------------------------*/
	public Work getWork() {
		return work;
	}

	public void setWork(Work work) {
		this.work = work;
	}

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

	public Integer getWorkId() {
		return workId;
	}

	public void setWorkId(Integer workId) {
		this.workId = workId;
	}

	public List<WorkPo> getWorks() {
		return works;
	}

	public void setWorks(List<WorkPo> works) {
		this.works = works;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public List<UserResume> getResumes() {
		return resumes;
	}

	public void setResumes(List<UserResume> resumes) {
		this.resumes = resumes;
	}

	public ResumeDelivery getDelivery() {
		return delivery;
	}

	public void setDelivery(ResumeDelivery delivery) {
		this.delivery = delivery;
	}

	public List<News> getNews() {
		return news;
	}

	public void setNews(List<News> news) {
		this.news = news;
	}
	
	
}
