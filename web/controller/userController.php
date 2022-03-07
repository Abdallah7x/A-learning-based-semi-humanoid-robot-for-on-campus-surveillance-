<?php
include_once("../Model/usersModel.php");
session_start();

if (isset($_POST['loginSubmit'])){
  loginController();
}

if (isset($_POST['butsub'])){
  addmissionemployment();
}

if (isset($_POST['AcceptStudent'])){
  acceptStudent();
}
if (isset($_POST['newStudent'])){
  newStudent();
}

function loginController(){
  $Users = new usersModel;
  $result = $Users->login($_POST["username"],$_POST["password"]);
  $row = mysqli_fetch_array($result);
  $_SESSION["name"]=$row['fname']." ".$row['mname']." ".$row['lname'];
  $_SESSION['userID']=$row['userID'];
  echo $row["PageName"];
  header("Location:../SSC front end/profile.php");
}

function addmissionemployment(){
$Users = new usersModel;
$Users->userFName=$_POST["fname"];
$Users->userMName=$_POST["mname"];
$Users->userLName=$_POST["lname"];
$Users->email=$_POST["email"];
$Users->phoneNo=$_POST["phoneNumer"];
$Users->Age=$_POST["age"];
$Users->Gender=$_POST["gender"];
$Users->UserType = 5;
$Users->AddUsers();
header("Location: /SE/SSC front end/index.html");
}

function getAcceptUser($uid){
  $Users = new usersModel;
  $results = $Users->viewSpecificUser($_GET["uid"]);
  $row= mysqli_fetch_array($results);
  return $row;
}

function acceptStudent(){
$Users = new usersModel;
$result = $Users->acceptAddmission($_POST['uid'],$_POST['ut'],$_POST["username"],$_POST["password"]);
if($_POST['ut']==5){header("Location: /SE/SSC front end/employees.php");}
else if($_POST['ut']==2){header("Location:/SE/SSC front end/accept-decline.php");}
}

function newStudent(){
  $Users = new usersModel;
  $Users->userFName=$_POST["fname"];
  $Users->userMName=$_POST["mname"];
  $Users->userLName=$_POST["lname"];
  $Users->email=$_POST["email"];
  $Users->phoneNo=$_POST["phoneNumer"];
  $Users->Age=$_POST["age"];
  $Users->Gender=$_POST["gender"];
  $Users->UserType = 2;
  $Users->AddUsers();
  header("Location:front end/index.html");
}





?>
