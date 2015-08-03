package net.crm.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import net.crm.model.Person;
import net.crm.model.User;
import net.crm.service.PersonService;
import net.crm.service.UserService;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class PersonDAO {

	@Autowired 
	private SessionFactory sessionFactory;
	
	@Autowired
	private PersonService personService;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Person> list(Integer offset, Integer maxResults){
		System.out.println("Inside Factory");
		return sessionFactory.getCurrentSession()
				.createCriteria(Person.class)
				.setFirstResult(offset!=null?offset:0)
				.setMaxResults(maxResults!=null?maxResults:10)
				.list();
		
		//return (List<Person>) sessionFactory.getCurrentSession().createCriteria(Person.class).list();		 
	}
	
	public Integer count(){
		return (Integer)sessionFactory.openSession()
				.createCriteria(Person.class)
				.setProjection(Projections.rowCount())
				.uniqueResult();
	}
		
	public void save(){
		for(int itr=1;itr <= 100 ; itr++)
		{
			Person person = new Person("Person_"+itr,Math.max(25, (itr%2)*35));
			sessionFactory.openSession().save(person);
		}		
	}	
}
