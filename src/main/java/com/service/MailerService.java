package com.service;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.entity.UserEntity;

import jakarta.mail.internet.MimeMessage;

@Service
public class MailerService {

	@Autowired
	JavaMailSender mailSender;
	
	public void sendWelcomeMail(UserEntity entity)
	{
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(entity.getEmail());
			helper.setSubject("🎉 Welcome to CampusCare!");

			ClassPathResource resource = new ClassPathResource("templates/welcome.html");

			String template = Files.readString(resource.getFile().toPath(), StandardCharsets.UTF_8);
		
			template  = template.replace("{{name}}", entity.getFirstName());
			template  = template.replace("{{gender}}", entity.getGender());
			
			helper.setText(template, true);

			mailSender.send(message);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void sendOtpForForgetPassword(String otp, String email,String firstName) {

		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(email);
			helper.setSubject("Tracker App : Reset Password OTP ");

			ClassPathResource resource = new ClassPathResource("templates/forgetpassword.html");
			
			String template = Files.readString(resource.getFile().toPath(), StandardCharsets.UTF_8);
		
			template  = template.replace("{{otp_code}}", otp);
			/* template = template.replace("{{name}}", firstName); */
			helper.setText(template, true);

			mailSender.send(message);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	
	
}
