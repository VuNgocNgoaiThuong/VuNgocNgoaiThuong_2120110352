<?php
session_start();
unset($_SESSION['useradmin']);
unset($_SESSION['user_id']);
unset($_SESSION['name']);
unset($_SESSION['image']);
header("location:login.php");


            $_SESSION['user_id'] = $user->id;
            $_SESSION['name'] = $user->$name;
            $_SESSION['image'] = $user->$image;