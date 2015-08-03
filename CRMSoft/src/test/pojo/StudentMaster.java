/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package test.pojo;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import net.crm.model.Person;


/**
 *
 * @author TaherT
 */
public class StudentMaster {
 
    public StudentMaster() {
    }
    String stdName;
    String stdStd;
    String stdAddress;
 
    public String getStdAddress() {
        return stdAddress;
    }
 
    public void setStdAddress(String stdAddress) {
        this.stdAddress = stdAddress;
    }
 
    public String getStdName() {
        return stdName;
    }
 
    public void setStdName(String stdName) {
        this.stdName = stdName;
    }
 
    public String getStdStd() {
        return stdStd;
    }
 
    public void setStdStd(String stdStd) {
        this.stdStd = stdStd;
    }
    public List<StudentMaster> getStudents()
    {
        List<StudentMaster> list = new ArrayList<StudentMaster>();
            if (list.isEmpty()) {
            for (int i = 1; i <=5; i++) {
                list.add(new StudentMaster("Taher " + i, "10", "Ahmedabad"));
                list.add(new StudentMaster("Rishita " + i, "12", "Baroda"));
                list.add(new StudentMaster("Sanjay " + i, "12", "Kalol"));
                list.add(new StudentMaster("Parag " + i, "11", "Gandhinagar"));
                list.add(new StudentMaster("Rajesh " + i, "9", "Verawal"));
            }
        }
			return list;
    }
 
    public List<Person> getPersons() throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
        /*List<StudentMaster> list = new ArrayList<StudentMaster>();
            if (list.isEmpty()) {
            for (int i = 1; i <=5; i++) {
                list.add(new StudentMaster("Taher " + i, "10", "Ahmedabad"));
                list.add(new StudentMaster("Rishita " + i, "12", "Baroda"));
                list.add(new StudentMaster("Sanjay " + i, "12", "Kalol"));
                list.add(new StudentMaster("Parag " + i, "11", "Gandhinagar"));
                list.add(new StudentMaster("Rajesh " + i, "9", "Verawal"));
            }
        }*/
    	List<Person> personmaster = new ArrayList<Person>();
    	Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();		
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmsoft","root", "root");
  	    Statement statement = connection.createStatement();
  	    ResultSet rs = statement.executeQuery("select * from person");
  	    while (rs.next()) 
	    {
  	      Person pmaster = new Person();
  	      pmaster.setId(rs.getLong("ID"));
  	      personmaster.add(pmaster);
	    }      
        return personmaster;
    }
 
    public List<StudentMaster> getPagedStudents1(int pageNo, int recordOffset) {
        List<StudentMaster> list = getStudents();
        List<StudentMaster> list2 = new ArrayList<StudentMaster>();
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
         
        for(int i=j-1;i<(j-1)+recordOffset;i++){
            if(list.size() >i){
                list2.add(list.get(i));
            }
        }
        return list2;
    }
 
    public List<Person> getPagedStudents(int pageNo, int recordOffset) 
    {
    	  List<Person> personmaster = new ArrayList<Person>();
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
    	    
    	    ResultSet rs = statement.executeQuery("select * from person where ID between '"+ pcount + "' and '"+ rcount + "' ");
    	    
    	    while (rs.next()) 
    	    {
	    	    Person pmaster = new Person();
	    	    pmaster.setId(rs.getLong("ID"));
	    	    pmaster.setName(rs.getString("name"));
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
    	 
    
    public StudentMaster(String stdName, String stdStd, String stdAddress) {
        this.stdName = stdName;
        this.stdStd = stdStd;
        this.stdAddress = stdAddress;
    }
}