package net.crm.dao.daoImpl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.crm.dao.UserDao;
import net.crm.model.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionFactory;

	public List<User> listUsers() 
	{
		return (List<User>) sessionFactory.getCurrentSession().createCriteria(User.class).list();		 
	}

	public void saveUser(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);

	}

	public List<User> getUserByUserEmail(String userEmail) {
		return sessionFactory.getCurrentSession().createQuery("from User where userEmail=:userEmail").setString("userEmail",userEmail).list();
	}


	public List<User> validateLoginUser(String userEmail, String password) {
		return sessionFactory.getCurrentSession().createQuery("from User where userEmail=:userEmail and password=:password").setString("userEmail", userEmail).setString("password",password).list();
	}
	private int pageSize = 3; 
	public List getData(int pageNumber) 
	{ 
		List result = null; 
		try {
		Query query = sessionFactory.getCurrentSession().createQuery("from Employee"); 
		query = query.setFirstResult(pageSize * (pageNumber - 1));
		query.setMaxResults(pageSize); result = query.list(); 
		//session.getTransaction().commit(); 
		} catch (Exception e) 
		{ 
			e.printStackTrace(); 
		} 
		return result;			
	}
}
