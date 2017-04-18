package org.job.web.action;

import java.util.Calendar;
import java.util.List;

import org.job.biz.INewsService;
import org.job.biz.IUserService;
import org.job.biz.IWorkService;
import org.job.entity.News;
import org.job.entity.Users;
import org.job.web.po.WorkPo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("adminAction")
@Scope("prototype")
public class AdminAction extends ActionSupport {

	@Autowired IUserService userService;
	
	@Autowired IWorkService workService;
	
	@Autowired INewsService newsService;
	private Users user;
	private List<Users> users;
	private String message;
	private List<WorkPo> works;
	
	private List<News> newsList;
	private News news;
	private Integer id;
	private Integer type;
	
	@Override
	public String execute() throws Exception {

		return SUCCESS;
	}
	
	public String index(){
		type = type;
		return "toIndex";
	}
	
	public String user(){
		users = userService.queryAllUsers();
		return "toUser";
	}
	
	public String work(){
		works = workService.queryAllWorks(null);
		return "toWork";
	}
	
	public String news(){
		newsList=newsService.queryAllNews();
		return "toNews";
	}
	
	public String delNews(){
		newsService.deleteNews(id);
		return "add_success";
	}
	
	public String addNews(){
		if(news!=null){
			news.setCreateDate(Calendar.getInstance().getTime());
			newsService.addNews(news);
		}
		return "add_success";
	}
	
	public String login(){
		boolean flag= false;
		if(user!=null){
			user = userService.adminLogin(user);
			if(user!=null && user.getId()!=null){
				ActionContext.getContext().getSession().put(IAction.INDEX_LOGIN_USER, user);
				flag = true;
			}
		}
		if(flag){
			return "login_success";
		}else{
			message = "登录失败，用户名或密码错误，请重新登录！";
			return "input";
		}
	}

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

	public List<Users> getUsers() {
		return users;
	}

	public void setUsers(List<Users> users) {
		this.users = users;
	}

	public List<WorkPo> getWorks() {
		return works;
	}

	public void setWorks(List<WorkPo> works) {
		this.works = works;
	}

	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

		
}
