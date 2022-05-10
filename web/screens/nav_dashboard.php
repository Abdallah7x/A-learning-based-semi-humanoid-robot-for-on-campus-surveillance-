<!-- <?php
session_start();
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<div class="sidetab" id="myTopnav">
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
       <i class="fa fa-bars"></i>
     </a>
  <div class="admintitle">
    <br>
    <br>
    <br>
    <br>
    <p><b>Admin Profile</b></p>
    <img src='<?php echo $_SESSION['image']; ?>'>
    <p class="profname"><b><?php echo $_SESSION['name']; ?></b></p>
  </div>
  <div class="sidetabs">
    <a href="Admin.php" >My Dashboard</a>
    <a href="pending.php">Pending Tickets</a>
    <a href="pubtickets.php">Published Tickets</a>
    
    <a href="h.php">Tickets History</a>
    <a href="reports.php">Reports</a>
  </div>
</body>
</html> -->
<?php
error_reporting(0);
session_start();
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<style>
  .container_up{
    background-color: rgb(0,0,0,0.3);
      width: 1579px;
      margin:auto;
      position: absolute;
      top:36.9px;
      left: -261px;
      border-radius: 0px 0px 0px 0px;
      height: 280px;

  }
 .med7at{
  margin-left: 150px;
  font-size: 30px;

 }
 .topnav {
  /*overflow: hidden;*/
  background-color: #333;
  margin-left: 200px;

}

.topnav a {
  /*float: left;*/
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  margin-top: 10.5px;
}

.topnav a:hover {
  background-color: white;
  color: black;
}

.topnav a.active {
  background-color: orange;
  color: white;
}
img{
  width: 200px;
  height: 70px;
  position: absolute;
  margin-left:0px;
}
</style>
</head>
<body>
<img class="haha" src="miu-logo.jpeg">
<div class="topnav">
  <a  href="#loginas">Logout <i class="fa fa-sign-out"></i></a> 
  
  <h3 class="admintoptext" style="color: white;">My Dashboard<h3>
  
 <!-- <h1><img src="logo.png" height="150px" width="150px"></h1> -->
   <!-- <a  href="#home">Home</a> 
      <a  href="#news">News</a>  
      <a  href="#contact">Contact</a>  
      <a  href="#about">About</a>  
      <a  href="#loginas">Login</a> --> 
   
  </div>
  <div class="boxxes" >

    <br>
  
  <div class="container_up">

   <form method="post" class="med7at">
       <a href="admin_accept_decline.php"><input type="submit" name="pending" class="boxtext box4" value="Pending Tickets"></a>
       <!-- <input type="submit" name="parent" class="boxtext box2" value="Parent">-->
       <a href="admin_accept_decline.php"><input type="submit" name="published" class="boxtext box4" value="Published Tickets"></a>
       <input type="submit" name="reports" class="boxtext box4" value="Reports">
       <input type="submit" name="history" class="boxtext box4" value="Tickets History">
    </form>
  </div>



  </div>

</body>
</html>