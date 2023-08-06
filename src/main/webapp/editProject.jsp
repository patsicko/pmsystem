<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pms.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.pms.Login" %>
<%@ page import="com.pms.GetProjects" %>


<%ConnectDB db = new ConnectDB();
db.dbConnection();
Login users = new Login();
GetProjects projects = new GetProjects();
ResultSet result=null;


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Include jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Add this line to the head section of your HTML file -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
  header {
    height: 100px;
    background-color: rgb(214, 214, 238);
    display: flex;
    justify-content: space-between;
    padding-top: 25px;
    padding-left: 20px;
    padding-right: 20px;
    padding-bottom:20px;
  }
    
  .profilepic {
    height: 50px;
    width: 50px;
    border-radius: 50%;
  }

  table {
    border-collapse: collapse;
     
        box-shadow: -15px -15px 15px rgba(255, 255, 255, 0.2),
                15px 15px 15px rgba(0,0,0,0.1),
                inset -50px -50px 50px rgba(255, 255, 255, 0.2),
                inset 50px 50px 50px rgba(0,0,0,0.1);
               width:90%;
                font-size:1.3rem;
                padding:10px;
   
    
  }
  
  td,th{
  padding:10px;
  }

  .userTable, .projectTable {
    display: none;
  }
  
  .sidebar{
  width:20%;
  background-color:#7e4efc;
  height:85vh;
  padding:10px;
  }
  
  .main{
  
  display:flex;
  
  }
  
  .content{
  padding-top:20px;
  padding-left:50px;
  background-color:#e8edf5;
  width: 80%;
  padding-right:5%;
  }
  
  body{
  background-color:#977ff8;
  padding:20px;
  height:90vh;
  }
  
  .sidemenu{
    background-color:#6937ee;
    height:50%;
    margin-top:10%;
    padding:20px;
    box-shadow: -15px -15px 15px rgba(255, 255, 255, 0.2),
                25px 25px 25px rgba(0,0,0,0.1),
                inset -50px -50px 50px rgba(255, 255, 255, 0.2),
                inset 50px 50px 50px rgba(0,0,0,0.1);
  }
  
  .logout{
  background: linear-gradient(to right, #6033e8, #8458f7);
  height:20%;
  margin-top:30px;
  padding:20px;
    box-shadow: -15px -15px 15px rgba(255, 255, 255, 0.2),
                25px 25px 25px rgba(0,0,0,0.1),
                inset -50px -50px 50px rgba(255, 255, 255, 0.2),
                inset 50px 50px 50px rgba(0,0,0,0.1);
  }
  
  .userTable{
   box-shadow: 2px 2px 4px  #918f8f inset,-6px -6px 4px white inset;
   padding-left:50px;
   padding-top:50px;
   height:70vh;
  }
.users{
border-bottom:2px solid white;
padding-bottom:20px;
}

.projects{
border-bottom:2px solid white;
padding-top:20px;
padding-bottom:20px;
}

.btn-users,.btn-projects{
width:180px;
font-size:16px;
font-weight:700;
background-color:#6937ee;
border:none;
outline:none;
}


.login-form {
    display: flex;
    flex-direction: column;
     box-shadow: 2px 2px 4px  #918f8f inset,-4px -4px 4px white inset;
    border-radius: 15px;
    padding:25px;
}

.login-form h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input {
    width: 60%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 12px;
    font-size: 14px;
    cursor: pointer;
    font-size:1.8rem;
    font-weight:900;
}

button:hover {
    background-color: #0056b3;
}

textarea{
width:60%;
height:30vh;
border-radius:5px;
outline:none;
}
select{
width:60%;
border-radius:5px;
outline:none;
height:5vh;
color:blue;
}

.create-btn{
width:60%;
border-redius:5px;
outline:none;
height:5vh;
font-size:1.4rem;
font-weight:900;
}

.fa-solid{
color:white;
font-weight:900;
font-size:1.6rem;
}


.rotate-icon {
  transform: rotate(180deg);
}



</style>
</head>
<body>

  <header>
     
    <div></div>
    
     

    <div class="profile">
      <img class="profilepic" src="assets/profileicon.png" alt="profileicon">
    </div>
  </header>

  <div class="main">
  
    <div class="sidebar">
        <div class="logo">
      <h1>HMS</h1>
      
       </div>
        
    
      <div class="sidemenu">
		  
		    
		      <div class="projects">
		      <i class="fa-solid fa-list-check"></i>  <button type="button" class="btn btn-primary btn-projects" onclick="showProjectsTable()">Projects</button>
		      </div>
      </div> 
      
      
      <div class="logout">
      
       <a href="index.jsp">
        <button><i class="fa-solid fa-right-from-bracket rotate-icon"></i></button>
       </a>
      </div>
      
    </div>
    
<div class="content">
	    	    
	    
<div class="updateProjectForm" style="display: block;">
  <form class="login-form" action="UpdateProjectServlet" method="post">
    <h2>Edit Project</h2>
        <div class="form-group">
      <label for="updateProjctId">Project Id</label>
      <input type="text" id="updateProjectId" name="projectId" value="<%= request.getParameter("projectId") %>"  required readonly> 
    </div>
    <div class="form-group">
      <label for="updateProjectName">Project Title</label>
      <input type="text" id="updateProjectName" value="<%= request.getParameter("projectName") %>" name="projectName"  required>
    </div>
    <div class="form-group">
      <label for="updateDescription">Description</label>
      <textarea id="updateDescription" value="<%= request.getParameter("description") %>" name="description"  required></textarea>
    </div>
    <div class="form-group">
      <label for="updateUsers">Users :</label>
      <select id="updateUsers" name="user">
        <% 
          result = users.getsers();
          while (result.next()) {
        %>
        <option value="<%= result.getString("email") %>">
          <%= result.getString("email") %>
        </option>
        <% } %>
      </select>
    </div>
    <div class="form-group">
      <label for="updateStatus">Status :</label>
      <select id="updateStatus" name="status">
        <option value="wip">wip</option>
        <option value="complete">Complete</option>
      </select>
    </div>
    <input type="hidden" id="updateProjectId" name="projectId">
    <button class="create-btn" type="submit">Update</button>
  </form>
</div>
	    
    
    </div>

    
  </div>
 
  
</body>
</html>
