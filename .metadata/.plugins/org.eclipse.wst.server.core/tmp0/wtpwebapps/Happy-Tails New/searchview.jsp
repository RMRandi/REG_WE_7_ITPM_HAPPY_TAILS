<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
    	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	
	
 
 <title> sample </title>
 

			<hr>
	
		<ul class="one" position=fixed;>
		
			<li><lable style="font-size:40px;">Happy Tails</lable></li>
			<li><a href="#">HOME</a></li>
			<li><a href="#">MEMBERS</a></li>
			<li><a href="#">PETS</a></li>
			<li><a href="#">VICTORY LOGS</a></li>
			<li><a href="#">STOCKS</a></li>
			<li><a href="#">ABOUT US</a></li>
	
			
		</ul>
		
		
		
 	
 </head>
 <hr>
    </head>
    <body>
    
    	<h1>Patient search result</h1>
    	<a href="view.jsp"><button class="btnback" align="right">Back</button></a>
        <table border="2">
           
            <tr>
                <td><b>Sr No</b></td>
                <td><b>Name</b></td>
                <td><b>NIC</b></td>
                <td><b>Contact Number</b></td>
                <td><b>Address</b></td>
                <td><b>Gender</b></td>
                <td><b>Date of registration</b></td>
                <td><b>Employment type</b></td>
                <td><b>Annual fee</b></td>
             

            </tr>
            <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al.toString());
                    
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                <td><%=pList.get(7)%></td>
                <td><%=pList.get(8)%></td>
               
                
            </tr>
            <%
                    }
                }
                
            %>
            <%
            if (count == 0) {
            %>
            <tr>
                <td colspan=8 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            
            	}
            %>
        </table>
    </body>
</html>