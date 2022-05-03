<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/happytailsdb";
String userid = "root";
String password = "";

try {
	Class.forName(driver);
} 
catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	statement=connection.createStatement();
	String sql ="select * from member where id="+id;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>UPDATE MEMBER DETAILS</title>


	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/ptu.css">
		<hr>
	
		<ul class="one" position=fixed;>
		
			<li><lable style="font-size:40px;">Happy Tails</lable></li>
			<li><a href="#">HOME</a></li>
			<li><a href="view.jsp">MEMBERS</a></li>
			<li><a href="#">PETS</a></li>
			<li><a href="#">VICTORY LOGS</a></li>
			<li><a href="#">STOCKS</a></li>
			<li><a href="#">ABOUT US</a></li>
	
			
		</ul>
		
 </head>
 <hr>
<link rel="stylesheet" type="text/css" href="css/patientinsert.css">
	<style>
	* {box-sizing: border-box}

/* Add padding to containers */
.container {
  padding: 16px;
  position: center;
  
	margin: auto;
}
form {
	display: inline-block; 
    margin-left: 30%;
    margin-right:30%;
    width: 100%;
}

table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
}


/* Full-width input fields */
input[type=text], input[type=DATE], input[type=number] {
  width: 50%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: flex;
  border: none;
  background: #f1f1f1;
  float: center;
  text-align: center;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;

}

/* Set a style for the submit/register button */
.submitbtn {
  background-color: red;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 50%;
  opacity: 0.9;

}

.submitbtn:hover {
  opacity:1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

	</style>		
 </head>
 <hr>
	

<body class="ubody">

	<h1>UPDATE MEMBER</h1>
	
  	<form style ="align:center"action="update" method="post">
  	<input type="hidden" name="memid" value="<%=resultSet.getString("id") %>">
      	<label for="pid">Patient ID</label>
      		<input type="text" name="id"  value="<%=resultSet.getString("id") %>" readonly ><br>

      	<label for="name"><b>Name</b></label>
      		<input type="text" name="name" value="<%=resultSet.getString("name") %>" > <br>
      		
      	<label for="nic"><b>NIC</b></label>
      		<input type="text" name="nic" value="<%=resultSet.getString("nic") %>"> <br>
      		
      	<label for="phone"><b>Phone Number</b></label>
      		<input type="text" name="phone" value="<%=resultSet.getString("phone") %>" > <br>
      	

      	<label for="address"><b>Address</b></label>
      		<input type="text" name="address" value="<%=resultSet.getString("address") %>"> <br>
     
      	<br>		
      	<label for="gender"><b>Gender</b></label> <br>
      		<input type="radio" id="male" name="gender" value="male" readonly checked > <label for="male" >Male</label>
     		<input type="radio" id ="female" name="gender" value="female" readonly ><label for="female">Female</label>
     
     	<br>	
      		 
      	<label for="date"><b>Date</b></label>
      		<input type="date" name="date" value="<%=resultSet.getString("date") %>"><br>
      			
      	<label for="type"><b>Member Type</label><br>
      		<input type="radio" name="type" value="Commitee_member" checked><label for="Commitee_member" >Commitee Member</label><br>
      		<input type="radio" name="type" value="Nem_volunteer" ><label for="New_volunteer">New volunteer</label><br>
      		
      		
      		
      	<label for="fee"><b>Annual fee</b></label>
      		<input type="number" name="fee" id = "address"value="<%=resultSet.getString("fee") %>" > <br>


  	
  	<div class="row">
    	<input type="submit" value="Update" onclick="alert('Record Updated Successfully!')">
 	 </div><br><br>
	<a href="view.jsp"><input type="submit" value="Back"></a><br><br>
	</form>
	<br><br>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
<footer><br><br></footer>
</html>