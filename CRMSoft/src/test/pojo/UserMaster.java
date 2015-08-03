package test.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import net.crm.model.Person;
import net.crm.model.User;

public class UserMaster
{
	public List<User> getUsers() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
    	List<User> personmaster = new ArrayList<User>();
    	Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();		
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmsoft","root", "root");
  	    Statement statement = connection.createStatement();
  	    ResultSet rs = statement.executeQuery("select * from user");
  	    while (rs.next()) 
	    {
  	      User pmaster = new User();
  	      pmaster.setUserId(rs.getLong("user_id"));
  	      personmaster.add(pmaster);
	    }      
        return personmaster;
    }
	
	 public List<User> getPagedUsers(int pageNo, int recordOffset) 
	    {
	    	  List<User> personmaster = new ArrayList<User>();
	    	  try 
	    	  {
	            Connection connection = null;
	            Class.forName("com.mysql.jdbc.Driver").newInstance();
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmsoft","root", "root");
	    	    Statement statement = connection.createStatement();
	    	    int j = 0;
	            int no = pageNo;
	            if (no == 1)
	            {
	                j = 1;
	            } 
	            else 
	            {
	                if (recordOffset == 30) {
	                    j = ((no - 1) * 30) + 1;
	                } else if (recordOffset == 20) {
	                    j = ((no - 1) * 20) + 1;
	                } else {
	                    j = ((no - 1) * 10) + 1;
	                }
	            }            
	          
	            int pcount = j-1;
	            int rcount = (j-1)+recordOffset;
	    	    
	    	    ResultSet rs = statement.executeQuery("select * from user where user_id between '"+ pcount + "' and '"+ rcount + "' ");
	    	    
	    	    while (rs.next()) 
	    	    {
	    	    	User pmaster = new User();
		    	    pmaster.setUserId(rs.getLong("user_id"));
		    	    pmaster.setUserName(rs.getString("user_name"));
		    	    pmaster.setUserEmail(rs.getString("user_email"));
		    	    pmaster.setUserGender(rs.getString("gender"));
		    	    pmaster.setPhoneNo(rs.getString("phone_no"));
		    	    pmaster.setAddress(rs.getString("address"));
		    	    personmaster.add(pmaster);
	    	    }    	    
	    	  } catch (SQLException e) {
	    	   e.printStackTrace();
	    	  } catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	   	  return personmaster;
	}
}
