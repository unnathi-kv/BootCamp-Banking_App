package com.exceptions;

@SuppressWarnings("serial")
public class CheckPassword  extends Exception{
	
	public CheckPassword(String msg)
	{
		super(msg);
	}
}
