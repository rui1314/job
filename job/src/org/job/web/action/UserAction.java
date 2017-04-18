package org.job.web.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.job.biz.IEducationService;
import org.job.biz.IResumeService;
import org.job.biz.IUserService;
import org.job.biz.IWorkExpService;
import org.job.entity.Education;
import org.job.entity.Resume;
import org.job.entity.Users;
import org.job.entity.WorkExp;
import org.job.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport {
	private static final long serialVersionUID = -2359321689354712488L;
	
	@Autowired IUserService userService;
	@Autowired IResumeService resumeService;
	@Autowired IWorkExpService workExpService;
	@Autowired IEducationService educationService;
	private Users user;
	private String message;
	private String oldpassword;
	private ResultData result;
	private Resume resume;
	private List<WorkExp> workExps;
	private List<Education> educations;
	
	public String register(){
		boolean flag= false;
		if(user!=null){
			flag = userService.addUser(user);
		}
		if(flag){
			message = "注册成功，请登录！";
			return "register_success";
		}else{
			message = "注册失败，请重试！";
			return "register_input";
		}
	}
	
	public String login(){
		boolean flag= false;
		if(user!=null){
			user = userService.loginUser(user);
			if(user!=null && user.getId()!=null){
				ActionContext.getContext().getSession().put(IAction.INDEX_LOGIN_USER, user);
				flag = true;
			}
		}
		if(flag){
			return "login_success";
		}else{
			message = "登录失败，用户名或密码错误，请重新登录！";
			return "login_input";
		}
	}
	
	public String logout(){
		ActionContext.getContext().getSession().remove(IAction.INDEX_LOGIN_USER);
		return "logout_success";
	}
	
	public String toUpdate(){
		try {
			if(message!=null){
				message = URLDecoder.decode(message, "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		user = (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		return "toUpdate";
	}
	
	public String update(){
		if(user!=null && user.getId()!=null){
			Users oldUsers = userService.getUser(user.getId());
			oldUsers.setName(user.getName());
			oldUsers.setEducation(user.getEducation());
			oldUsers.setEmail(user.getEmail());
			oldUsers.setPhone(user.getPhone());
			oldUsers.setWorkExp(user.getWorkExp());
			oldUsers.setSex(user.getSex());
			oldUsers.setCurrentState(user.getCurrentState());
			result = new ResultData(userService.updateUser(oldUsers));
		}
		return "update_info";
	}
	
	public String uppassword(){
		boolean flag = false;
		if(user !=null && user.getId()!=null){
			Users oldUser = userService.getUser(user.getId());
			if(oldUser.getPassword().equals(oldpassword)){
				oldUser.setPassword(user.getPassword());
				flag = userService.updateUser(oldUser);
				ActionContext.getContext().getSession().remove(IAction.INDEX_LOGIN_USER);
			}else{
				message = "旧密码输入错误，请重新输入";
				return "update_input";
			}
		}
		if(flag){
			message="密码修改成功，请重新登录！";
			return "update_success";
		}else{
			message="密码修改失败，请重新尝试！";
			return "update_input";
		}
	}
	
	/**
	 * 我的简历 
	 * */
	public String myresume(){
		user =  (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		resume = resumeService.getResume(user.getId());
		workExps = workExpService.queryMyWorkExps(user.getId());
		educations = educationService.queryUserEducations(user.getId());
		return "toMyResume";
	}

/*----------------------------*/
	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public ResultData getResult() {
		return result;
	}

	public void setResult(ResultData result) {
		this.result = result;
	}

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
	
	

}
