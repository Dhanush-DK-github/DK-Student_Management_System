function validateForm(){
	console.log("Hii");
    var dob = new Date(document.getElementById("DOB").value);
    var month_diff = Date.now() - dob.getTime();
    
    //convert the calculated difference in date format
    var age_dt = new Date(month_diff); 
    
    //extract year from date    
    var year = age_dt.getUTCFullYear();
    
    //now calculate the age of the user
    var age = Math.abs(year - 1970);
    var age=age+1;
    console.log("Hii")
    if(age>=17){

        let acad_year=document.getElementById("acad_year").value;
        const acad_yearArray = acad_year.split("-");
        var acad_yearStart=acad_yearArray[0];
        var acad_yearEnd=acad_yearArray[1];

        if(acad_yearEnd-acad_yearStart==4){
            if(acad_yearStart<=new Date().getFullYear()){
                if((acad_yearStart-dob.getFullYear())>=17){
//                    alert("Success");
                    document.getElementById("acad_year").style.boxShadow="none";
                    return true;
                }
                else{
                    alert("Starting year of the Academic year should have a minimum span of 17yrs from DOB");
                    document.getElementById("acad_year").focus();
                    document.getElementById("acad_year").style.boxShadow="2px 3px 10px rgba(122, 0, 0, 0.35)";
                    return false;
                }
            }
            else{
                alert("Academic year should not be in future");
                document.getElementById("acad_year").focus();
                document.getElementById("acad_year").style.boxShadow="2px 3px 10px rgba(122, 0, 0, 0.35)";
                return false;
            }
        }
        else{
            alert("Academic year should be the span of 4 years");
            document.getElementById("acad_year").focus();
            document.getElementById("acad_year").style.boxShadow="2px 3px 10px rgba(122, 0, 0, 0.35)";
            return false;
        }
    }
    else{
        alert("You are below 17, Kindly enter correct DOB");
        document.getElementById("DOB").focus();
        document.getElementById("DOB").style.boxShadow="2px 3px 10px rgba(122, 0, 0, 0.35)";
        return false;
    }
}