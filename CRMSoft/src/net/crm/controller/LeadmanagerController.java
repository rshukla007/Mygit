package net.crm.controller;

import java.util.ArrayList;
import java.util.List;

import net.crm.model.Smartlead;
import net.crm.model.User;
import net.crm.service.SmartleadService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/user")
public class LeadmanagerController 
{
	
	@Autowired
    private SmartleadService smartleadService;
	
	/*@RequestMapping(value="/Leadmanager")
	public String listNewPage(Model model)
	{		
		return "/admin/Leadmanager";
	}*/
	
		
	@RequestMapping(value="/Leadmanager", method=RequestMethod.GET)
	public ModelAndView createSmartphonePage() {
		ModelAndView mav = new ModelAndView("/user/Leadmanager");
		Smartlead smartlead = new Smartlead();
		mav.addObject("sPhone", smartlead);
		return mav;
	}
	//@RequestMapping(value="/create", method=RequestMethod.POST,produces={"application/xml", "application/json"})
	@RequestMapping(value="/create",method = RequestMethod.POST,headers = {"Accept=text/xml, application/json"})
	//@RequestMapping(value="/create", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Smartlead createSmartphone(@RequestBody Smartlead smartlead) {
        return smartleadService.create(smartlead);
    }
	
	/*@RequestMapping(value="/Leadmanager",method = RequestMethod.POST)  
    public ModelAndView saveEmployee(@ModelAttribute("command") Smartlead smartlead, BindingResult result)
	{  
		smartleadService.create(smartlead); 
	    return new ModelAndView("redirect:/addPublication.html");  
	}   */
	
	@RequestMapping(value="/all-leads", method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Smartlead> allPhones() 
	{
		return smartleadService.getAll();
	}
	
	
	@RequestMapping(value="/all-leads", method=RequestMethod.GET)
	public ModelAndView allPhonesPage() {
		ModelAndView mav = new ModelAndView("user/all-leads");		
		List<Smartlead> smartleads = new ArrayList<Smartlead>();
		smartleads.addAll(allPhones());
		mav.addObject("smartleads", smartleads);
		return mav;
	}
}
