<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">
table, td {
	border: 0px solid black;
}

body {
	margin: 0;
	padding: 0;
	font-family: "Avenir Next", "Avenir", sans-serif;
}

a {
	text-decoration: none;
	color: #232323;
	transition: color 0.3s ease;
}

a:hover {
	color: tomato;
}

#menuToggle {
	display: block;
	position: relative;
	top: 50px;
	left: 50px;
	z-index: 1;
	-webkit-user-select: none;
	user-select: none;
}

#menuToggle input {
	display: block;
	width: 40px;
	height: 32px;
	position: absolute;
	top: -7px;
	left: -5px;
	cursor: pointer;
	opacity: 0; /* hide this */
	z-index: 2; /* and place it over the hamburger */
	-webkit-touch-callout: none;
}

/*
 * Just a quick hamburger
 */
#menuToggle span {
	display: block;
	width: 33px;
	height: 4px;
	margin-bottom: 5px;
	position: relative;
	background: #cdcdcd;
	border-radius: 3px;
	z-index: 1;
	transform-origin: 4px 0px;
	transition: transform 0.5s cubic-bezier(0.77, 0.2, 0.05, 1.0),
		background 0.5s cubic-bezier(0.77, 0.2, 0.05, 1.0), opacity 0.55s ease;
}

#menuToggle span:first-child {
	transform-origin: 0% 0%;
}

#menuToggle span:nth-last-child(2) {
	transform-origin: 0% 100%;
}

/* 
 * Transform all the slices of hamburger
 * into a crossmark.
 */
#menuToggle input:checked ~ span {
	opacity: 1;
	transform: rotate(45deg) translate(-2px, -1px);
	background: #232323;
}

/*
 * But let's hide the middle one.
 */
#menuToggle input:checked ~ span:nth-last-child(3) {
	opacity: 0;
	transform: rotate(0deg) scale(0.2, 0.2);
}

/*
 * Ohyeah and the last one should go the other direction
 */
#menuToggle input:checked ~ span:nth-last-child(2) {
	transform: rotate(-45deg) translate(0, -1px);
}

/*
 * Make this absolute positioned
 * at the top left of the screen
 */
#menu {
	position: absolute;
	width: 300px;
	margin: -100px 0 0 -50px;
	padding: 50px;
	padding-top: 125px;
	background: #ededed;
	list-style-type: none;
	-webkit-font-smoothing: antialiased;
	/* to stop flickering of text in safari */
	transform-origin: 0% 0%;
	transform: translate(-100%, 0);
	transition: transform 0.5s cubic-bezier(0.77, 0.2, 0.05, 1.0);
}

#menu li {
	padding: 10px 0;
	font-size: 22px;
}

/*
 * And let's slide it in from the left
 */
#menuToggle input:checked ~ ul {
	transform: none;
}

#pspecs {
	display: none;
	background: #f1f1f1;
	color: #000;
	position: relative;
	padding: 20px;
	margin-top: 10px;
}

#pspecs p {
	padding: 10px 35px;
	font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
	color: green;
}

.valid:before {
	position: relative;
	left: -35px;
	content: "???";
}

/* Add a red text color and an "x" icon when the requirements are wrong */
.invalid {
	color: red;
}

