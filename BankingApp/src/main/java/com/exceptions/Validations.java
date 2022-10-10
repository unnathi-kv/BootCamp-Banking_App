package com.exceptions;

public class Validations {
public static void checkPassword(String p, String cp) throws CheckPassword
{
	if(!(p.equals(cp)))
	{
		throw new CheckPassword("Please re enter your password correctly!!");
	}
}
	
public static void checkPhoneno(String phoneno) throws CheckPhoneno
{
	if(phoneno.length()>10||phoneno.length()<10)
	{
		throw new CheckPhoneno("Phone number should be of 10 digits.");
	}
}
public static void checkAadharno(String aadharno) throws CheckAadharNo
{
	if(aadharno.length()>12)
	{
		throw new CheckAadharNo("Aadhar card number is incorrect. Please check and enter a valid one!!");
	}
}
public static void checkMinBalance(double amount) throws CheckMinBalance
{
	if(amount<2000)
	{
		throw new CheckMinBalance("Minimum balance should be 2000.");
	}
}
}

