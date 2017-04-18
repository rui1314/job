package org.job.biz;

import java.util.List;
import org.job.entity.Users;

public interface IUserService {

	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	boolean addUser(Users user);
	
	Users loginUser(Users user);
	
	Users getUser(int userId);
	
	boolean updateUser(Users user);
	
	List<Users> queryAllOrdinaryUser();
	
	Users adminLogin(Users user);
	
	List<Users> queryAllUsers();
}
