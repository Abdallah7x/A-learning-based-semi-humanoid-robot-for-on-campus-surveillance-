<?php
REQUIRE_ONCE ("../classes/DBconnect.php");
class usersModel{
    public $userID;
    public $userFName;
    public $userMName;
    public $userLName;
    public $email;
    public $phoneNo;
    public $Age;
    public $Gender;
    public $UserType;
    public $img;
    public function AddUsers(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "INSERT INTO users (`userID`,`fname`,`mname`,`lname`,`email`,`phoneNo`,`age`,`gender`,`usertypeID`,`Status`)
      VALUES (null,'$this->userFName','$this->userMName','$this->userLName','$this->email','$this->phoneNo','$this->Age','$this->Gender','$this->UserType',1)";
      $result= $mysqli->query($query);
      return $result;
    }

    public function Addmember($UserName,$Password){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "INSERT INTO users (`userID`,`fname`,`mname`,`lname`,`email`,`phoneNo`,`age`,`gender`,`usertypeID`,`Status`)
      VALUES (null,'$this->userFName','$this->userMName','$this->userLName','$this->email','$this->phoneNo','$this->Age','$this->Gender','$this->UserType',2)";
      $result= $mysqli->query($query);
      $query2 = "INSERT INTO login (`loginID`,`username`,`password`)
      VALUES (null,'$UserName','$Password')";
      $result2= $mysqli->query($query2);
     
    }

    public function stats(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT count(*) as counter ,usertype.usertypeName FROM `users` INNER JOIN usertype on users.usertypeID = usertype.usertypeID group BY users.usertypeID";
      $result= $mysqli->query($query);
      return $result;
    }

    public function stats2(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT Count(*) as counter,userstatus.userStatusName , usertype.usertypeName 
      FROM `users` 
      inner join userstatus on users.Status = userstatus.userStatusID 
      inner join usertype on users.usertypeID = usertype.usertypeID 
      GROUP BY userstatus.userStatusName , usertype.usertypeID";
      $result= $mysqli->query($query);
      return $result;
    }

    public function login($username,$password){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users INNER JOIN login  ON (login.userid = users.userID)
       INNER JOIN usertype ON (usertype.usertypeID = users.usertypeID) 
       INNER JOIN Pages ON (Pages.PageID = usertype.PageID) 
       where login.username = '$username' and login.password='$password'";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewAllUsers(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewAllClass(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from class";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewschedule($name){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT image from class where name='$name'";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewAllSubject(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * FROM subject";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewAllStudent(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * FROM student";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewPendingUsers(){
      #view new students(pending)
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users where Status = 1 and userTypeID = 2";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewAcceptedUsers(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users where Status = 2";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewSpecificUserType(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users where usertypeID = '$this->UserType'";
      $result= $mysqli->query($query);
      return $result;
    }


    public function GetUserType(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users INNER JOIN login  ON (login.userid = users.userID) 
      INNER JOIN usertype ON (usertype.usertypeID = users.usertypeID) ";
      $result= $mysqli->query($query);
      return $result;
    }
    

    public function viewSpecificStudent($UserID){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * FROM student INNER JOIN class ON student.class_id = class.class_id where student.userID = '$UserID'";
      $result= $mysqli->query($query);
      return $result;
    }
    
    public function viewSpecificUser($UserID){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users where userID = '$UserID'";
      $result= $mysqli->query($query);
      return $result;
    }

    public function acceptAddmission($userID,$UserType,$UserName,$Password){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "INSERT INTO login (`loginID`,`username`,`password`,`userid`)
      VALUES (null,'$UserName','$Password','$userID')";
      $result= $mysqli->query($query);
      $query = "UPDATE users SET Status = '2',usertypeID='$UserType' WHERE userID = '$userID'";
      $result= $mysqli->query($query);
    }

    public function declineAddmission($userID){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
    $query = "DELETE FROM users WHERE userID = '$userID'";
    $result= $mysqli->query($query);

    }

    public function viewPendingEUsers(){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users where Status = 1 and userTypeID = 5";
      $result= $mysqli->query($query);
      return $result;
    }

    public function viewallUserType($UserType){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "SELECT * from users where Status = 2 and userTypeID = '$UserType'";
      $result= $mysqli->query($query);
      return $result;
    }

    public function updateUser($userID){
      $db = dbconnect::getInstance();
      $mysqli = $db->getConnection();
      $query = "UPDATE users SET fname='$this->userFName' ,mname='$this->userMName' ,lname='$this->userLName',email='$this->email',phoneNo='$this->phoneNo',age='$this->Age',image='$this->img' WHERE userID = '$userID'";
      $result= $mysqli->query($query);
      return $result;
    }

}


?>
