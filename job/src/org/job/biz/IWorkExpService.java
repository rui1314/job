package org.job.biz;

import java.util.List;

import org.job.entity.WorkExp;


public interface IWorkExpService {

	List<WorkExp> queryMyWorkExps(int userId);
	
	boolean addWorkExp(WorkExp exp);
	
	boolean updateWorkExp(WorkExp exp);
	
	boolean removeWorkExp(int id);
	
	WorkExp getWorkExp(int id);
}
