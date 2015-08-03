package net.crm.dao.daoImpl;

import java.util.List;  

import net.crm.dao.CategoryDao;
import net.crm.model.CategoryBean;

import org.hibernate.SessionFactory;  
import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Repository;  
  
  
/** 
 * @author 
 * 
 */  
  
@Repository("categoryDao")  
public class CategoryDaoImpl implements CategoryDao {  
   
 @Autowired  
 private SessionFactory sessionFactory;  
   
 @Override  
 public void addCategory(CategoryBean categoryBean) {  
  sessionFactory.getCurrentSession().saveOrUpdate(categoryBean);  
 }  
  
 @SuppressWarnings("unchecked")  
 @Override  
 public List<CategoryBean> getCategories() {  
  return (List<CategoryBean>) sessionFactory.getCurrentSession().createCriteria(CategoryBean.class).list();  
 }  
  
 @Override  
 public CategoryBean getCategory(int categoryId) {  
  return (CategoryBean) sessionFactory.getCurrentSession().get(CategoryBean.class, categoryId);  
 }  
  
 @Override  
 public void deleteCategory(int categoryId) {  
  sessionFactory.getCurrentSession().createQuery("DELETE FROM CategoryBean WHERE categoryId = "+categoryId).executeUpdate();  
 }  
  
}  