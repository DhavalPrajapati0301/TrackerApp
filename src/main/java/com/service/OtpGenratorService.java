package com.service;

import org.springframework.stereotype.Service;

@Service
public class OtpGenratorService {

		public String genrateOtp(int length)
		{
			String seed = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890@?";
			
			String otp = "";
			
			for(int i = 1; i <=length;i++)
			{
				int x = (int) (Math.random()*seed.length());
				otp = otp + seed.charAt(x);	      
			}
			return otp;
		}
	
}
