package com.dkprojects.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dkprojects.entity.User;
import com.dkprojects.repository.UserRepository;

@Service
public class UserDetailsService {
	
	@Autowired
	private UserRepository userRepo;
	
	public User findUser(User user) {
		
		return userRepo.findByUserNameAndPassword(user.getUserName(), user.getPassword());
	}
	
}
