package net.crm.controller;

import net.crm.model.Person;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class SpringMVCController {
    
	@RequestMapping(value="/user/UploadForm",method = RequestMethod.GET)
    public String uploadWelcome(ModelMap model) {
        return "/user/UploadForm";
    }
	
    @RequestMapping(value="/person/angularJSweb",method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        return "/person/angularJS";
    }
 
    @RequestMapping(value="/person/angularJSwebx",method = RequestMethod.GET)
    public Person showelcome(ModelMap model) {
    	 Person person = new Person();
         person.setName("Java");
         person.setAge(20);
         return person;
    }
    
   @RequestMapping(value="/person/springAngularJS", method=RequestMethod.GET,produces={"application/xml", "application/json"})
   //@RequestMapping(value="/person/springAngularJS", method=RequestMethod.GET,headers="Accept=application/json")
   // @RequestMapping(value="/person/springAngularJS", method=RequestMethod.GET)
    public @ResponseBody Person  getPerson() {      
        Person person = new Person();
        person.setName("Java");
        person.setAge(20);
        return person;
    }
}

