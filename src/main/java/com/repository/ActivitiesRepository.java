package com.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.ActivitiesEntity;

public interface ActivitiesRepository extends JpaRepository<ActivitiesEntity, UUID>{

}
