package org.job.biz;

import java.util.List;

import org.job.entity.Users;
import org.job.entity.Work;
import org.job.web.po.WorkPo;

/**
 * @author Administrator
 *
 */
public interface IWorkService {

	/**
	 * 发布职位
	 * @param work
	 * @return
	 */
	boolean createWork(Work work);
	
	
	/**
	 * 通过ID查询职位
	 * @param id
	 * @return
	 */
	Work getWork(int id);
	
	
	/**
	 * 获取最新职位ID
	 * @return
	 */
	int getNewWorkId();
	
	boolean updateWork(Work work);
	
	boolean delete(int id);
	
	/**
	 * 我发布的职位
	 * @param userId
	 * @return
	 */
	List<WorkPo> queryWorksByUser(int userId);
	
	List<WorkPo> queryAllWorks(String key);
	
	List<WorkPo> queryRecomWorks(Users user);
}
