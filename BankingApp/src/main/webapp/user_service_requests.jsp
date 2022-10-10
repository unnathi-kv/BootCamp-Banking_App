<!DOCTYPE html>
<%@page import="com.test.Utils"%>
<%@page import="java.sql.ResultSet"%>
<html>
<head>
<meta charset="UTF-8">
<title>My Info</title>
<link rel="stylesheet" href="style/withdraw_style.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/accordian.pack.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/02797c332f.js" crossorigin="anonymous"></script>
</head>

<body>
<div id="logo"><p>SVT Finances.</p></div>
<div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight"></div>

<div id="basic-accordian">
<div id="test-header" class="accordion_headings header_highlight">Service Requests</div>
	  <div id="test-content">
      <div class="accordion_child">
              <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc ligula nisl, egestas non, pharetra vel, scelerisque accumsan, lacus</p>
      
      			<table align="center" cellpadding="15" border="1" style="background-color: ffffcc;">
			    <tr>
				    <th>Username</th>
				    <th>Account No</th>
				    <th>Service Request</th>
				    <th>Status</th>
				    
			    </tr>
			      <% 
			      try
					{
			    	  	
						String sql2 = "select * from insurance where user_name = '"+session.getAttribute("user_name")+"' ";
						ResultSet rs2 = Utils.getStatement().executeQuery(sql2);			
						// System.out.println(flag1);
						while(rs2.next())
						{
						%>
									 <tr>			      
									    <td ><%=rs2.getString("user_name")%></td>
									    <td ><%=rs2.getString("acc_no")%></td>
									    <td>Request for <%=rs2.getString("loan_type")%> for applicant <%=rs2.getString("applicant_name")%></td>
									    <td><%=rs2.getString("status") %></td>					 
				   					 </tr>
						<%	
					   }
							
						
					}
									
					catch(Exception e)
				      {
								e.printStackTrace();
				      }
			      	      
			      %>
			     
			      </table>
      
      
      
      
      
      </div>
      </div>
      <div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
<a href="health-insurance.jsp"> 
 <input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color:   black;" value=" Back">
    </a>
  	
 	</div> 
   </div>
</body>