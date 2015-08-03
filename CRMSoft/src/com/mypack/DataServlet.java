/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 
package com.mypack;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.crm.dao.PersonDAO;
import net.crm.model.Person;
import net.crm.model.User;
import net.crm.service.PersonService;
import test.pojo.StudentMaster;
import test.pojo.UserMaster;
 
/**
 *
 * @author TaherT
 */
public class DataServlet extends HttpServlet {
         
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        System.out.println("inside servlet again");
        
        try {
            String strPageNo = request.getParameter("pageNo");
            String styleClass = "";
            int pageNo = Integer.parseInt(strPageNo);
            System.out.println("pageNo :" + pageNo);
            String strOffset = request.getParameter("size");
            System.out.println("Off :" + strOffset);
            int recordOffset = Integer.parseInt(strOffset);           
            
            UserMaster pstudentMaster = new UserMaster();            
            List<User> pstudentMasters =  pstudentMaster.getPagedUsers(pageNo, recordOffset);

            if (!pstudentMasters.isEmpty()) {
                for (int i = 0; i < pstudentMasters.size(); i++) {
                    if(i%2==0){
                        styleClass = "bgColor-white";
                    }else{
                        styleClass = "bgColor-Green";
                    }
                    //out.print("<tr class='"+styleClass+"'>");
                    out.print("<tr>");
                    out.print("<td align=\"left\">" + ((pageNo - 1) * 10 + (i + 1)) + "</td>");
                    out.print("<td align=\"left\">" + pstudentMasters.get(i).getUserName() + "</td>");
                    out.print("<td align=\"left\">" + pstudentMasters.get(i).getUserEmail()  + "</td>");
                    out.print("<td align=\"left\">" + pstudentMasters.get(i).getUserGender() + "</td>");
                    out.print("<td align=\"left\">" + pstudentMasters.get(i).getPhoneNo() + "</td>");
                    out.print("<td align=\"left\">" + pstudentMasters.get(i).getAddress() + "</td>");
                    out.print("</tr>");
                }
            } else {
                out.print("<tr>");
                out.print("<td id=\"noRecordFound\" value=\"noRecordFound\" class=\"t-align-left\" style=\"color: red;font-weight: bold\" colspan=\"6\">No Record Found!</td>");
                out.print("</tr>");
            }
            int totalPages = 1;
            int rowCount;
            if (pstudentMasters.size() > 0) {
                
				try {
					rowCount = pstudentMaster.getUsers().size();            	   
					System.out.println("rowcount" +rowCount);
					totalPages = (int) Math.ceil(Math.ceil(rowCount)/ recordOffset);
					System.out.println("totalPages" + totalPages);
	                if (totalPages == 0) {
	                    totalPages = 1;
	                }
				} 
				catch (Exception e)
				{
					// TODO InstantiationException Auto-generated catch block
					e.printStackTrace();
				} 
				/*catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}              */
            }
            out.print("<input type=\"hidden\" id=\"totalPages\" value=\"" + totalPages + "\">");
        } 
       finally 
        { 
            out.close();
        }
    } 
 
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 
 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
 
     
    @Override
    public String getServletInfo() {
        return "Short description";
    }
 
}