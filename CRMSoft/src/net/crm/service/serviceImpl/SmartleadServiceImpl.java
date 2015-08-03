package net.crm.service.serviceImpl;

import java.util.List;

import net.crm.service.SmartleadService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mypack.SmartleadNotFoundException;

import net.crm.dao.SmartLeadDAO;
import net.crm.model.Smartlead;

@Service
@Transactional(rollbackFor=SmartleadNotFoundException.class)
public class SmartleadServiceImpl implements SmartleadService {
	

	@Autowired
	private SmartLeadDAO smartleadDao;
	
	@Override
	public Smartlead create(Smartlead sp) {
		return smartleadDao.create(sp);
	}

	/*@Override
	public Smartlead get(Integer id) {
		return smartleadDao.findOne(id);
	}*/

	@Override
	public List<Smartlead> getAll() 
	{
		return smartleadDao.findAll();
	}
	
	/*@Override
	public Smartlead update(Smartlead sp) throws SmartleadNotFoundException {
		Smartlead sPhoneToUpdate = get(sp.getId());
		if (sPhoneToUpdate == null)
			throw new SmartleadNotFoundException(sp.getId().toString());
		sPhoneToUpdate.update(sp);
		return sPhoneToUpdate;
	}*/

	/*@Override
	public Smartlead delete(Integer id) throws SmartleadNotFoundException {
		Smartlead sPhone = get(id);
		if (sPhone == null)
			throw new SmartleadNotFoundException(id.toString());
		smartleadDao.delete(id);
		return sPhone;
	}*/

}
