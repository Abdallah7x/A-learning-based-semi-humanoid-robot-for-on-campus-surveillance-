<?php

class connectionToDatabase  {
           public $servername = "localhost";
           public $username = "root";
           public $password = "";
           public $dbname = "robotweb";


           public  function ConnectToDataBase(){
           $conn = new mysqli($this->servername, $this->username, $this->password, $this->dbname);
           return $conn;

           }
        }

?>
