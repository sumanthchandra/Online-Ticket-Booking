<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            * {box-sizing: border-box;}
            
            input[type=text], select, textarea {
                width: 100%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-top: 6px;
                margin-bottom: 16px;
                resize: vertical;
            }
            
            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            
            input[type=submit]:hover {
                background-color: #45a049;
            }
            
            .container {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }
            </style>
</head>
<body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
                <a class="navbar-brand" href="UserPage.jsp">
                    <img src="home_icon.png" width="30" height="30"  alt="logo">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
              
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown active">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                City
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Hyderabad</a>
                                <a class="dropdown-item" href="#">Mumbai</a>
                                <a class="dropdown-item" href="#">Chennai</a>
                                <a class="dropdown-item" href="#">Delhi</a>
                            </div>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link active" href="contactuser.jsp">Contact Us<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="aboutususer.jsp">About Us<span class="sr-only">(current)</span></a>
                        </li>
                  </ul>
                        <div class="dropdown">
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" style="margin-right: 10px;" title="">
<%HttpSession ses= request.getSession(false);out.println("Hi "+(String)ses.getAttribute("name"));%>
<span class="caret"></span>
</button>
<ul class="dropdown-menu">
<li><a href="viewTransactions">Your Transactions</a></li>
<li><a href="viewProfile" >View Profile</a></li>
<li><a href="LogoutServlet">Log Out</a></li>
</ul>
</div>                </div>
              </nav>
              <br>
              <br>
              <br>
              <br>
              <br>
              <div class="container">
                    <p style="font-size:30px">Contact Form : </p>
                    <form action="/action_page.php">
                      <label for="fname">First Name</label>
                      <input type="text" id="fname" name="firstname" placeholder="Your name..">
                  
                      <label for="lname">Last Name</label>
                      <input type="text" id="lname" name="lastname" placeholder="Your last name..">
                  
                      <label for="country">Country</label>
                      <select id="country" name="country">
                            <option value="usa">India</option>
                        <option value="canada">Canada</option>
                        <option value="usa">USA</option>
                        <option value="australia">Australia</option>
                        <option value="usa">South America</option>
                      </select>
                  
                      <label for="subject">Subject</label>
                      <textarea id="subject" name="subject" placeholder="Write your query" style="height:200px"></textarea>
                  
                      <input type="submit" value="Submit">
                    </form>
                  </div>
</body>
</html>