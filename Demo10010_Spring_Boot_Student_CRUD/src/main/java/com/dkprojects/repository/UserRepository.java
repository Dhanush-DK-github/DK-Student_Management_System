package com.dkprojects.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dkprojects.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByUserName(String userName);
	
	User findByUserNameAndPassword(String userName, String password);
	
	public boolean existsByUserNameAndPassword(String userName, String password);
	
}
