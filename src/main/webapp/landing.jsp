<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pms.ConnectDB" %>

<%@ page import="java.sql.*" %>
<%@ page import="com.pms.Login" %>
<%@ page import="com.pms.GetProjects" %>
<%@ page import="com.pms.LogedUser" %>
<%@ page import="com.pms.CurrentUser" %>


<%ConnectDB db = new ConnectDB();
db.loadDriver();
db.dbConnection();
Login users = new Login();

ResultSet result=null;

String email = (String) request.getAttribute("email");




GetProjects userProjects = new GetProjects();
result = userProjects.getUserProjects(new CurrentUser(email));




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- ... -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <!-- ... -->


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
border-redius:5px;
outline:none;
}
select{
width:60%;
border-redius:5px;
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

.defaut-content{
display:flex;
gap:50px;
border:2px solid gray;
height:80%;
margin-top:5%;
padding-top:10px;
border-radius:10px;
padding-right:10px;
}

h1{
font-weight:900;
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
      <h1>PMS</h1>
      
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
	    
	    <div class="defaut-content" >
	    
	    <img src="assets/img3.jpg">
	    <div class="text">
	   <h1> Welcome <%=email %> to the Project Management System!</h1>

We are thrilled to have you on board, and we hope this platform will empower you to efficiently manage your tasks and contribute to project success. Your personalized dashboard provides a comprehensive view of all the tasks assigned to you, keeping you organized and focused on your priorities.

Here, you can find detailed task descriptions,  and the current status of each assignment. You can easily mark tasks as complete with just a click, ensuring progress is accurately tracked and everyone stays informed.
<br><br>
Collaboration is key to success, and our system fosters seamless communication among team members. Stay updated in real-time about task changes, discussions, and document sharing, enabling effective teamwork and timely decision-making.

Thank you for being a part of our project management community. Let's work together and achieve remarkable outcomes! If you have any questions or need assistance, feel free to reach out to our support team.

Happy managing and happy collaborating!

	    
	    </div>
	    </div>
	    
	  
<div class="projectTable">
	      	    	    
  <table border=1>
    <thead>
      <tr>
        <th>ID</th>
        <th>Project Title</th>
        <th>Description</th>
        <th>Responsible person</th>
        <th>Status</th>
        <th>Mark as complete</th>
        
      </tr>
    </thead>
             <tbody>
                <% 
              /*  result = (ResultSet) session.getAttribute("projects"); */
              
            
                if (result != null) {
                    while (result.next()) {
                %>
                <tr>
                    <td><%= result.getInt("projectId") %></td>
                    <td><%= result.getString("projectName") %></td>
                    <td><%= result.getString("description") %></td>
                    <td><%= result.getString("user") %></td>
                    <td class="status"><%= result.getString("status") %></td>
                   <td class="action">
                  <button class="btn btn-primary" onclick="markAsComplete(<%= result.getInt("projectId") %>)">Mark as complete</button>
                  </td>

                </tr>
                <% 
                    }
                } else {
                %>
                <tr>
                    <td colspan="6">No projects found.</td>
                </tr>
                <% } %>
            </tbody>
  </table>
	    </div>

	    
    
    </div>
    
        
  </div>

 

  <script>
  const defautContent = document.querySelector(".defaut-content");
  defaultContent.style.display = 'block'

    function showProjectsTable() {
      document.querySelector('.projectTable').style.display = 'block';
      defautContent.style.display = 'none'
      const projectRows = document.querySelectorAll(".status");
      const actionButtons = document.querySelectorAll(".action button");

      projectRows.forEach((status, index) => {
        const statusValue = status.innerText.trim().toLowerCase();
        const actionButton = actionButtons[index];

        if (statusValue === "wip") {
          actionButton.innerText = "Mark as complete";
        } else if (statusValue === "complete") {
          actionButton.innerHTML = '<i class="fa-solid fa-check"></i>';
        }
      });
    }

    function markAsComplete(projectId) {
      $.ajax({
        url: '/pmsystem/UpdateProjectStatusServlet',
        type: 'POST',
        data: { projectId: projectId, status: 'complete' },
        success: function (response) {
            if (response.success) {
              
                toastr.success('Project updated successfully!', 'Success');
              
                setTimeout(() => {
                  location.reload();
                }, 2000);
              } else {
                console.error('Failed to update project status.');
              }
        },
        error: function (xhr, status, error) {
          console.error(error);
        },
      });
      
      toastr.success('Project updated successfully!', 'Success');
      
      setTimeout(() => {
        location.reload();
      }, 2000);
    
    }
  </script>
  


  
</body>
</html>
