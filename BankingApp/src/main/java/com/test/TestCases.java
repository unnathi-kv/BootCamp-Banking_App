package com.test;

import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;
import org.junit.jupiter.api.Test;
import com.exceptions.*;


public class TestCases {
	
	@Test
	public void checkPasswordTest() {
		Exception e = assertThrows(CheckPassword.class, () ->
			Validations.checkPassword("qwerty","qwert")
		);
		
		String expectedMessage = "Please re enter your password correctly!!";
		String actualMessage = e.getMessage();
		assertTrue(expectedMessage.contains(actualMessage));
	}
	@Test
	public void checkPhonenoTest() {
		Exception e = assertThrows(CheckPhoneno.class, () ->
			Validations.checkPhoneno("12345678900")
		);
		
		String expectedMessage = "Phone number should be of 10 digits.";
		String actualMessage = e.getMessage();
		assertTrue(expectedMessage.contains(actualMessage));
	}
	@Test
	public void checkAadharnoTest() {
		Exception e = assertThrows(CheckAadharNo.class, () ->
			Validations.checkAadharno("1234567890012")
		);
		
		String expectedMessage = "Aadhar card number is incorrect. Please check and enter a valid one!!";
		String actualMessage = e.getMessage();
		assertTrue(expectedMessage.contains(actualMessage));
	}
	
	@Test
	public void checkMinBalanceTest() {
		Exception e = assertThrows(CheckMinBalance.class, () ->
			Validations.checkMinBalance(1500)
		);
		
		String expectedMessage = "Minimum balance should be 2000.";
		String actualMessage = e.getMessage();
		assertTrue(expectedMessage.contains(actualMessage));
	}

}
