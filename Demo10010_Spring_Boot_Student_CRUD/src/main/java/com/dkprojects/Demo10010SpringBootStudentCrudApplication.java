package com.dkprojects;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
//@ComponentScan(basePackages = {"com.dkprojects", "com.dkprojects.repository","com.dkprojects.service"})
public class Demo10010SpringBootStudentCrudApplication {

	public static void main(String[] args) {
		SpringApplication.run(Demo10010SpringBootStudentCrudApplication.class, args);
		System.out.println("Hii");
	}

}
