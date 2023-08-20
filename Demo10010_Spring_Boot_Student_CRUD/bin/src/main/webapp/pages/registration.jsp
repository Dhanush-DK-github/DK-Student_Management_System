<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link rel="stylesheet" href="/CSS/res_navStyle.css">
    <link rel="stylesheet" href="/CSS/registrationStyle.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto Slab|Roboto|Roboto Serif|Roboto Condensed">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="/Javascript/verifyBirthAndAcad.js"></script>
</head>
<body>
    <nav>
        <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="material-icons" id="icon" onclick="myFunction()">menu</i>
        </label>
        <div class="headTitle">
        <label class="title">Student Management System</label>
        </div>
        <ul>
            <li><a href="/home"><button class="home">Home</button></a></li>
            <li><a href="/newStudent"><button class="new">Add Student</button></a></li>
            <li><a href="/listStudents"><button class="list">List Students</button></a></li>
        </ul>
    </nav>

    <div class="container">
        <div class="header">
        <header>Registration</header>
        </div>
        <form:form action="register" method="post" modelAttribute="student" onsubmit="return validateForm()">
                    <div class="details personal">
                        <span class="title">Personal Details</span>

                        <div class="fields">
                            <div class="input-field">
                                <label class="required" for="fullName">Full Name</label>
                                <form:input type="text" id="fullName" name="name" placeholder="Enter Full Name with Initial" title="Ex: Dhanush Karthik M" path="${student.name}" required="required"/>

                            </div>
                            <div class="input-field">
                                <label class="required" for="DOB">Date of Birth</label>
                                <form:input type="date" id="DOB" name="dob" path="${student.dob}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="gender">Gender</label>
                                    <form:select id="gender" name="gender" path="${student.gender}" required="required">
                                        <form:option value="">Select Gender</form:option>
                                        <form:option value="Male">Male</form:option>
                                        <form:option value="Female">Female</form:option>
                                        <form:option value="Transgender">Transgender</form:option>
                                        <form:option value="Prefer not to say">Prefer not to say</form:option>
                                    </form:select>
                            </div>
                            <div class="input-field">
                                <label class="required" for="mob">Mobile No</label>
                                <form:input type="tel" id="mob" name="mobileNo" pattern="[0-9]{10}" placeholder="Enter 10 digit Mobile number" path="${student.mobileNo}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label for="email">Email Id</label>
                                <form:input type="email" id="email" path="${student.emailId}" name="emailId"/>
                            </div>
                            <div class="input-field">
                                <label for="blood">Blood Group</label>
                                <form:input type="text" id="blood" name="bloodGroup" path="${student.bloodGroup}" placeholder="Ex: A+"/>
                            </div>
                        </div>
                    </div>
                    
                    <div class="details college">
                        <span class="title">College Details</span>

                        <div class="fields">
                            <div class="input-field">
                                <label class="required" for="collegeName">College Name</label>
                                <form:input type="text" id="collegeName" name="collegeName" placeholder="Enter Full Name" path="${student.collegeName}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="branch">Branch</label>
                                <form:select id="branch" name="branch" path="${student.branch}" required="required">
                        <form:option value="">Select Branch</form:option>
                        <form:option value="Civil Engineering">Civil</form:option>
                        <form:option value="Mechanical Engineering">Mechanical</form:option>
                        <form:option value="Electrical and Electronic Engineering">EEE</form:option>
                        <form:option value="Electronics and Communication Engineering">ECE</form:option>
                        <form:option value="Computer Science Engineering">CSE</form:option>
                    </form:select>
                            </div>
                            <div class="input-field">
                                <label class="required" for="year">Year</label>
                                <form:select id="year" name="year" path="${student.year}" required="required">
                        <form:option value="">Select Year</form:option>
                        <form:option value="I">I</form:option>
                        <form:option value="II">II</form:option>
                        <form:option value="III">III</form:option>
                        <form:option value="IV">IV</form:option>
                    </form:select>
                            </div>
                            <div class="input-field">
                                <label class="required" for="acad_year">Academic Year</label>
                                <form:input type="text" id="acad_year" name="academicYear" path="${student.academicYear}" pattern="[0-9]{4}-[0-9]{4}" placeholder="Ex: 2016-2020" required="required"/>
                            </div>
                        </div>
                    </div>
                    <div class="details address">
                        <span class="title">Address Details</span>

                        <div class="fields">
                            <div class="input-field">
                                <label class="required" for="doorNo">Door No</label>
                                <form:input type="text" id="doorNo" name="doorNo" path="${address.doorNo}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="addressLine1">Address Line1</label>
                                <form:input type="text" id="addressLine1" name="addressLine1" path="${address.addressLine1}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label for="addressLine2">Address Line2</label>
                                <form:input type="text" id="addressLine2" name="addressLine2" path="${address.addressLine2}"/>
                            </div>
                            <div class="input-field">
                                <label for="addressLine3">Address Line3</label>
                                <form:input type="text" id="addressLine3" name="addressLine3" path="${address.addressLine3}"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="dist">District</label>
                                <form:input type="text" id="dist" name="district" path="${address.district}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="state">State</label>
                                <form:input type="text" id="state" name="state" path="${address.state}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="pinCode">Pin Code</label>
                                <form:input type="text" id="pinCode" name="pinCode" path="${address.pinCode}" pattern="[0-9]{6}" required="required"/>
                            </div>
                        </div>
                        
                    </div>
                <!--  -->
                <div class="button">
                    <button type="submit" class="regBtn">
                        <span class="btnText">Register</span>
                    </button>
                </div>
        </form:form>
    </div>
    <script>
        function myFunction() {
          var elms = document.getElementsByClassName("container");
          console.log("checked");
            Array.from(elms).forEach((x) => {
                if (x.style.display === "none") {
                x.style.display = "block";
                } else {
                x.style.display = "none";
                }
            })
        }
    </script>
