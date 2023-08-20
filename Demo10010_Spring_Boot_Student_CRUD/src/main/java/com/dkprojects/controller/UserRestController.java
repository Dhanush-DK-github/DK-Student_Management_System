package com.dkprojects.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dkprojects.entity.User;
import com.dkprojects.repository.UserRepository;

@RestController
@RequestMapping(value = "/dk-sms_users")
public class UserRestController {
	
	@Autowired
	public UserRepository userRepo;
	public String message;
	
	@PostMapping("/saveUser")
	public String saveUser(@RequestBody User user) {
		
		User userExists = userRepo.findByUserNameAndPassword(user.getUserName(), user.getPassword());
		
		if(userExists==null) {
		   userRepo.save(user);
		   message="User saved successfully.";
		}
		else
			message="User already exists.";
		
		return message;
		
	}
	
	@GetMapping("/getUsers")
	public List<User> getUsers() {
		
		return userRepo.findAll();
		
	}
	
	@GetMapping("/getUser/{id}")
	public User getUser(@PathVariable Long id) {
		
		return userRepo.findById(id).get();	
	}
	
	@PutMapping("/updateUser")
	public String updateUser(@RequestBody User user) {
		
		User userExists = userRepo.findById(user.getId()).get();
		
		if(userExists!=null) {
			
			User userExistsWithUnameAndPass = userRepo.findByUserNameAndPassword(user.getUserName(), user.getPassword());
			
			if(userExistsWithUnameAndPass==null) {
				userRepo.save(user);
				message = "User updated Successfully.";
			}
			else {
				message = "Username and password already exists.";
			}
		}
		else
			message = "User not exists.";
		
		return message;
	}
	
	@DeleteMapping("/deleteUser/{id}")
	public String deleteUser(@PathVariable Long id) {
		
		User userExists = userRepo.findById(id).get();
		
		if(userExists!=null) {
			userRepo.delete(userExists);
			message = "User Deleted Successfully.";
		}
		else
			message = "User not exists.";
		
		return message;
	}
	
}
