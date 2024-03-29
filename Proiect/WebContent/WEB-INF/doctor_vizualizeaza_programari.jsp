<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
<ul class="nav navbar-nav">
      <li><a href="${pageContext.request.contextPath}/doctor">Home</a></li>
      <li class="active"><a>Vizualizeaza programari</a></li>
      <li><a href="${pageContext.request.contextPath}/">Log out</a></li>
    </ul>
    </div>
</nav>

<div class="container container-table">
<form method="GET" action="${pageContext.request.contextPath}/doctor_completeaza_fisa_consult">


<div class="container register-form">
            <div class="form">
                <div class="note">
                    <p>Acestia sunt pacientii programati astazi:</p>
                </div>

                <div class="form-content">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                    <select name="progId" class="form-control" data-style="btn-primary" multiple>
               <% 
    try{
     
     Class.forName("com.mysql.cj.jdbc.Driver"); //.newInstance();
     
     Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/spital","root", "alrasjbs");
     
     Statement stm = conn.createStatement();
     String Query = "SELECT * FROM programare where doctor_id = '" + request.getAttribute("doctor_id")+ "' AND data_programarii = DATE(CURDATE()) ";
     ResultSet rs = stm.executeQuery(Query);

     
     while(rs.next()){      
         String query2 = "SELECT name FROM user WHERE cnp =" + rs.getString("pacient_cnp");
         Statement getPacienti = conn.createStatement();
         ResultSet rs2 = getPacienti.executeQuery(query2);
         if (rs2.next()){
      %>
       <option value="<%=rs.getInt("id") %>"><%=rs2.getString("name") %></option>
            
      <%
         }
         }
     
     
     
    }catch(Exception ex){
     ex.printStackTrace();
     out.println("Error: "+ex.getMessage());
    }
               %>
               
                </select>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btnSubmit">Completeaza Fisa Consult</button>
                </div>
            </div>
        </div>
</form>
</div>
</body>
</html>

