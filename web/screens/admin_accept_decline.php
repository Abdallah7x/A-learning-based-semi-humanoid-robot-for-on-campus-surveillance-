<?php
REQUIRE_ONCE "../classes/users.php";
$Users = new Users;
$results = $Users->viewPendingUsers();

?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
<title>Sharm El-Sheikh School - admin</title>
</head>
<body>
 <div>
 <?php include 'nav.php';?>
</div>
<!-- <div class="sidetab" id="myTopnav" style=" background-color: grey;">
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
       <i class="fa fa-bars"></i>
     </a>
  <div class="admintitle" style="left:0px;">
  
  </div>
  </div>
 -->

   <div class="boxstudents" style="background-color: red;  "><h1 class="boxtext1" >Pending Tickets</h1></div>

   <div class="tablev" style="width: 985px;top: 150px;left: 332px;">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Fullname</th>
          
          <th scope="col">Action</th> 
          <th scope="col">Date</th> 
         
          <th scope="col">Time</th>
          <th scope="col">View/Edit</th>
          <th scope="col">Accept</th>
          <th scope="col">Reject</th>
        </tr>
      </thead>
      <tbody>
          <?php
          $counter =1;

          while ($row = mysqli_fetch_array($results)){
              echo "<tr>";
              echo '<th scope = "row">'.$counter.'</th>';
              echo '<td>'.$row['users'].'</td>';
             
              echo '<td>'.$row['action'].'</td>';
              echo '<td>'.$row['date'].'</td>';
              echo '<td>'.$row['time'].'</td>';
             
              
              
              echo '<td> <a href="viewticket.php?uid='.$row['ticket_id'].'&ut=2&ust=7">View Ticket </a> </td>';
              echo '<td> <a href="AcceptSudent.php?uid='.$row['ticket_id'].'&ut=2&ust=7">Accept Ticket </a> </td>';
              echo '<td> <a href="declineAddmission.php?uid='.$row['ticket_id'].'&ut=2&ust=7">Decline Ticket </a> </td>';
              
              $counter++;
              echo "</tr>";
          }
          ?>

      </tbody>
    </table>
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
</script>

</body>
</html>
