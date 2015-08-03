package net.crm.controller;
import net.crm.exception.EmployeeException;
import net.crm.model.Employee;

import org.springframework.stereotype.Controller;  
import org.springframework.ui.ModelMap;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.servlet.ModelAndView;  
//import com.dineshonjava.emp.exception.EmployeeException;  
  
/** 
 * @author Ravi 
 * 
 */  
@Controller  
public class EmployeeController
{  
   
 @RequestMapping(value = "/emp/employee", method = RequestMethod.GET)  
 public ModelAndView employee() {  
  return new ModelAndView("/emp/employeeForm", "command", new Employee());  
 }  
      
 @RequestMapping(value = "/emp/addEmployee", method = RequestMethod.POST)  
 public String addEmployee(@ModelAttribute("SpringWeb")Employee employee, ModelMap model) {  
    
      if(employee.getName().length() < 5 )
      {  
         throw new EmployeeException("Given name is too short");  
      }
      else
      {  
         model.addAttribute("name", employee.getEmpId());  
      }  
     if( employee.getAge() < 10 )
     {  
        throw new EmployeeException("Given age is too low");  
     }
     else
     {  
        model.addAttribute("age", employee.getAge());  
     }  
     model.addAttribute("empId", employee.getEmpId());  
     model.addAttribute("salary", employee.getSalary());  
     return "/emp/employeeDetail";  
 }  
}  