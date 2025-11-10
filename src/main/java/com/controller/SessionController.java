package com.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.entity.UserEntity;
import com.repository.UserRepository;
import com.service.MailerService;
import com.service.OtpGenratorService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {
    
	@Autowired
	OtpGenratorService otpService;
	
    @Autowired
    UserRepository userRepository;
    
    @Autowired
    MailerService mailerService;
    
    @Autowired
    PasswordEncoder passwordEncoder;
    
    @Autowired
    Cloudinary cloudinary;
    
    @GetMapping("/")
    public String root()
    {
    	return "Welcome";
    }
    
 
    @GetMapping("signup")
    public String signup() {
        return "Signup";	
    }
    
    @PostMapping("saveuser")
    public String saveUser(UserEntity entity,MultipartFile profilePic , Model model) {
        
    	String epwd  = passwordEncoder.encode(entity.getPassword());
		entity.setPassword(epwd);
        
//        mailerService.sendWelcomeMail(entity);
		try {
		Map map = 	cloudinary.uploader().upload(profilePic.getBytes(), 
					ObjectUtils.asMap("resource_type", "auto"));
				String profilePicUrl  = map.get("secure_url").toString();

				entity.setProfilePicUrl(profilePicUrl);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		userRepository.save(entity);
		
        return "Login"; 
    }
    
    
    @GetMapping("login")
    public String login() {
        return "Login";
    }
    @PostMapping("authenticate")
    public String authenticate(String email, String password, HttpSession session, Model model) {
        Optional<UserEntity> op = userRepository.findByEmail(email);
        
        if (op.isPresent()) {
            UserEntity user = op.get();

            // ✅ Correct way to check encoded password
            if (passwordEncoder.matches(password, user.getPassword())) {
                // Store user in session
                session.setAttribute("user", user);
                return "Dashboard";
            } else {
                // Wrong password
                session.setAttribute("user", user);
                model.addAttribute("error", "Invalid password");
                return "Login";
            }
        } else {
            // User not found
            model.addAttribute("error", "User not found");
            return "Login";
        }       
    }
    
    @GetMapping("logout")
    public String logout(HttpSession session)
    {
    	session.invalidate();
    	return "Login";
    }
    
    @GetMapping("forgetpassword")
	public String ForgetPassword()
	{
		return "ForgetPassword";
	}
	
	@PostMapping("sendotp")
	public String sendOtp(String email,Model model,HttpSession session,String firstName)
	{
		Optional<UserEntity> op =  userRepository.findByEmail(email);
		
		if(op == null)
		{
			model.addAttribute("error","Invalid Email");
			return "ForgetPassword";
		}
		else
		{
			String otp =otpService.genrateOtp(6);
			
			session.setAttribute("otp", otp);
			session.setAttribute("email", email);
			
			Thread t = new Thread(new Runnable() {
				
				@Override
				public void run() {
					// TODO Auto-generated method stub
					mailerService.sendOtpForForgetPassword(otp, email,firstName);	
				}
			});
			t.start();
			return "ChangePassword";
		}
	}
	
	@GetMapping("listusers")
    public String listUser(Model model)
    {
    	List<UserEntity> users = userRepository.findAll();
    	System.out.println(users);
    	model.addAttribute("users",users);
    	return "ListUser";
    }
    
    @GetMapping("viewuser")
    public String viewUser(@RequestParam("userId") UUID userId, Model model) {
        Optional<UserEntity> op = userRepository.findById(userId);
        if (op.isPresent()) {
            model.addAttribute("user", op.get());
            return "ViewUser";
        } else {
            model.addAttribute("error", "User not found");
            return "ListUser";
        }
    }
	
    @GetMapping("deleteuser")
    public String deleteUser(@RequestParam("userId") UUID userId, Model model) {
        userRepository.deleteById(userId);
        model.addAttribute("msg", "User deleted successfully");

        List<UserEntity> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "ListUser";
    }
	/*
	 * @PostMapping("changepassword") public String changePasssword(String otp ,
	 * String password, HttpSession session, Model model) {
	 * 
	 * String email = (String) session.getAttribute("email"); String originalOtp =
	 * (String) session.getAttribute("otp");
	 * 
	 * if (originalOtp != null && originalOtp.equals(otp)) {
	 * 
	 * // Encode the new password String encPassword =
	 * passwordEncoder.encode(password);
	 * 
	 * 
	 * 
	 * model.addAttribute("msg",
	 * "Password changed successfully. Please login again."); return "Login"; } else
	 * { model.addAttribute("error", "Invalid OTP. Please try again."); return
	 * "ChangePassword"; } }
	 */
}