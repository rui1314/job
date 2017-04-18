package org.job.biz;

import org.job.entity.Resume;
import org.job.web.po.UserResume;

public interface IResumeService {

	Resume getResume(int userId);
	
	boolean addResume(Resume resume);
	
	boolean updateResume(Resume resume);
	
	Resume getResumeById(int id);
	
	UserResume getUserResume(int userId);
}
