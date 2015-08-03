package net.crm.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import net.crm.model.User;


@Controller
@RequestMapping("/user/crmpanel")
public class crmpanelcontroller 
{
		//@Autowired
		//private LanguageService languageService;

		@RequestMapping(method = RequestMethod.GET)
		public String showSelectPaper(Map model, HttpSession session) {
			if ((session.getAttribute("userEmail")) == null)
			{
				User user = new User();
				model.put("user", user);
				return "/user/userlogin";				
			}
			//Language language = new Language();
			//model.put("language", language);
			//model.put("languagelist", languageService.listLanguages());
			return "/user/crmpanel";
		}
	}