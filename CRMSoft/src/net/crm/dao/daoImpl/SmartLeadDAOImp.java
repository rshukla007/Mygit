package net.crm.dao.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.crm.dao.SmartLeadDAO;
import net.crm.model.Smartlead;
import net.crm.model.User;

@Repository("smartleadDao")
public class SmartLeadDAOImp implements SmartLeadDAO
{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Smartlead create(Smartlead sp) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(sp);
		return sp;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Smartlead> getAll() {
		// TODO Auto-generated method stub
		return (List<Smartlead>) sessionFactory.getCurrentSession().createCriteria(Smartlead.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Smartlead> findAll() {
		// TODO Auto-generated method stub
		return (List<Smartlead>) sessionFactory.getCurrentSession().createCriteria(Smartlead.class).list();		
	}
	
	
}
