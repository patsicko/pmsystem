<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
*{
    margin: 0;
    padding: 0;
}
           body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color:rgb(246, 239, 239);

        }
    header{
    height: 80px;
    background-color: rgb(214, 214, 238);
    display: flex;
    justify-content: space-between;
    padding-top: 25px;
    padding-left: 20px;
    padding-right: 20px;

    }
    button{
        border-radius: 4px;
        outline: none;
        padding: 4px;
        width: 120px;
        height: 40px;
        border: none;
        font-size: medium;
        font-weight: 900;
          cursor: pointer;
    }
.container{
display: flex;
justify-content: space-between;

width: 80%;
margin-left: 10%;
 box-shadow: 2px 2px 4px  #918f8f,-2px -2px 4px white ;
 border-radius: 15px;
margin-top: 20px;
}

img{
border-radius:15px 0 0 15px;
}

.RigntContainer{
width: 50%;

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
    padding: 12px 20px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

.navlink{
height:20px;
padding:10px;
padding-bottom:10px;
width:180px;
display:flex;
justify-content:space-around;
font-weight:900;
font-size:1.4rem;
}
.navlink a{
text-decoration:none;
color:blue;
margin-top:10px;

}

.navlink a:hover{
color:white;
}

footer{
margin-top:225px;
}
    </style>
</head>
<body>
    <header>

         <div class="logo">
               <H1>PMS</H1> 
        </div>
        
        <div class="navlink">
            <a href="index.jsp">Home</a>
        <a href="">About</a>
        </div>
        

        <nav>
     
          <a href="login.jsp"> <button type="button"  style="color: white; background-color: #148fb6 ">SIGN IN</button></a>
            <a href="signup.jsp"><button type="button"  style="color: white; background-color: #148fb6">REGISTER</button></a>
        </nav>
    </header>


<div class="container">
<div  class="leftContainer">
<img src="assets/doctors-4.jpg">

</div>
<div  class="RigntContainer">

<form class="login-form" action="Registration" method="post">
            <h2>Sign Form</h2>
            <div class="form-group">
                <label for="username">Fisrt Name</label>
                <input type="text" id="username" name="fname" placeholder="Enter your First name" required>
            </div>
            
             <div class="form-group">
                <label for="lname">Last Name</label>
                <input type="text" id="lname" name="lname" placeholder="Enter your Last name" required>
            </div>
             <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="Enter your Email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit">Signup</button>
        </form>

</div>

</div>

  
    


   
    <footer>
        <p>&copy; <%= new java.util.Date().getYear() + 1900 %> Your Hospital. All rights reserved.</p>
    </footer>

</body>
</html>
