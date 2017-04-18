package org.job.biz;

import java.util.List;

import org.job.entity.ResumeDelivery;
import org.job.entity.Users;
import org.job.web.po.UserResume;

public interface IResumeDeliveryService {

	boolean addDelivery(ResumeDelivery delivery);
	
	boolean updateDelivery(ResumeDelivery delivery);
	
	/**
	 * 查询推荐简历
	 * @param users
	 * @return
	 */
	List<UserResume> queryRecommendResumes(Users users);
	
	/**
	 * 查询待处理简历
	 * @param users
	 * @return
	 */
	List<UserResume> queryCanInterviewResumes(Users users);
	
	/**
	 * 查询通知面试简历
	 * @param users
	 * @return
	 */
	List<UserResume> queryNotifiedResumes(Users users);
	
	
	/**
	 * 查询不合适简历
	 * @param users
	 * @return
	 */
	List<UserResume> queryInappropriateResumes(Users users);
	
	List<UserResume> queryWorkApplyResumes(int workId);
}
