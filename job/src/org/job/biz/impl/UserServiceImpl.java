package org.job.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.job.biz.IUserService;
import org.job.dao.DaoTemplate;
import org.job.entity.UserTypeConstant;
import org.job.entity.Users;
import org.job.pager.Compare;
import org.job.pager.Condition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@SuppressWarnings("unchecked")
@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired DaoTemplate daoTemplate;

	@Override
	public boolean addUser(Users user) {
		return daoTemplate.save(user);
	}

	@Override
	public Users loginUser(Users user) {
		List<Users> users =daoTemplate.find(Users.class, new Condition("email",Compare.EQ,user.getEmail()),new Condition("password",Compare.EQ,user.getPassword())).getList();
		if(users!=null && users.size()>0){
			return users.get(0);
		}
		return null;
	}
	
	@Override
	public Users adminLogin(Users user){
		List<Users> users =daoTemplate.find(Users.class, new Condition("account",Compare.EQ,user.getAccount()),new Condition("password",Compare.EQ,user.getPassword())).getList();
		if(users!=null && users.size()>0){
			return users.get(0);
		}
		return null;
	}

	@Override
	public Users getUser(int userId) {
		List<Users> users =daoTemplate.find(Users.class, new Condition("id",Compare.EQ,userId)).getList();
		if(users!=null && users.size()>0){
			return users.get(0);
		}
		return null;
	}

	@Override
	public boolean updateUser(Users user) {
		return daoTemplate.update(user);
	}

	@Override
	public List<Users> queryAllOrdinaryUser() {
		return daoTemplate.find(Users.class, new Condition("type",Compare.EQ,UserTypeConstant.USER_TYPE_ORDINARY_USER)).getList();
	}

	@Override
	public List<Users> queryAllUsers() {
		return daoTemplate.find(Users.class).getList();
	}
	
}
