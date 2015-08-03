package net.crm.controller;

import net.crm.service.PersonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/person")
public class PersonController {

	@Autowired
	private PersonService personService;
	
	@RequestMapping(value="/list")
	public String list(Model model, Integer offset, Integer maxResults){
		model.addAttribute("persons", personService.list(offset, maxResults));
		model.addAttribute("count", personService.count());
		model.addAttribute("offset", offset);
		return "/person/list";
	}
	
	@RequestMapping(value="/NewPage")
	public String listNewPage(Model model)
	{		
		return "/person/NewPage";
	}
	
	@RequestMapping(value="/save")
	public String save(){
		personService.save();
		return "/person/list";
	}
	
	@RequestMapping(value="/UploadForm")
	public String listUploadForm(Model model)
	{		
		return "/person/UploadForm";
	}
}
