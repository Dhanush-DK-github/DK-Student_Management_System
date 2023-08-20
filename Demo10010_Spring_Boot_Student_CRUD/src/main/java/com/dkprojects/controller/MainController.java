package com.dkprojects.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dkprojects.entity.Address;
import com.dkprojects.entity.Student;
import com.dkprojects.entity.User;
import com.dkprojects.service.StudentService;
import com.dkprojects.service.UserDetailsService;

@Controller
public class MainController {
	
	@Autowired
	public StudentService studService;
	@Autowired
	public UserDetailsService userService;
	
	@RequestMapping(value={"/", "/home"})
	public String showHomePage() {
		return "home";
	}
	
	@GetMapping("/listStudents")
	public String showListStudentsPage(Model model, @ModelAttribute("message") String message) {
		
		model.addAttribute("students", studService.getAllStudents());
		model.addAttribute("message", message);
		
		return "list";
	}
	
	@GetMapping("/newStudent")
	public String showRegistrationPage(Model model) {
		
		model.addAttribute("student", new Student());
		model.addAttribute("address", new Address());
		
		return "registration";
	}
	
	@PostMapping("/register")
	public String createNewStudent(@ModelAttribute("student") Student stud, @ModelAttribute("address") Address addr, RedirectAttributes redirectAttr) {
		
		Integer id = studService.createNewStudentAndAddress(stud, addr);
		
		if(id!=null) {
			redirectAttr.addFlashAttribute("message", "Student ID:"+id+" registered successfully");
		}
		else {
			redirectAttr.addFlashAttribute("message", "Something went wrong");
		}
		
		return "redirect:/listStudents";
	}
	
	@GetMapping("/viewStudent/{id}")
	public String showViewStudentPage(@PathVariable Long id, Model model, RedirectAttributes redirectAttr){

		Student stud = studService.getStudent(id);
		
		if(stud!=null) {
			model.addAttribute("student", stud);
			model.addAttribute("address", stud.getAddress());
			return "detail";
		}
		else {
			redirectAttr.addFlashAttribute("message", "Error: Student ID:"+id+" does not exists or already deleted");
			return "redirect:/listStudents";
		}
	}
	
	@GetMapping("/editStudent/{id}")
	public String showEditStudentPage(@PathVariable Long id, Model model, HttpSession session, RedirectAttributes redirectAttr){

		if(session.getAttribute("userName")!=null) {
			
			Student student = studService.getStudent(id);
			
			if(student!=null) {
				model.addAttribute("student", student);
				session.setAttribute("existingStudent", student);
				return "edit";
			}
			else {
				redirectAttr.addFlashAttribute("message", "Error: Student ID:"+id+" does not exists or already deleted");
				return "redirect:/listStudents";
			}
		}
		else
			return "redirect:/login";
	}
	
	@PostMapping("/editSave")
	public String editSaveStudent(@ModelAttribute("student") Student updateStudent, HttpSession session, RedirectAttributes redirectAttr){

		System.out.println(updateStudent+"/n");
		updateStudent.setId(((Student) session.getAttribute("existingStudent")).getId());
		updateStudent.getAddress().setAddressId((((Student) session.getAttribute("existingStudent")).getAddress()).getAddressId());
		System.out.println(updateStudent+"/n");
		
		if(studService.updateStudentAndAddress(updateStudent)!=null) {
			redirectAttr.addFlashAttribute("message", "Student ID:"+updateStudent.getId()+" updated successfully");
		}
		else {
			redirectAttr.addFlashAttribute("message", "Something went wrong");
		}
		return "redirect:/listStudents";
	}
	
	@GetMapping("/deleteStudent/{id}")
	public String deleteStudent(@PathVariable Long id, Model model, HttpSession session, RedirectAttributes redirectAttr){
		
		if(session.getAttribute("userName")!=null) {
			
			String str = studService.deleteStudent(id);
			System.out.println(str);
			
			if(str!=null) 
				redirectAttr.addFlashAttribute("message", str);
			else
				redirectAttr.addFlashAttribute("message", "Error: Student ID:"+id+" does not exists or already deleted");
			
			return "redirect:/listStudents";
		}
		else
			return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String getLoginPage(Model model) {
		
		model.addAttribute("user", new User());
		
		return "login";
	}
	
	@PostMapping("/process-login")
	public String checkUser(@ModelAttribute("user")User user, HttpSession session, RedirectAttributes redAttributes) {
		
		User userExists = userService.findUser(user);
		
		if(userExists!=null) {
			
			session.setAttribute("userName", userExists.getUserName());
			session.setMaxInactiveInterval(60);
			
			return "redirect:/listStudents";
		}
		
		redAttributes.addFlashAttribute("message", "Invalid Username and Password");
		
		return "redirect:/login";
	}

}
