package net.crm.model;

import javax.persistence.Column;  
import javax.persistence.Entity;  
import javax.persistence.GeneratedValue;  
import javax.persistence.GenerationType;  
import javax.persistence.Id;  
import javax.persistence.Table;  
  
@Entity  
@Table(name="Category")  
public class CategoryBean {  
   
 @Id  
 @Column(name="categoryId")  
 @GeneratedValue(strategy=GenerationType.AUTO)  
 private Integer categoryId;  
   
 @Column(name="categoryName")  
 private String categoryName;  
  
 public Integer getCategoryId() {  
  return categoryId;  
 }  
  
 public void setCategoryId(Integer categoryId) {  
  this.categoryId = categoryId;  
 }  
  
 public String getCategoryName() {  
  return categoryName;  
 }  
  
 public void setCategoryName(String categoryName) {  
  this.categoryName = categoryName;  
 }  
}  