.invalid:before {
	position: relative;
	left: -35px;
	content: "???";
}
</style>
   <script>
   function dataCheck()
        {

          //if amount exists then clear it
            if(document.getElementById("demo").innerHTML != '') 
              document.getElementById("demo").innerHTML = ''


            var ns=document.getElementById("data1").value;
            var ty=document.getElementById("data2").value;
            var ty1=document.getElementById("data3").value;
            var ty2=document.getElementById("data4").value;
            var amount;
            if(ty=="Gold")
            {
              amount = "Amount : Rs. " + ns*2022.50 + "/-(Inclusive of all taxes)";
            }
            if(ty=="Silver")
            {
              amount = "Amount : Rs. " + ns*1022.50 + "/-(Inclusive of all taxes)";
            }
            if(ty=="Bronze")
            {
              amount = "Amount : Rs. " + ns*522.50 + "/-(Inclusive of all taxes)";
            }
            document.getElementById("demo").innerHTML = amount;
        }
        function dataCheck1()
        {
          if(confirm("On clicking 'OK' you will be directed to payment page.")) document.location="1.html";
        }

        function clearField()  {
          document.getElementById("demo").innerHTML = '';          
          document.getElementById("data1").value = '';
        }
        function clearField1()  {
          document.getElementById("eddemo").innerHTML = '';          
          document.getElementById("ed1").value = '';
        }
        function clearField2()  {
          document.getElementById("jbdemo").innerHTML = '';          
          document.getElementById("jb1").value = '';
        }
  function clearField3()  {
          document.getElementById("nudemo").innerHTML = '';          
          document.getElementById("nu1").value = '';
        }
        function script()
        {
        	if(document.getElementById("demo").innerHTML != '') 
              document.getElementById("demo").innerHTML = ''
        	var amount;
        	var n=document.getElementById("data1").value;
        	if(document.getElementById("data2").checked)
        	{
        		var val=document.getElementById("data2").value;
        		amount = "Amount : Rs. " + n*2022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("data3").checked)
        	{
        		var val=document.getElementById("data3").value;
        		amount = "Amount : Rs. " + n*1022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("data4").checked)
        	{
        		var val=document.getElementById("data4").value;
        		amount = "Amount : Rs. " + n*522.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	
        	document.getElementById("demo").innerHTML = amount;
        }
        function script1()
        {
        	if(document.getElementById("eddemo").innerHTML != '') 
              document.getElementById("eddemo").innerHTML = ''
        	var amount;
        	var n=document.getElementById("ed1").value;
        	if(document.getElementById("ed2").checked)
        	{
        		var val=document.getElementById("ed2").value;
        		amount = "Amount : Rs. " + n*2022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("ed3").checked)
        	{
        		var val=document.getElementById("ed3").value;
        		amount = "Amount : Rs. " + n*1022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("ed4").checked)
        	{
        		var val=document.getElementById("ed4").value;
        		amount = "Amount : Rs. " + n*522.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	
        	document.getElementById("eddemo").innerHTML = amount;
        }
        function script2()
        {
        	if(document.getElementById("jbdemo").innerHTML != '') 
              document.getElementById("jbdemo").innerHTML = ''
        	var amount;
        	var n=document.getElementById("jb1").value;
        	if(document.getElementById("jb2").checked)
        	{
        		var val=document.getElementById("jb2").value;
        		amount = "Amount : Rs. " + n*2022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("jb3").checked)
        	{
        		var val=document.getElementById("jb3").value;
        		amount = "Amount : Rs. " + n*1022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("jb4").checked)
        	{
        		var val=document.getElementById("jb4").value;
        		amount = "Amount : Rs. " + n*522.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	
        	document.getElementById("jbdemo").innerHTML = amount;
        }
        function script3()
        {
        	if(document.getElementById("nudemo").innerHTML != '') 
              document.getElementById("nudemo").innerHTML = ''
        	var amount;
        	var n=document.getElementById("nu1").value;
        	if(document.getElementById("nu2").checked)
        	{
        		var val=document.getElementById("nu2").value;
        		amount = "Amount : Rs. " + n*2022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("nu3").checked)
        	{
        		var val=document.getElementById("nu3").value;
        		amount = "Amount : Rs. " + n*1022.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	if(document.getElementById("nu4").checked)
        	{
        		var val=document.getElementById("nu4").value;
        		amount = "Amount : Rs. " + n*522.50 + "/-(Inclusive of all taxes)";
        		alert(val);
        	}
        	
        	document.getElementById("nudemo").innerHTML = amount;
        }
        
  </script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<a class="navbar-brand" href="UserPage.jsp"> <img
			src="home_icon.png" width="30" height="30" alt="logo">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> City </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Hyderabad</a> <a
							class="dropdown-item" href="#">Mumbai</a> <a
							class="dropdown-item" href="#">Chennai</a> <a
							class="dropdown-item" href="#">Delhi</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link"
					href="contactususer.jsp">Contact Us<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item active"><a class="nav-link"
					href="aboutususer.jsp">About Us<span class="sr-only">(current)</span></a>
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
</div>
			<!-- <a href="viewTransactions" class="btn btn-outline-primary" style="margin-right: 10px;">Your Transactions</a>
				 <a href="viewProfile" class="btn btn-outline-primary" 
				 style="margin-right: 10px;">View Profile</a>
				 <a href="LogoutServlet" class="btn btn-outline-primary"
				style="margin-right: 10px;">Log Out</a> -->
				<!-- <a href="LogoutServlet" class="btn btn-outline-primary"
				style="margin-right: 10px;">Welcome</a> -->
		</div>
	</nav>
	<div id="carouselExampleControls" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="1.jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="3.jpeg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="4.jpeg" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleControls"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<br>
	<br>
	<div class="container-fluid">
            <div class="row">
              <div class="col-sm-3 col-md-3 col-lg-3">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="download (5).jpg" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Marshmellow</h5>
                            <p class="card-text"><img src="downloadheart.png" style="height: 15px;width: 15px">&nbsp;95%</p>
                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#Marshmellow">Book Now</a>
                        </div>
                </div>
              </div>
                <div class="col-sm-3 col-md-3 col-lg-3">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="images (4).jpg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Ed Shreen World Tour</h5>
                                <p class="card-text"><img src="downloadheart.png" style="height: 15px;width: 15px">&nbsp;98%</p>
                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#Ed-Shreeen">Book Now</a>
                            </div>
                    </div>
                </div>
              <div class="col-sm-3 col-md-3 col-lg-3">
                    <div class="card" style="width: 18rem;">
                            <img class="card-img-top" src="C4sCklAWEAEgGoM.jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Justin Beiber Purpose Tour</h5>
                                    <p class="card-text"><img src="downloadheart.png" style="height: 15px;width: 15px">&nbsp;98%</p>
                                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#JB">Book Now</a>
                                </div>
                        </div>
              </div>
              <div class="col-sm-3 col-md-3 col-lg-3">
                    <div class="card" style="width: 18rem;">
                            <img class="card-img-top" src="download (4).jpg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title">Nucleya</h5>
                                    <p class="card-text"><img src="downloadheart.png" style="height: 15px;width: 15px">&nbsp;92%</p>
                                    <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#Nucleya">Book Now</a>
                                </div>
                        </div>
              </div>
            </div>

      </div>

<div class="modal fade" id="Marshmellow" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Select Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="Event" method="post">
        <input type="text" name="eventName" value="Marshmellow Concert" readonly><br><br>
          <input type="radio" name="Category"  value="Gold" id="data2" onchange="javascript:clearField();" required><img src="download.png" style="height: 20px; width: 20px">&nbsp;Gold 2001/-<br>
    <br>
    <input type="radio" name="Category" value="Silver" id="data3" onchange="javascript:clearField();"><img src="download (1).png" style="height: 20px; width: 20px">&nbsp;Silver 1001/-<br><br>
    
    <input type="radio" name="Category" value="Bronze" id="data4" onchange="javascript:clearField();"><img src="download (2).png" style="height: 20px; width: 20px">&nbsp;Bronze 501/-<br>
    <br>
       
        <p style="font-weight:600">No.of Seats&nbsp;: &nbsp;<input type="number" name="noofseats" id="data1" min="1" max="8" required></p>
        <p id="demo"></p>


       <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="script()">Get Amount</button>
                  <button type="submit" class="btn btn-success" >Proceed to Pay</button>
                </div>
                 </form>
    </div>
  </div>
</div>
</div>
<div class="modal fade" id="Ed-Shreeen" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Select Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="Event" method="post">
        <input type="text" name="eventName" value="Ed-Sheeran World Tour" readonly><br><br>
          <input type="radio" name="Category" value="Gold" id="ed2" onchange="javascript:clearField1();" required><img src="download.png" style="height: 20px; width: 20px">&nbsp;Gold 2002/-<br>
    <br>
    <input type="radio" name="Category" value="Silver" id="ed3" onchange="javascript:clearField1();"><img src="download (1).png" style="height: 20px; width: 20px">&nbsp;Silver 1002/-<br><br>
    
    <input type="radio" name="Category" value="Bronze" id="ed4" onchange="javascript:clearField1();"><img src="download (2).png" style="height: 20px; width: 20px">&nbsp;Bronze 502/-<br>
    <br>
        
        <p style="font-weight:600">No.of Seats&nbsp;: &nbsp;<input type="number" name="noofseats" id="ed1" min="1" max="8" required></p>
        <p id="eddemo"></p>

       <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="script1()">Get Amount</button>
                  <button type="submit" class="btn btn-success" >Proceed to Pay</button>
                </div>
                </form>
    </div>
    </div>
  </div>
</div>
<div class="modal fade" id="JB" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Select Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="Event" method="post">
        <input type="text" name="eventName" value="Justin Bieber Purpose Tour" readonly><br><br>
          <input type="radio" name="Category" value="Gold" id="jb2" onchange="javascript:clearField2();" required><img src="download.png" style="height: 20px; width: 20px">&nbsp;Gold 2003/-<br>
    <br>
    <input type="radio" name="Category" value="Silver" id="jb3" onchange="javascript:clearField2();"><img src="download (1).png" style="height: 20px; width: 20px">&nbsp;Silver 1003/-<br><br>
    
    <input type="radio" name="Category" value="Bronze" id="jb4" onchange="javascript:clearField2();"><img src="download (2).png" style="height: 20px; width: 20px">&nbsp;Bronze 503/-<br>
    <br>
        
        <p style="font-weight:600">No.of Seats&nbsp;: &nbsp;<input type="number" name="noofseats" id="jb1" min="1" max="8" required></p>
        <p id="jbdemo"></p>

       <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="script2()">Get Amount</button>
                  <button type="submit" class="btn btn-success">Proceed to Pay</button>
                </div>
                </form>
                </div>
    </div>
  </div>
</div>
<div class="modal fade" id="Nucleya" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Select Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="Event" method="post">
        <input type="text" name="eventName" value="Nucleya Concert" readonly><br><br>
          <input type="radio" name="Category" value="Gold" id="nu2" onchange="javascript:clearField3();" required><img src="download.png" style="height: 20px; width: 20px">&nbsp;Gold 2004/-<br>
    <br>
    <input type="radio" name="Category" value="Silver" id="nu3" onchange="javascript:clearField3();"><img src="download (1).png" style="height: 20px; width: 20px">&nbsp;Silver 1004/-<br><br>
    
    <input type="radio" name="Category" value="Bronze" id="nu4" onchange="javascript:clearField3();"><img src="download (2).png" style="height: 20px; width: 20px">&nbsp;Bronze 504/-<br>
    <br>
        
        <p style="font-weight:600">No.of Seats&nbsp;: &nbsp;<input type="number" name="noofseats" id="nu1" min="1" max="8" required></p>
        <p id="nudemo"></p>
      

       <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" onclick="script3()">Get Amount</button>
                  <button type="submit" class="btn btn-success" >Proceed to Pay</button>
                </div>
                </form>
                </div>
    </div>
  </div>
</div>
</body>
</html>