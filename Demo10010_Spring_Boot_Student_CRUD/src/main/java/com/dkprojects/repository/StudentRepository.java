package com.dkprojects.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dkprojects.entity.Student;

@Repository
@Transactional
@Component
public interface StudentRepository extends JpaRepository<Student, Integer> {
	
	@Modifying
	@Query(value="ALTER TABLE student AUTO_INCREMENT=1000", nativeQuery=true)
	void alterStudentIdValues();
	
	@Modifying
	@Query(value="ALTER TABLE student_address AUTO_INCREMENT=100", nativeQuery=true)
	void alterStudentAddressIdValues();
}
