package org.job.web.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.job.biz.IWorkService;
import org.job.entity.UserTypeConstant;
import org.job.entity.Users;
import org.job.web.po.WorkPo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("defaultAction")
@Scope("prototype")
public class DefaultAction extends ActionSupport {
	private static final long serialVersionUID = -1645265120672444869L;

	@Autowired IWorkService workService;
	
	private List<WorkPo> works;
	private List<WorkPo> recomWorks;
	private String message;
	
	
	public String index(){
		Users user =  (Users) ActionContext.getContext().getSession().get(IAction.INDEX_LOGIN_USER);
		works = workService.queryAllWorks(null);
		if(user!=null && user.getId()!=null && user.getType().equals(UserTypeConstant.USER_TYPE_ORDINARY_USER)){
			recomWorks = workService.queryRecomWorks(user);
		}
		return "toIndex";
	}
	
	public String login(){
		if(message!=null){
			try {
				message = URLDecoder.decode(message,"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "toLogin";
	}
	
	public String register(){
		return "toRegister";
	}
	
	public String companyList(){
		return "toCompanyList";
	}
	
	/**
	 * 到发布职位页面
	 * @return
	 */
	public String release(){
		
		return "toRelease";
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<WorkPo> getWorks() {
		return works;
	}

	public void setWorks(List<WorkPo> works) {
		this.works = works;
	}

	public List<WorkPo> getRecomWorks() {
		return recomWorks;
	}

	public void setRecomWorks(List<WorkPo> recomWorks) {
		this.recomWorks = recomWorks;
	}
	
	
}
