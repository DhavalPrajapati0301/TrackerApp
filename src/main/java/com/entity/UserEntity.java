package com.entity;

import java.util.List;
import java.util.UUID;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name="users")
@Data
public class UserEntity {

		@Id
		@GeneratedValue(strategy = GenerationType.UUID)
		private UUID userId;
		private String firstName;
	    private String lastName;
	    
	    @Column(unique = true, nullable = false)
	    private String email;

	    private String role;	
	    private String password;
	    private String gender;
	    
	    @OneToMany
	    @JoinColumn(name="userId")
	    List<MemberEntity> members;
	    
}
