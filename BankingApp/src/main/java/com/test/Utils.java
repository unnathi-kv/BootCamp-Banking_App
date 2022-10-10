package com.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;






public class Utils {
	public static String generateUPI(UserDetails userDetails)
	{
		String phoneno=userDetails.getPhoneno();
		String upi = phoneno+"@svt";
		return upi;
		
	}
	public static String generateCardNo()
	{
		int min = 100000;  
		int max = 999999;  
		int b = (int)(Math.random()*(max-min+1)+min); 
		
		String cardno =  Integer.toString(b);
		return cardno;
	}
	public static Statement getStatement() {
        Connection con = null;
        Statement st = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_app?autoReconnect=true&useSSL=false", "root", "password");
            st= con.createStatement();
            //return con;

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return st;
    }
	

	public  int registerUser(UserDetails userDetails) {
        String sql= null;
        try {
            sql = "INSERT INTO `user_details` (`username`, `email`, `password`, `fname`, `lname`, "
            		+ "`phoneno`, `address`, `aadharno`,`upi`, `acc_type`,`gender`,`cardno`,`amount`)"
            	 + "VALUES('"+ userDetails.getUsername() + "','" + userDetails.getEmail() + "','" + userDetails.getPassword() +
           		 "','" + userDetails.getFname() +"','" + userDetails.getLname() +"','" + userDetails.getPhoneno() +"','" + userDetails.getAddress() + 
           		"','" + userDetails.getAadharno() +"','" + userDetails.getUpi() +"','" 
           		 + userDetails.getAcc_type() +"','" + userDetails.getGender() +"','" + userDetails.getCardno() +"','" + userDetails.getAmount() +"')";
            return getStatement().executeUpdate(sql);
        }
       
        catch (Exception e)
        {
            e.printStackTrace();
            return 0;

        }
	}
  public  int updateBalance(UserDetails userDetails,String email)
  {
	  String sql=null;
	  try
	  {
		  sql="update user_details set amount = '"+userDetails.getAmount()+"' where email='"+email+"'" ;
		  return getStatement().executeUpdate(sql);
	  }
	  catch (Exception e)
      {
          e.printStackTrace();
          return 0;

      }
	  
  }
  
  public int getAccountNo(String email)
  {
	 String sql=null;
	  try
	  {
		  sql="select accno from user_details where email='"+email+"'" ;
		  return getStatement().executeUpdate(sql);
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
          return 0;
	  }
  }
	
  public  int transferAmount(UserDetails userDetails,String account_no)
  {
	  String sql=null;
	  try
	  {
		  int acc_no=Integer.parseInt(account_no);
		  sql="update user_details set amount = '"+userDetails.getAmount()+"' where acc_no='"+acc_no+"'" ;
		  return getStatement().executeUpdate(sql);
	  }
	  catch (Exception e)
      {
          e.printStackTrace();
          return 0;

      }
	  
  }
  public  int transferAmountUPI(UserDetails userDetails,String upi_id)
  {
	  String sql=null;
	  try
	  {
		  
		  sql="update user_details set amount = '"+userDetails.getAmount()+"' where upi = '"+upi_id+"' " ;
		  return getStatement().executeUpdate(sql);
	  }
	  catch (Exception e)
      {
          e.printStackTrace();
          return 0;

      }
	  
  }
  public int updateUser(UserDetails userDetails, String email) {
      try
      {
          String sql = "update user_details set address='"+userDetails.getAddress()+"',phoneno='"
      +userDetails.getPhoneno()+"',gender='"+userDetails.getGender()+"' where email='"+email+"'" ;
          return getStatement().executeUpdate(sql);
      }
      catch (Exception e)
      {
          e.printStackTrace();
          return 0;
      }
} 
  public ResultSet checkAccount(String acc_no )
  {
	  ResultSet rs=null;
	  try
	  {
		 int account_no= Integer.parseInt(acc_no);
		  String sql ="select username from user_details where acc_no = '"+account_no+"' " ;
		  rs= getStatement().executeQuery(sql);
		
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return rs;
  }
  
   
  
	
	
	
	
	
	
	
	
	
}