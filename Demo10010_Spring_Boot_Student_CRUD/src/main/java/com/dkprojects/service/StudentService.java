package com.dkprojects.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.dkprojects.entity.Address;
import com.dkprojects.entity.Student;
import com.dkprojects.repository.StudentRepository;

@Service
@Component
public class StudentService {

	@Autowired
	private StudentRepository studRepo;
	
	public List<Student> getAllStudents(){
		
		return studRepo.findAll();
	}
	
	public Integer createNewStudentAndAddress(Student stud, Address addr) {
		
		stud.setAddress(addr);
		
		Student newStudent = studRepo.save(stud);
		
		if(newStudent!=null) {
			return newStudent.getId();
		}
		else
			return null;
	}

	public Student getStudent(Long id) {
		
		return studRepo.findById(id.intValue()).get();
	}
	
	public Integer updateStudentAndAddress(Student stud) {
		
		Student existingStudent = studRepo.save(stud);
		
		if(existingStudent!=null) {
			return existingStudent.getId();
		}
		else
			return null;
	}

	public String deleteStudent(Long id) {
		
		Student stud = getStudent(id);
		if(stud!=null) {
			studRepo.delete(stud);
			studRepo.alterStudentIdValues();
			studRepo.alterStudentAddressIdValues();
			return "Student ID:"+id+" deleted successfully";
		}
		
		return null;
	}

	
}
