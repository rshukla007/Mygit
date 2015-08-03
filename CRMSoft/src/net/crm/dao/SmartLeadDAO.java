package net.crm.dao;

import java.util.List;

import net.crm.model.Smartlead;

public interface SmartLeadDAO {

	public Smartlead create(Smartlead sp) ;
	/*public Smartlead get(Integer id);*/
	public List<Smartlead> getAll();
	/*public Smartlead update(Smartlead sp) ;
	public Smartlead delete(Integer id);
	public Smartlead findOne(Integer id);*/
	public List<Smartlead> findAll();
}
