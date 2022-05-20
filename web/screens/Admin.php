<?php
REQUIRE_ONCE "../classes/tickets.php";
$Tickets = new Tickets;

$results = $Tickets->viewtickets();

?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<link rel="stylesheet" type="text/css" href="css/history.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<title>Admin</title>
<!-- <style>
  .container_up{
    background-color: rgb(0,0,0,0.6);
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
</style> -->
</head>

<body>
  <div >
<?php include 'nav_dashboard.php';?>
  </div>
 <!--  <img class="haha" src="miu-logo.jpeg">
<div class="topnav">
  <a  href="#loginas">Logout <i class="fa fa-sign-out"></i></a> 

  <h3 class="admintoptext" style="color: white;">My Dashboard<h3>
  
 <h1><img src="logo.png" height="150px" width="150px"></h1> -->
   <!-- <a  href="#home">Home</a> 
      <a  href="#news">News</a>  
      <a  href="#contact">Contact</a>  
      <a  href="#about">About</a>  
      <a  href="#loginas">Login</a> --> 
   
 <!--  </div>
  <div class="boxxes" >

    <br>
  
  <div class="container_up">
   <form method="post" class="med7at">
       <input type="submit" name="pending" class="boxtext box4" value="Pending Tickets">
        <input type="submit" name="parent" class="boxtext box2" value="Parent">-->
     <!--   <input type="submit" name="published" class="boxtext box4" value="Published Tickets">
       <input type="submit" name="reports" class="boxtext box4" value="Reports">
       <input type="submit" name="history" class="boxtext box4" value="Tickets History">
    </form>
  </div>



  </div> --> 

  <div class="tablev">
   <input type="text" id="myInput" style="background-color:white;color:black;" onkeyup="myFunction()" placeholder="Search for first names.." title="Type in a name">
  <table class="table" id="myTable">
  <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Action</th>
          <th scope="col">Image</th>
          <th scope="col">Date</th>
          <th scope="col">Time</th>
          <th scope="col">Users</th>
        </tr>
      </thead>
      <tbody>
          <?php
          $counter =1;

          while ($row = mysqli_fetch_array($results)){
              echo "<tr>";
              echo '<th scope = "row">'.$counter.'</th>';
              echo '<td>'.$row['action'].'</td>';
              echo '<td>'.$row['image'].'</td>';
              echo '<td>'.$row['date'].'</td>';
              echo '<td>'.$row['time'].'</td>';
              echo '<td>'.$row['users'].'</td>';
              
              $counter++;
              echo "</tr>";
          }
          ?>

      </tbody>
    </table>
  
  

<div>
<?php include 'footer.php';?>
</div>
        </div>
<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "sidetab") {
    x.className += " responsive";
  } else {
    x.className = "sidetab";
  }
}

function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) 
    {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</body>
</html>
