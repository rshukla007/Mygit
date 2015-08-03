package net.crm.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.crm.model.User;
import net.crm.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/user/usermanage")
public class usermanagecontroller 
{
	@Autowired
	private UserService userService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showUserList(Map model, HttpServletRequest request,HttpSession session) {
		if (session.getAttribute("userEmail") == null) {
			User user = new User();
			model.put("user", user);
			return new ModelAndView("/user/userlogin");
		} 
		else 
		{
			List allUserList = new ArrayList();
			allUserList = userService.listUsers();
			model.put("allUserList", allUserList);
			return new ModelAndView("user/usermanage");
		}
	}
}
