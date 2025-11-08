package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.ActivitiesEntity;
import com.repository.ActivitiesRepository;

@Controller
public class MemberController {

		
		@Autowired
		ActivitiesRepository activitiesRepository;
		
	
		@GetMapping("members")
		public String members()
		{
			return "AddMembers";
		}
		
		@GetMapping("activity")
		public String activity()
		{
			return "AddActivity";
		}
		
		@PostMapping("saveactivity")
		public String saveActivity(ActivitiesEntity entity)
		{
			activitiesRepository.save(entity);
			return "Dashboard";
		}
		
		
		
		@GetMapping("activitylog")
		public String activityLog()
		{
			return "AddActivityLog";
		}
		
}
