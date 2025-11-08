package com.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.ActivitiesLogEntity;

public interface ActivitiesLogRepository extends JpaRepository<ActivitiesLogEntity, UUID> {

}
