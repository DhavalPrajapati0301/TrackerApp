package com.entity;

import java.time.LocalDateTime;
import java.util.UUID;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name="activities_log")
@Data
public class ActivitiesLogEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.UUID)
	UUID activityLogId;	
	String countable;
	String notes;	
	LocalDateTime logDateTime;
	
	@ManyToOne
	@JoinColumn(name="memberId")
	MemberEntity member;
	
	@ManyToOne
	@JoinColumn(name="activityId")
	ActivitiesEntity activity;
	
}
