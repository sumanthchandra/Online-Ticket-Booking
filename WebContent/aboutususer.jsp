<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>
		
	</title>
		<meta charset="UTF-8">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Fjalla+One|Poppins|Supermercado+One" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
                    <a class="nav-link" href="contactususer.jsp">Contact Us<span class="sr-only">(current)</span></a>
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
</div>
        </div>
      </nav>

<br>
<br>
<br>
	<div class="ct-pageWrapper" id="ct-js-wrapper">
  <div class="story-section company-sections ct-u-paddingBoth100 paddingBothHalf noTopMobilePadding" id="section">
    <div class="container text-center">
      <h2 style="font-family: 'Fjalla One', sans-serif;">WHAT DRIVES US</h2>
      <h3 style="font-family: 'Fjalla One', sans-serif;">Think Music...... We've got you covered</h3>
      <div class="col-md-8 col-md-offset-2">
        <div class="red-border"></div>
        <p style="text-align: justify-all;font-family: 'Poppins', sans-serif;">We provide the best in class user experience . A bunch of young and enthusisastic developers teamed up to design this webisite to give the best online ambience.</p>
        <!-- <a class="ct-u-marginTop60 btn btn-solodev-red btn-fullWidth-sm ct-u-size19" href="#">Learn More</a> -->
      </div>
    </div>
  </div>
  <section class="culture-section company-sections ct-u-paddingBoth100 paddingBothHalf noTopMobilePadding">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <h2 style="font-family: 'Fjalla One', sans-serif;">What's New !</h2>
          <h3 style="font-family: 'Fjalla One', sans-serif;">Features</h3>
          
        </div>
      </div>
      <div class="row ct-u-paddingBoth20">
        <div class="col-xs-6 col-md-4">
          <div class="company-icons-white">
            <i class="fa fa-filter" aria-hidden="true"></i>
            <p style="font-weight: 600">FILTER</p>
            <p class="company-icons-subtext hidden-xs">This feature gives the best search experience based on your preference	.</p>
          </div>
        </div>
        <div class="col-xs-6 col-md-4">
          <div class="company-icons-white">
            <i class="fa fa-gamepad" aria-hidden="true"></i>
            <p style="font-weight: 600">LOYALTY POINTS</p>
            <p class="company-icons-subtext hidden-xs">Based on your number of bookings you receive loyalty points.</p>
          </div>
        </div>
        <div class="col-xs-6 col-md-4">
          <div class="company-icons-white">
            <i class="fa fa-money" aria-hidden="true"></i>
            <p style="font-weight: 600">DISCOUNT</p>
            <p class="company-icons-subtext hidden-xs">Based on your loyalty points you get discounts on your bookings.</p>
          </div>
        </div>
      </div>
      <div class="row ct-u-paddingBoth20">
        <div class="col-xs-6 col-md-4">
          <div class="company-icons-white">
            <i class="fa fa-money" aria-hidden="true"></i>
            <p style="font-weight: 600">LESS TAXES</p>
            <p class="company-icons-subtext hidden-xs">Unlike other platforms ,we charge less internet handling charges on your bookings .</p>
          </div>
        </div>
        <div class="col-xs-6 col-md-4">
          <div class="company-icons-white">
            <i class="fa fa-cc-visa"></i>
            <p style="font-weight: 600">PAYMENT GATEWAY</p>
            <p class="company-icons-subtext hidden-xs">We provide the amount required to pay immediatly after the selection of your seats.</p>
          </div>
        </div>
        
        <div class="col-xs-6 col-md-4">
          <div class="company-icons-white">
            <i class="fa fa-lock"></i>
            <p style="font-weight: 600">PRIVACY</p>
            <p class="company-icons-subtext hidden-xs">We will not share your booking history to third party organisations.</p>
          </div>
        </div>
      </div>
     
    </div>
  </section>
</div>
<section class="customers-section company-sections ct-u-paddingBoth100 paddingBothHalf noTopMobilePadding">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <h2 style="font-family: 'Fjalla One', sans-serif;">Co-Sponsored by</h2>
        </div>
        <div class="clearfix">
      </div>
    </div>
  </section>
<main>
  <div class="container ct-u-paddingTop40 ct-u-paddingBottom100">
    <div class="row">
      <div class="col-md-12 ct-content">
        <section class="clients-home">
          <div class="container">
            <div class="clients-logos text-center">
              <div class="row">
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/zeina.html" class="Zeina"><img alt="https://www.solodev.com/assets/clients/logo-zeina.png" src="https://www.solodev.com/assets/clients/logo-zeina.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Zeina - 0</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/logic.html" class="Logic"><img alt="https://www.solodev.com/assets/clients/logic.png" src="https://www.solodev.com/assets/clients/logic.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Logic</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/smart.html" class="Smart"><img alt="https://www.solodev.com/assets/clients/client3.png" src="https://www.solodev.com/assets/clients/client3.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Smart</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/softtech.html" class="Softtech"><img alt="https://www.solodev.com/assets/clients/softtech.png" src="https://www.solodev.com/assets/clients/softtech.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Softtech</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/wheel.html" class="Wheel"><img alt="https://www.solodev.com/assets/clients/logo-target.png" src="https://www.solodev.com/assets/clients/logo-target.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Wheel</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/3designs.html" class="3designs"><img alt="https://www.solodev.com/assets/clients/designx.png" src="https://www.solodev.com/assets/clients/designx.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">3designs</div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/heart.html" class="Heart"><img alt="https://www.solodev.com/assets/clients/client7.png" src="https://www.solodev.com/assets/clients/client7.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Heart</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/devtech.html" class="Devtech"><img alt="https://www.solodev.com/assets/clients/devtech.png" src="https://www.solodev.com/assets/clients/devtech.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Devtech</div>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 client-logos-repeater">
                  <a href="/path/to/detail/chartz.html" class="Chartz"><img alt="https://www.solodev.com/assets/clients/chartz.png" src="https://www.solodev.com/assets/clients/chartz.png"></a>
                  <div class="logo-title">
                    <div class="displayTable">
                      <div class="displayTableCell">Chartz</div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
</main>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Keep me logged in</label>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Log In</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header"
      >
        <h5 class="modal-title" id="exampleModalCenterTitle">Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
  <div class="form-group">
    <div class="form-group">
    <label for="exampleInputfirstname">First Name</label>
    <input type="text" class="form-control" id="exampleInputfirstname" placeholder="First name">
  </div>
  <div class="form-group">
    <label for="exampleLastname">Last Name</label>
    <input type="password" class="form-control" id="exampleLastname" placeholder="Last name">
  </div>
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Confirm Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">I Agree to terms and conditions</label>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Sign Up</button>
      </div>
    </div>
  </div>
</div>
 <div class="modal" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Filter by</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                        <h style="font-weight: bold">Language</h><br>
                        <input type="checkbox" name="Language">&nbsp;English<br>
                        <input type="checkbox" name="Language">&nbsp;Telugu<br>
                        <input type="checkbox" name="Language">&nbsp;Hindi<br><br>
                        <h style="font-weight: bold">Categories</h><br>
                        <input type="checkbox" name="Language">&nbsp;Chamber Orchestra Concerts<br>
                        <input type="checkbox" name="Language">&nbsp;Children's or Family Concerts<br>
                        <input type="checkbox" name="Language">&nbsp;Choral Music<br>
                        <input type="checkbox" name="Language">&nbsp;Concert Band Concerts<br>
                        <input type="checkbox" name="Language">&nbsp;Opera<br>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div>


</body>
</html>