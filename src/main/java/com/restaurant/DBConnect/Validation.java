package com.restaurant.DBConnect;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
	public static boolean isValid(String s) 
	{ 
	      
	   
	    Pattern p = Pattern.compile("(0/91)?[7-9][0-9]{9}"); 
	  
	  
	    Matcher m = p.matcher(s); 
	    return (m.find() && m.group().equals(s)); 
	} 
	public static boolean isName(String val) {

		String name = "^[A-Za-z ]*$";
		/*
		 * if (isNotNull(val)) { return val.matches(name);
		 * 
		 * } else { return false; }
		 */
		if (val.matches(name)) {
			return true;
		} else {
			return false;
		}
	}
	
	
	public static boolean isValidNumber(String s) 
	{ 
	      
	   
	    Pattern p = Pattern.compile("[0-9]{2}"); 
	  
	  
	    Matcher m = p.matcher(s); 
	    return (m.find() && m.group().equals(s)); 
	}
	
	public static boolean isValidUsername(String s) 
	{ 
	      System.out.println("inside uername validator");
	   
	    Pattern p = Pattern.compile("[A-Z][a-z]"); 
	  
	    
	    Matcher m = p.matcher(s); 
	    return (m.find() && m.group().equals(s)); 
	} 
	public static boolean isValidEmail(String email) 
    { 
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
                            "[a-zA-Z0-9_+&*-]+)*@" + 
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
                            "A-Z]{2,7}$"; 
                              
        Pattern pat = Pattern.compile(emailRegex); 
        if (email == null) 
            return false; 
        return pat.matcher(email).matches(); 
    }
}
