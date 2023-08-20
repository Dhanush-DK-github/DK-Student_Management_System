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
    <script src="/Javascript/verifyBirthAndAcad.js"></script>
    <style>
        .container form .formDetails .details .input-field input, select{
            cursor: auto;
            background-color: #E5F9E0;
        }
        form .input-field label.required:after { 
            content:" *"; 
            color: red;
        }
        .container form button{
		    /* display: flex; */
		    align-items: center;
		    justify-content: center;
		    height: 35px;
		    /* max-width: 150px; */
		    width: 100px;
		    border: none;
		    outline: none;
		    color: #fff;
		    border-radius: 5px;
		    margin: 20px 5px;
		    /* margin-left: 40%; */
		    background-color: #2F9C95;
		    font-size: 16px;
		    font-weight: 400;
		    cursor: pointer;
		}
		form button:hover{
		    background-color: #4ffff3;
		    color: black;
		}
    </style>
    <!-- <style>
        .readonly{
            pointer-events: none;
        }
    </style> -->
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
        <header>Edit Details</header>
            <form:form action="/editSave" method="post" modelAttribute="student" onsubmit="return validateForm()">
                <div class="formDetails">
                    <div class="details personal">
                        <div class="titleBorder">
                        <span class="title">Personal Details</span>
                        </div>

                        <div class="fields">
                            <div class="input-field">
                                <label class="required" for="fullName">Full Name</label>
                                <form:input type="text" id="fullName" name="name" path="name" placeholder="Enter Full Name with Initial" title="Ex: Dhanush Karthik M" value="${student.name}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="DOB">Date of Birth</label>
                                <form:input type="date" id="DOB" name="dob" path="dob" value="${student.dob}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="gender">Gender</label>
                                    <form:select id="gender" name="gender" path="gender" value="${student.gender}" required="required">
                                        <form:option value="">Select Gender</form:option>
                                        <form:option value="Male">Male</form:option>
                                        <form:option value="Female">Female</form:option>
                                        <form:option value="Transgender">Transgender</form:option>
                                        <form:option value="Prefer not to say">Prefer not to say</form:option>
                                    </form:select>
                            </div>
                            <div class="input-field">
                                <label class="required" for="mob">Mobile No</label>
                                <form:input type="tel" id="mob" name="mobileNo" pattern="[0-9]{10}" placeholder="Enter 10 digit Mobile number" path="mobileNo" value="${student.mobileNo}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label for="email">Email Id</label>
                                <form:input type="email" id="email" value="${student.emailId}" path="emailId" name="emailId"/>
                            </div>
                            <div class="input-field">
                                <label for="blood">Blood Group</label>
                                <form:input type="text" id="blood" name="bloodGroup" path="bloodGroup" value="${student.bloodGroup}"  placeholder="Ex: A+"/>
                            </div>
                        </div>
                    </div>
                    
                    <div class="details college">
                        <div class="titleBorder">
                        <span class="title">College Details</span>
                        </div>

                        <div class="fields">
                            <div class="input-field">
                                <label class="required" for="collegeName">College Name</label>
                                <form:input type="text" id="collegeName" name="collegeName" path="collegeName" placeholder="Enter Full Name" value="${student.collegeName}"  required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="branch">Branch</label>
                                <form:select id="branch" name="branch" path="branch" value="${student.branch}" required="required">
                        <form:option value="">Select Branch</</form:option>
                        <form:option value="Civil Engineering">Civil</form:option>
                        <form:option value="Mechanical Engineering">Mechanical</form:option>
                        <form:option value="Electrical and Electronic Engineering">EEE</form:option>
                        <form:option value="Electronics and Communication Engineering">ECE</form:option>
                        <form:option value="Computer Science Engineering">CSE</form:option>
                    </form:select>
                            </div>
                            <div class="input-field">
                                <label class="required" for="year">Year</label>
                                <form:select id="year" name="year" path="year" value="${student.year}" required="required">
                        <form:option value="">Select Year</form:option>
                        <form:option value="I">I</form:option>
                        <form:option value="II">II</form:option>
                        <form:option value="III">III</form:option>
                        <form:option value="IV">IV</form:option>
                    </form:select>
                            </div>
                            <div class="input-field">
                                <label class="required" for="acad_year">Academic Year</label>
                                <form:input type="text" id="acad_year" name="academicYear" path="academicYear" value="${student.academicYear}"  pattern="[0-9]{4}-[0-9]{4}" placeholder="Ex: 2016-2020" required="required"/>
                            </div>
                        </div>
                        <!-- <button class="nextBtn">
                            <span class="btnText">Next</span>
                            <i class="uil uil-navigator"></i>
                        </button> -->
                    </div>
                    <div class="details address">
                        <div class="titleBorder">
                        <span class="title">Address Details</span>
                        </div>

                        <div class="fields">
                            <div class="input-field">
                                <label class="required" for="doorNo">Door No</label>
                                <form:input type="text" id="doorNo" name="doorNo" path="address.doorNo" value="${address.doorNo}" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="addressLine1">Address Line1</label>
                                <form:input type="text" id="addressLine1" name="addressLine1" value="${address.addressLine1}" path="address.addressLine1"  required="required"/>
                            </div>
                            <div class="input-field">
                                <label for="addressLine2">Address Line2</label>
                                <form:input type="text" id="addressLine2" name="addressLine2" value="${address.addressLine2}" path="address.addressLine2"/>
                            </div>
                            <div class="input-field">
                                <label for="addressLine3">Address Line3</label>
                                <form:input type="text" id="addressLine3" name="addressLine3" value="${address.addressLine3}" path="address.addressLine3"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="dist">District</label>
                                <form:input type="text" id="dist" name="district" value="${address.district}" path="address.district" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="state">State</label>
                                <form:input type="text" id="state" name="state" value="${address.state}" path="address.state" required="required"/>
                            </div>
                            <div class="input-field">
                                <label class="required" for="pinCode">Pin Code</label>
                                <form:input type="text" id="pinCode" name="pinCode" value="${address.pinCode}" path="address.pinCode" pattern="[0-9]{6}" required="required"/>
                            </div>
                        </div>
                        
                    </div>
                </div> 
                <div class="buttons">
                    <button type="submit" class="regBtn">
                        <span class="btnText">Update</span>
                    </button>
            </div>
            </form:form>
            <div class="buttons">
            	<a href="/listStudents">
                     <button class="back">
                         <span class="btnText">Back</span>
                     </button>
                 </a>
            </div>
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
	<form:form action="/editSave" method="post" modelAttribute="student">
