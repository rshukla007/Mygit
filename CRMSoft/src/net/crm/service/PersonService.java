package net.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.crm.dao.PersonDAO;
import net.crm.model.Person;

@Service
public class PersonService {

	@Autowired
	private PersonDAO personDAO;
	
	
	public List<Person> list(Integer offset, Integer maxResults){
		return personDAO.list(offset, maxResults);
	}
	
	public Integer count(){
		return (Integer) personDAO.count();
	}
	
	public void save(){
		personDAO.save();
	}
	
}
