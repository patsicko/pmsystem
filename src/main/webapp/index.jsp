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

    .carousel-container {
        overflow: hidden;
        width: 100%;
        height: 1000px;
        position: relative;
    }

    .carousel {
        display: flex;
        width: 300%;
        animation: carouselAnimation 10s infinite;
    }

    .slide {
        flex: 0 0 33.33%; 
    }

    .slide img {
        width: 90%;
        height: 100%;
        object-fit: cover;
    }


    @keyframes carouselAnimation {
        0% {
            transform: translateX(0);
        }
        100% {
            transform: translateX(-66.66%); 
        }
    }

 
    .carousel-container:hover .carousel {
        animation-play-state: paused;
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
    </style>
</head>
<body>
    <header>

         <div class="logo">
               <H1>PMS</H1> 
        </div>

         <div class="navlink">
            <a href="">Home</a>
        <a href="">About</a>
        </div>
        <nav>

        <a href="login.jsp"> <button type="button"  style="color: white; background-color: #148fb6 ">SIGN IN</button></a>
        <a href="signup.jsp"><button type="button"  style="color: white; background-color: #148fb6">REGISTER</button></a>
        </nav>
    </header>

    <div class="main">
        <!-- Carousel Container -->
        <div class="carousel-container">
            <!-- Carousel -->
            <div class="carousel">
                <div class="slide">
                    <img src="assets/image1.jpg" alt="Image 1">
                </div>
                <div class="slide">
                    <img src="assets/image2.png" alt="Image 2">
                </div>
                <div class="slide">
                    <img src="assets/img3.jpg" alt="Image 3">
                </div>
                
                <div class="slide">
                    <img src="assets/image4.png" alt="Image 3">
                </div>
            </div>
        </div>
    </div>


</body>
</html>
