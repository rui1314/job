package org.job.biz;

import java.util.List;

import org.job.entity.Education;

public interface IEducationService {

	List<Education> queryUserEducations(int userId);
	
	Education getEducation(int id);
	
	boolean addEduction(Education education);
	
	boolean updateEduction(Education education);
	
	boolean removeEduction(int id);
}
