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
    <link rel="stylesheet" href="/CSS/detailStyle.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto Slab|Roboto|Roboto Serif|Roboto Condensed">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
        <header>Student Details</header>
            <form:form modelAttribute="student">
                <div class="formDetails">
                    <div class="details personal">
                        <div class="titleBorder">
                        <span class="title">Personal Details</span>
                        </div>
                        <div class="fields">
                            <div class="input-field">
                                <label class="readonly" for="fullName">Full Name</label>
                                <form:input type="text" id="fullName" name="name" path="name" placeholder="Enter Full Name with Initial" value="${student.name}" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="DOB">Date of Birth</label>
                                <form:input type="date" id="DOB" name="dob" path="dob" value="${student.dob}" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="gender">Gender</label>
                                <form:input type="text" id="gender" name="gender" path="gender" value="${student.gender}" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="mob">Mobile No</label>
                                <form:input type="tel" id="mob" name="mobileNo" pattern="[0-9]{10}" placeholder="Enter 10 digit Mobile number" path="mobileNo" value="${student.mobileNo}" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label for="email">Email Id</label>
                                <form:input type="email" id="email" value="${student.emailId}" path="emailId" name="emailId" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label for="blood">Blood Group</label>
                                <form:input type="text" id="blood" name="bloodGroup" path="bloodGroup" value="${student.bloodGroup}"  placeholder="Ex: A+" readonly="true"/>
                            </div>
                        </div>
                    </div>
                    
                    <div class="details college">
                        <div class="titleBorder">
                        <span class="title">College Details</span>
                        </div>
                        <div class="fields">
                            <div class="input-field">
                                <label class="readonly" for="collegeName">College Name</label>
                                <form:input type="text" id="collegeName" name="collegeName" path="collegeName" placeholder="Enter Full Name" value="${student.collegeName}"  required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="branch">Branch</label>
                                <form:input type="text" id="branch" name="branch" path="branch" value="${student.branch}" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="year">Year</label>
                                <form:input type="text" id="year" name="year" path="year" value="${student.year}" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="acad_year">Academic Year</label>
                                <form:input type="text" id="acad_year" name="academicYear" path="academicYear" value="${student.academicYear}"  pattern="[0-9]{4}-[0-9]{4}" placeholder="Ex: 2016-2020" required="required" readonly="true"/>
                            </div>
                        </div>
                    </div>

                    <div class="details address">
                        <div class="titleBorder">
                        <span class="title">Address Details</span>
                    </div>

                        <div class="fields">
                            <div class="input-field">
                                <label class="readonly" for="doorNo">Door No</label>
                                <form:input type="text" id="doorNo" name="doorNo" path="address.doorNo" value="${address.doorNo}" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="addressLine1">Address Line1</label>
                                <form:input type="text" id="addressLine1" name="addressLine1" value="${address.addressLine1}" path="address.addressLine1"  required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label for="addressLine2">Address Line2</label>
                                <form:input type="text" id="addressLine2" name="addressLine2" value="${address.addressLine2}" path="address.addressLine2" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label for="addressLine3">Address Line3</label>
                                <form:input type="text" id="addressLine3" name="addressLine3" value="${address.addressLine3}" path="address.addressLine3" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="dist">District</label>
                                <form:input type="text" id="dist" name="district" value="${address.district}" path="address.district" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="state">State</label>
                                <form:input type="text" id="state" name="state" value="${address.state}" path="address.state" required="required" readonly="true"/>
                            </div>
                            <div class="input-field">
                                <label class="readonly" for="pinCode">Pin Code</label>
                                <form:input type="text" id="pinCode" name="pinCode" value="${address.pinCode}" path="address.pinCode" pattern="[0-9]{6}" required="required" readonly="true"/>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </form:form>
            <div class="buttons">
                    <a href="/listStudents">
                        <button class="back">
                            <span class="btnText">Back</span>
                        </button>
                    </a>
                    <a href="/editStudent/${student.id}">
	                    <button class="regBtn">
	                        <span class="btnText">Edit</span>
	                    </button>
                    </a>
            </div>
    </div>
    <script>
        function myFunction() {
          var elms = document.getElementsByClassName("container");
          console.log("checked");
            Array.from(elms).forEach((x) =>{
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
	<form:form modelAttribute="student">
<label for="fullName">Name</label>
<form:input type="text" id="fullName" name="name" path="name" placeholder="Enter Full Name with Initial" value="${student.name}" required="required" readonly="true"/>

<label for="DOB">Date of Birth</label>
<form:input type="date" id="DOB" name="dob" path="dob" value="${student.dob}" required="required" readonly="true"/>

<label for="gender">Gender</label>
<form:input type="text" id="gender" name="gender" path="gender" value="${student.gender}" required="required" readonly="true"/>
                    <form:select id="gender" name="gender" path="gender" value="${student.gender}" required="required" readonly="true">
                                        <form:option value="">Select Gender</form:option>
                                        <form:option value="Male">Male</form:option>
                                        <form:option value="Female">Female</form:option>
                                        <form:option value="Transgender">Transgender</form:option>
                                        <form:option value="Prefer not to say">Prefer not to say</form:option>
                                    </form:select>
<div class="form:input-box">
                    <label for="mob">Mobile No</label>
                    <form:input type="tel" id="mob" name="mobileNo" pattern="[0-9]{10}" placeholder="Enter 10 digit Mobile number" path="mobileNo" value="${student.mobileNo}" required="required" readonly="true"/>
                </div>
                <div class="form:input-box">
                    <label for="email">Email Id</label>
                    <form:input type="email" id="email" value="${student.emailId}" path="emailId" name="emailId" readonly="true"/>
                </div>
                <div class="form:input-box">
                    <label for="blood">Blood Group</label>
                    <form:input type="text" id="blood" name="bloodGroup" path="bloodGroup" value="${student.bloodGroup}"  placeholder="Format: A+" readonly="true"/>
                </div>
                <div class="column">
                <div class="form:input-box">
                    <label for="branch">Branch</label>
                    <form:input type="text" id="branch" name="branch" path="branch" value="${student.branch}" required="required" readonly="true"/>
                    <form:select id="branch" name="branch" path="branch" value="${student.branch}" required="required" readonly="true">
                        <form:option value="">Select Branch</</form:option>
                        <form:option value="Civil Engineering">Civil</form:option>
                        <form:option value="Mechanical Engineering">Mechanical</form:option>
                        <form:option value="Electrical and Electronic Engineering">EEE</form:option>
                        <form:option value="Electronics and Communication Engineering">ECE</form:option>
                        <form:option value="Computer Science Engineering">CSE</form:option>
                    </form:select>
                </div>
                <div class="form:input-box">
                    <label for="year">Year</label>
                    <form:input type="text" id="year" name="year" path="year" value="${student.year}" required="required" readonly="true"/>
                    <form:select id="year" name="year" path="year" value="${student.year}" required="required" readonly="true">
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
                <form:input type="text" id="collegeName" name="collegeName" path="collegeName" placeholder="Enter Full Name" value="${student.collegeName}"  required="required" readonly="true"/>
            </div>
            <div class="form:input-box">
            <label for="acad_year">Academic Year</label>
            <form:input type="text" id="acad_year" name="academicYear" path="academicYear" value="${student.academicYear}"  pattern="[0-9]{4}-[0-9]{4}" placeholder="Ex: 2016-2020" required="required" readonly="true"/>
            </div>
           	<h3>Address Details</h3>
           	<label for="doorNo">DoorNo</label>
                <form:input type="text" id="doorNo" name="doorNo" path="address.doorNo" value="${address.doorNo}" required="required" readonly="true"/>
    <label for="addressLine1">Address Line1</label>
                <form:input type="text" id="addressLine1" name="addressLine1" value="${address.addressLine1}" path="address.addressLine1"  required="required" readonly="true"/>
    <label for="addressLine2">Address Line2</label>
                <form:input type="text" id="addressLine" name="addressLine2" value="${address.addressLine2}" path="address.addressLine2" readonly="true"/>
    <label for="addressLine3">Address Line3</label>
                <form:input type="text" id="addressLine3" name="addressLine3" value="${address.addressLine3}" path="address.addressLine3" readonly="true"/>
       <label for="dist">District</label>
                <form:input type="text" id="dist" name="district" value="${address.district}" path="address.district" required="required" readonly="true"/>
                    <label for="state">State</label>
                <form:input type="text" id="state" name="state" value="${address.state}" path="address.state" required="required" readonly="true"/>
                  
                    <label for="pinCode">PinCode</label>
                <form:input type="text" id="pinCode" name="pinCode" value="${address.pinCode}" path="address.pinCode" pattern="[0-9]{6}" required="required" readonly="true"/>
             <br>
  </form:form>
    <a href="/listStudents"><button class="back">Back</button></a><br>
  <a href="/editStudent/${student.id}"><button class=edit>Edit</button></a>
</body>
</html> --%>