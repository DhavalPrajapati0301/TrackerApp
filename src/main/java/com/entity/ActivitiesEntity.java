	package com.entity;
	
	import java.util.UUID;
	
	
	import jakarta.persistence.Entity;
	import jakarta.persistence.GeneratedValue;
	import jakarta.persistence.GenerationType;
	import jakarta.persistence.Id;
	import jakarta.persistence.JoinColumn;
	import jakarta.persistence.ManyToOne;
	import jakarta.persistence.Table;
	import lombok.Data;
	
	@Entity
	@Table(name="activities")
	@Data
	public class ActivitiesEntity {
	
		@Id
		@GeneratedValue(strategy = GenerationType.UUID)
		UUID activityId;
		String activityName;
		String countable;
		
		@ManyToOne
		@JoinColumn(name="userId")
		UserEntity users;
	}
