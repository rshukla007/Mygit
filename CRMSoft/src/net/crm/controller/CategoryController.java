package net.crm.controller;

import java.util.HashMap;  
import java.util.List;  
import java.util.Map;  
  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;  
import org.springframework.validation.BindingResult;  
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
import org.springframework.web.servlet.ModelAndView;  
  
import net.crm.model.CategoryBean;  
import net.crm.service.CategoryService;  
  
/** 
 * @author Dinesh Rajput 
 * 
 */  
@Controller  
public class CategoryController {  
   
 @Autowired  
 private CategoryService categoryService;  
   
 @RequestMapping(value = "/user/saveCategory", method = RequestMethod.POST)  
 public ModelAndView saveEmployee(@ModelAttribute("command") CategoryBean category, BindingResult result) 
 {  
  categoryService.addCategory(category);  
  return new ModelAndView("redirect:/forms/user/addCategory.html");  
 }  
   
 @RequestMapping(value = "/user/addCategory", method = RequestMethod.GET)  
 public ModelAndView addCategory(@ModelAttribute("command")  CategoryBean category, BindingResult result) {  
  Map<String, Object> model = new HashMap<String, Object>();  
  model.put("categories",  categoryService.getCategories());  
  return new ModelAndView("/user/addCategory", model);  
 }  
   
 @RequestMapping(value = "/user/deleteCategory", method = RequestMethod.GET)  
 public ModelAndView deleteCategory(@ModelAttribute("command")  CategoryBean category, BindingResult result) {  
  categoryService.deleteCategory(category.getCategoryId());  
  Map<String, Object> model = new HashMap<String, Object>();  
  model.put("categories",  categoryService.getCategories());  
  return new ModelAndView("/user/addCategory", model);  
 }  
   
 @RequestMapping(value = "/user/editCategory", method = RequestMethod.GET)  
 public ModelAndView editCategory(@ModelAttribute("command")  CategoryBean category,  BindingResult result) {  
  Map<String, Object> model = new HashMap<String, Object>();  
  model.put("category",  categoryService.getCategory(category.getCategoryId()));  
  model.put("categories",  categoryService.getCategories());  
  return new ModelAndView("/user/addCategory", model);  
 }  
   
 @RequestMapping(value="/user/categories", method = RequestMethod.GET)  
 public List<CategoryBean> getCategories() 
 {  
  return categoryService.getCategories();  
 }  
}   