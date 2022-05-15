<?php
include_once("../Controller/userController.php");

class ViewUsers{

public function navigation(){
  echo'<div class="topnav1" style="background-color: #08356a;" id="myTopnav">
  <a href="index.html" style="float:left; "> <img src="logo.png" class="logo"></a>
  <a href="login.php" id="active">Portal</a>
  <a href="admission-employment2.php" >Employment</a>
  <a href="newstudents2.php" >Admission</a>
  <a href="about.php">About Us</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
   
  </div>';
}
public function loginForm(){
echo'  <form  method = "POST" action = "../Controller/userController.php">
    <br>
    <img src="logo-miu.png" class="formlogo"><br>
  <b><label class="label1" pattern="^[A-Za-z]+"  for="fname">Username:</label></b><br>
  <input class="input1" type="text" id="fname" name="username" required><br>
  <b><label class="label1" for="lname">Password:</label> </b><br>
  <input class="input2" type="password" id="lname" name="password" required><br>
  <b><input class="mission12" style="margin-left:310px;"type="submit" name ="loginSubmit" value ="Log In"></b>
  </form>';
}
public function admissionEmployment2(){
echo '      <form action="admission-employment3.php">
    <label class="label2" for="fname" >First name:</label><br>
    <input  class="input4" type="text" id="fname" name="fname" pattern="^[A-Za-z]+"  required><br>
    <label class="label2" for="lname">Middle name:</label><br>
    <input   class="input4" type="text" id="lname" name="mname" pattern="^[A-Za-z]+"  required><br>
    <label class="label2" for="fname">Last name:</label><br>
    <input  class="input4" type="text" id="fname" name="lname" pattern="^[A-Za-z]+"  required><br>
    <label class="label2" for="lname">Phone number:</label><br>
    <input  class="input4" type="number" id="lname" name="phoneNumer"  required><br>
    <label class="label2" for="fname">Age:</label><br>
    <input   class="input4" type="number" id="fname" name="age"  required><br>
    <b><input class="mission12" style="margin-left:390px;"type="submit" value ="NEXT"></b>
  </form>';

}

public function admissionEmployment3($fname,$mname,$lname,$phonenumber,$age){
echo'<form method="POST" style="color:white;" action = "../Controller/userController.php">
<input class="input" name="fname" value="'.$fname.'" hidden >
<input name="mname" value="'.$mname.'" hidden>
<input name="lname" value="'.$lname.'" hidden>
<input name="phoneNumer" value="'.$phonenumber.'" hidden>
<input name="age" value="'.$age.'" hidden>
   <label  for="fname">Gender:</label><br>
   <select name ="gender" class="input1" style="background-color:#009bcf;">
     <option class="text" value="M">Male</option>
     <option class="text" value="F">Female</option>
 </select><br>
   <label  for="lname">Email:</label><br>
   <input class="input1"  style="background-color:#009bcf;" type="email" id="lname" name="email"  required><br>
   <b><input class="mission12" style="margin-left:280px;" name="butsub" type="submit" value ="SUBMIT"></b>
</form>';

}

public function AcceptStudent($uid,$ut){

$row= getAcceptUser($uid);
$name = $row['fullname'];
$username = $row['fname'] . "_".$row['userID'];
echo'
<form  method = "POST" action = "../Controller/userController.php">
 <br>
 <input name="ut" value="'.$ut.'" hidden>
 <input name="uid" value="'.$uid.'" hidden>
 <label class="label1"  style="color:black;margin-left: -50px;font-weight: bold;" for="fname" pattern="^[A-Za-z]+">Name:</label><br>
<input class="input1" type="text" value= "'.$users.'"><br>
<label class="label1"  style="color:black;margin-left: -50px;" for="fname">Username:</label><br>
<input class="input1" type="text" id="fname" name="username" value = "'.$username.'"><br>
<label class="label1" style="color:black;margin-left: -50px;" for="lname">Password:</label><br>
<input class="input1" type="password" id="lname" name="password"><br>
<b><input class="mission12" type="submit" name="AcceptStudent" value ="Log In"></b>
</form>
';

}

public function newStudent2(){
  echo'<form action="newstudents3.php">
    <label class="label1" for="fname">First name:</label><br>
    <input class="input1" type="text" id="fname" name="fname"  required pattern="^[A-Za-z]+"><br>
    <label class="label1" for="lname">Middle name:</label><br>
    <input class="input1" type="text" id="lname" name="mname"  required pattern="^[A-Za-z]+"><br>
    <label class="label1" for="fname">Last name:</label><br>
    <input class="input1" type="text" id="fname" name="lname"  required pattern="^[A-Za-z]+"><br>
    <label class="label1" for="lname">Phone number:</label><br>
    <input class="input1" type="number" id="lname" name="phoneNumer"  required ><br>
    <label class="label1" for="fname">Age:</label><br>
    <input class="input1" type="number" id="fname" name="age"  required><br>
    <b><input class="mission12" style="margin-left:300px;"type="submit" value ="NEXT"></b>
</form> ';
}


public function newStudent3($fname,$mname,$lname,$phonenumber,$age){
echo'<form method="POST" style="color:white;" action = "../Controller/userController.php">
<input name="fname" value="'.$fname.'" hidden>
<input name="mname" value="'.$mname.'" hidden>
<input name="lname" value="'.$lname.'" hidden>
<input name="phoneNumer" value="'.$phonenumber.'" hidden>
<input name="age" value="'.$age.'" hidden>
   <label  for="fname"  >Gender:</label><br>
   <select name ="gender" class="input1">
     <option class="text" value="M">Male</option>
     <option class="text" value="F">Female</option>
 </select><br>
   <label  for="lname">Email:</label><br>
   <input class="input1"  type="email" id="lname" name="email"  required><br>
   <b><input class="mission12" name="newStudent" style="margin-left:300px;"type="submit" value ="SUBMIT"></b>
</form>';

}






}




 ?>
