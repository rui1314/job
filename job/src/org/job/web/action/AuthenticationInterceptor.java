package org.job.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**身份认证*/
public class AuthenticationInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -3034011208764241252L;
	
	private String[] filterUrl = new String[]{"login","register","work/list","work/info","admin/"};
	
	
	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		
		Map session =  arg0.getInvocationContext().getSession();
		ActionContext cxt = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)cxt.get(ServletActionContext.HTTP_REQUEST);
		String url = request.getRequestURI();  
		if(!checkUrl(url)){
			if (session.get(IAction.INDEX_LOGIN_USER)==null){
				((Map)arg0.getInvocationContext().get("request")).put("message", "您尚未登录");
				return IAction.INPUT;
			} else {
				return arg0.invoke();
			}	
		}else{
			return arg0.invoke();
		}
	}
	
	private boolean checkUrl(String url){
		boolean flag = false;
		for (String u : filterUrl) {
			if(url.endsWith(u)){
				flag = true;
				break;
			}
		}
		return flag;
	}

}
