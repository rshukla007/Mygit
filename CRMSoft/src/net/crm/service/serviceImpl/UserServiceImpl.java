package net.crm.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import net.crm.dao.UserDao;
import net.crm.model.User;
import net.crm.service.UserService;

@Service("userService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserServiceImpl implements UserService {
   
	@Autowired
	private UserDao userDao;
	

	public List<User> listUsers() {
		return userDao.listUsers();		
	}
	

	public void saveUser(User user){
	 	 userDao.saveUser(user);
	  }
	
	
	public List<User> getUserByUserEmail(String userEmail){
		   return userDao.getUserByUserEmail(userEmail);
	  }
	
	
	public List<User> validateLoginUser(String userEmail,String password){
		   return userDao.validateLoginUser(userEmail, password);
		
		
	}
}
