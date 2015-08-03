<%@page import=" java.io.*"%> 
<%@page import=" org.apache.poi.hssf.usermodel.*"%> 
<% 
String name[]=request.getParameterValues("name"); 
String address[]=request.getParameterValues("address"); 
String contact[]=request.getParameterValues("contact"); 
String email[]=request.getParameterValues("email"); 

try{ 
String filename="c:/data.xls" ; 
HSSFWorkbook hwb=new HSSFWorkbook(); 
HSSFSheet sheet = hwb.createSheet("sheet"); 

HSSFRow rowhead= sheet.createRow((short)0); 
rowhead.createCell((short) 0).setCellValue("Name"); 
rowhead.createCell((short) 1).setCellValue("Address"); 
rowhead.createCell((short) 2).setCellValue("Contact No"); 
rowhead.createCell((short) 3).setCellValue("E-mail"); 
for(int i=0;i<name.length;i++){ 
int j=i+1; 
HSSFRow row= sheet.createRow((short)j); 
row.createCell((short) 0).setCellValue(name[i]); 
row.createCell((short) 1).setCellValue(address[i]); 
row.createCell((short) 2).setCellValue(contact[i]); 
row.createCell((short) 3).setCellValue(email[i]); 
} 
FileOutputStream fileOut = new FileOutputStream(filename); 
hwb.write(fileOut); 
fileOut.close(); 
out.println("Your excel file has been generated!"); 
} catch( Exception ex ) { 
System.out.println(ex); 
} 
%> 