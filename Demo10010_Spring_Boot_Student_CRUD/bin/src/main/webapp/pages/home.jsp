<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <link rel="stylesheet" href="/CSS/res_navStyle.css">
    <link rel="stylesheet" href="/CSS/homeStyle.css">
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

    <div class="home-container">
        <div class="contents">
            <div class="welcome-title">
                <h2>Hii, We are so happy to welcome you!!</h2>
            </div>
            <div class="sub-title">
                <h4>Please take a moment to explore this site</h4>
            </div>
            <div class="buttons">
                <div class="listBtn">
                    <a href="listStudents"><button class="list">List All Students <div class="right"></div></button></a>
                </div>
                <div class="addBtn">
                    <a href="newStudent"><button class="add">Add New Student</button></a>
                </div>
            </div>
         </div>
    </div>
    <script>
        function myFunction() {
          var elms = document.getElementsByClassName("home-container");
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