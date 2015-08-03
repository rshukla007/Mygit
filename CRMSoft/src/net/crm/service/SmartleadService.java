package net.crm.service;

import java.util.List;

import net.crm.model.Smartlead;

public interface SmartleadService 
{
	public Smartlead create(Smartlead sp);
	//public Smartlead get(Integer id);
	public List<Smartlead> getAll();
	/*public Smartlead update(Smartlead sp); //throws SmartleadNotFoundException;
	public Smartlead delete(Integer id); //throws SmartleadNotFoundException;*/
}