</body>
</html>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Management System</title>
</head>
<body>
<form:form action="register" method="post" modelAttribute="student">
<label for="fullName">Name</label>
<form:input type="text" id="fullName" name="name" placeholder="Enter Full Name with Initial" title="Ex: Dhanush Karthik M" path="${student.name}" required="required"/>

<label for="DOB">Date of Birth</label>
<form:input type="date" id="DOB" name="dob" path="${student.dob}" required="required"/>

<label for="gender">Gender</label>
                    <form:select id="gender" name="gender" path="${student.gender}" required="required">
                                        <form:option value="">Select Gender</form:option>
                                        <form:option value="Male">Male</form:option>
                                        <form:option value="Female">Female</form:option>
                                        <form:option value="Transgender">Transgender</form:option>
                                        <form:option value="Prefer not to say">Prefer not to say</form:option>
                                    </form:select>
<div class="form:input-box">
                    <label for="mob">Mobile No</label>
                    <form:input type="tel" id="mob" name="mobileNo" pattern="[0-9]{10}" placeholder="Enter 10 digit Mobile number" path="${student.mobileNo}" required="required"/>
                </div>
                <div class="form:input-box">
                    <label for="email">Email Id</label>
                    <form:input type="email" id="email" path="${student.emailId}" name="emailId"/>
                </div>
                <div class="form:input-box">
                    <label for="blood">Blood Group</label>
                    <form:input type="text" id="blood" name="bloodGroup" path="${student.bloodGroup}" placeholder="Ex: A+"/>
                </div>
                <div class="column">
                <div class="form:input-box">
                    <label for="branch">Branch</label>
                    <form:select id="branch" name="branch" path="${student.branch}" required="required">
                        <form:option value="">Select Branch</form:option>
                        <form:option value="Civil Engineering">Civil</form:option>
                        <form:option value="Mechanical Engineering">Mechanical</form:option>
                        <form:option value="Electrical and Electronic Engineering">EEE</form:option>
                        <form:option value="Electronics and Communication Engineering">ECE</form:option>
                        <form:option value="Computer Science Engineering">CSE</form:option>
                    </form:select>
                </div>
                <div class="form:input-box">
                    <label for="year">Year</label>
                    <form:select id="year" name="year" path="${student.year}" required="required">
                        <form:option value="">Select Year</form:option>
                        <form:option value="I">I</form:option>
                        <form:option value="II">II</form:option>
                        <form:option value="III">III</form:option>
                        <form:option value="IV">IV</form:option>
                    </form:select>
                </div>
            </div>
             <div class="form:input-box">
                <label for="collegeName">College Name</label>
                <form:input type="text" id="collegeName" name="collegeName" placeholder="Enter Full Name" path="${student.collegeName}" required="required"/>
            </div>
            <div class="form:input-box">
            <label for="acad_year">Academic Year</label>
            <form:input type="text" id="acad_year" name="academicYear" path="${student.academicYear}" pattern="[0-9]{4}-[0-9]{4}" placeholder="Ex: 2016-2020" required="required"/>
            </div>
           	<h3>Address Details</h3>
           	<label for="doorNo">DoorNo</label>
                <form:input type="text" id="doorNo" name="doorNo" path="${address.doorNo}" required="required"/>
    <label for="addressLine1">Address Line1</label>
                <form:input type="text" id="addressLine1" name="addressLine1" path="${address.addressLine1}" required="required"/>
    <label for="addressLine2">Address Line2</label>
                <form:input type="text" id="addressLine" name="addressLine2" path="${address.addressLine2}"/>
    <label for="addressLine3">Address Line3</label>
                <form:input type="text" id="addressLine3" name="addressLine3" path="${address.addressLine3}"/>
       <label for="dist">District</label>
                <form:input type="text" id="dist" name="district" path="${address.district}" required="required"/>
                    <label for="state">State</label>
                <form:input type="text" id="state" name="state" path="${address.state}" required="required"/>
                  
                    <label for="pinCode">PinCode</label>
                <form:input type="text" id="pinCode" name="pinCode" path="${address.pinCode}" pattern="[0-9]{6}" required="required"/>
             <br>
            <input type="submit" value="Register"/>
  </form:form>
</body>
</html> --%>