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
<div id="test-header" class="accordion_headings header_highlight">Delete Users</div>
	  <div id="test-content">
      <div class="accordion_child">
             
      			<table align="center" cellpadding="15" border="1" style="background-color: ffffcc;">
			    <tr>
				    <th>Username</th>
				    <th>Account No</th>
				    <th>Service Request</th>
				    <th>Proceed</th>
				    <th>Status</th>
				    
			    </tr>
			      <% 
			      try
					{
			    	  	Utils utils = new Utils();
			      		String sql1 = "select * from services where services.acc_no in (select acc_no from delete_users)";
						ResultSet rs1 = Utils.getStatement().executeQuery(sql1);
						
						String sql3 = "select * from delete_users";
						ResultSet rs3 = Utils.getStatement().executeQuery(sql3);
						
						while(rs1.next())
						{
							boolean flag = rs1.getBoolean(3);
							boolean flag1 = rs1.getBoolean(4);
							
							if(flag)
							{	
								// System.out.println(flag);
								while(rs3.next())
								{
					%>
								 <tr>			      
								    <td ><%=rs3.getString("user_name")%></td>
								    <td ><%=rs3.getString("acc_no")%></td>
								    <td>Delete account</td>
								    <td ><a href='DeleteUser?accNo=<%=rs3.getInt("acc_no")%>'> PROCEED </a></td>	
								   	<td><%=rs3.getString("status")%>			 
			   					 </tr>
					<%	
							}
							}
						
						}
						
						
						}
							catch(Exception e )
				      {
								e.printStackTrace();
				      }
			      	      
			      %>
			     
			      </table>
      
      
      
      
      
      </div>
      </div>
      <div id="test-header" style="height: 25px; background-color : #444;" class="accordion_headings header_highlight">
<a href="admin_page.html"> 
 <input type="button" style="float: right; background-color :#06D4EC;  font-family:'poppins',sans-serif ;
    font-size: 15px; color:   black;" value=" Back">
    </a>
  	
 	</div> 
   </div>
</body>