package com.test;

public class UserDetails {
	private String username;
	private String email;
	private String password;
	private String fname;
	private String lname;
	private String phoneno;
	private String address;
	private String aadharno;
	private String upi;
	private String acc_type;
	private String cardno;
	private String acc_no;
	private String repassword;
	private String gender;
	private double amount;
	
	public UserDetails()
	{
		
	}
	
	public UserDetails(String username,String email,String password,String fname,
			String lname,String phoneno,String address, String acc_type,
		String repassword,String gender,double amount,String aadharno,String upi)
	{
		this.username=username;
		this.email=email;
		this.password=password;
		this.fname=fname;
		this.lname=lname;
		this.phoneno=phoneno;
		this.address=address;
		this.acc_type=acc_type;
		this.repassword=repassword;
		this.gender=gender;
		this.amount=amount;
		this.aadharno=aadharno;
		this.upi = upi;
	}
	
	
	
	
	
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAadharno() {
		return aadharno;
	}
	public void setAadharno(String aadharno) {
		this.aadharno = aadharno;
	}
	public String getUpi() {
		return upi;
	}
	public void setUpi(String upi) {
		this.upi = upi;
	}
	public String getAcc_type() {
		return acc_type;
	}
	public void setAcc_type(String acc_type) {
		this.acc_type = acc_type;
	}
	public String getCardno() {
		return cardno;
	}
	public void setCardno(String cardno) {
		this.cardno = cardno;
	}
	public String getAcc_no() {
		return acc_no;
	}
	public void setAcc_no(String acc_no) {
		this.acc_no = acc_no;
	}
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

}
