package net.crm.service;

import java.util.List;  

import net.crm.model.CategoryBean;

  
public interface CategoryService {  
   
 public void addCategory(CategoryBean categoryBean);  
   
 public List<CategoryBean> getCategories();  
   
 public CategoryBean getCategory(int categoryId);  
   
 public void deleteCategory(int categoryId);  
  
}  