<label for="fullName">Name</label>
<form:input type="text" id="fullName" name="name" path="name" placeholder="Enter Full Name with Initial" title="Ex: Dhanush Karthik M" value="${student.name}" required="required"/>

<label for="DOB">Date of Birth</label>
<form:input type="date" id="DOB" name="dob" path="dob" value="${student.dob}" required="required"/>

<label for="gender">Gender</label>
                    <form:select id="gender" name="gender" path="gender" value="${student.gender}" required="required">
                                        <form:option value="">Select Gender</form:option>
                                        <form:option value="Male">Male</form:option>
                                        <form:option value="Female">Female</form:option>
                                        <form:option value="Transgender">Transgender</form:option>
                                        <form:option value="Prefer not to say">Prefer not to say</form:option>
                                    </form:select>
<div class="form:input-box">
                    <label for="mob">Mobile No</label>
                    <form:input type="tel" id="mob" name="mobileNo" pattern="[0-9]{10}" placeholder="Enter 10 digit Mobile number" path="mobileNo" value="${student.mobileNo}" required="required"/>
                </div>
                <div class="form:input-box">
                    <label for="email">Email Id</label>
                    <form:input type="email" id="email" value="${student.emailId}" path="emailId" name="emailId"/>
                </div>
                <div class="form:input-box">
                    <label for="blood">Blood Group</label>
                    <form:input type="text" id="blood" name="bloodGroup" path="bloodGroup" value="${student.bloodGroup}"  placeholder="Ex: A+"/>
                </div>
                <div class="column">
                <div class="form:input-box">
                    <label for="branch">Branch</label>
                    <form:select id="branch" name="branch" path="branch" value="${student.branch}" required="required">
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
                    <form:select id="year" name="year" path="year" value="${student.year}" required="required">
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
                <form:input type="text" id="collegeName" name="collegeName" path="collegeName" placeholder="Enter Full Name" value="${student.collegeName}"  required="required"/>
            </div>
            <div class="form:input-box">
            <label for="acad_year">Academic Year</label>
            <form:input type="text" id="acad_year" name="academicYear" path="academicYear" value="${student.academicYear}"  pattern="[0-9]{4}-[0-9]{4}" placeholder="Ex: 2016-2020" required="required"/>
            </div>
           	<h3>Address Details</h3>
           	<label for="doorNo">DoorNo</label>
                <form:input type="text" id="doorNo" name="doorNo" path="address.doorNo" value="${address.doorNo}" required="required"/>
    <label for="addressLine1">Address Line1</label>
                <form:input type="text" id="addressLine1" name="addressLine1" value="${address.addressLine1}" path="address.addressLine1"  required="required"/>
    <label for="addressLine2">Address Line2</label>
                <form:input type="text" id="addressLine" name="addressLine2" value="${address.addressLine2}" path="address.addressLine2"/>
    <label for="addressLine3">Address Line3</label>
                <form:input type="text" id="addressLine3" name="addressLine3" value="${address.addressLine3}" path="address.addressLine3"/>
       <label for="dist">District</label>
                <form:input type="text" id="dist" name="district" value="${address.district}" path="address.district" required="required"/>
                    <label for="state">State</label>
                <form:input type="text" id="state" name="state" value="${address.state}" path="address.state" required="required"/>
                  
                    <label for="pinCode">PinCode</label>
                <form:input type="text" id="pinCode" name="pinCode" value="${address.pinCode}" path="address.pinCode" pattern="[0-9]{6}" required="required"/>
             <br>
             <a href="/listStudents"><button class="back">Back</button></a><br>
            <input type="submit" value="Update"/>
  </form:form>
</body>
</html> --%>