package com.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, UUID>{

}
