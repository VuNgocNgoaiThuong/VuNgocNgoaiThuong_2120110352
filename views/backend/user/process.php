<?php

use App\Models\User;
use App\Libraries\MyClass;

if (isset($_user['THEM'])) {
    $user = new User();
    //Lấy từ form
    $user->name = $_user['name'];
    $user->email = $_user['email'];
    $user->phone = $_user['phone'];

   
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        $target_dir = "../public/images/user/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $user->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $user->image = $filename;
        }
    }



    //tự sinh ra

    $user->created_at = date('Y-m-d H:i:s');
    $user->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($user);
    //Lưu vào CSDL
    //insert into user
    $user->save();
    //Chuyển hướng về index
    header("location:index.php?option=user");
}

if (isset($_user['CAPNHAT'])) {
    $id = $_user['id'];
    $user = user::find($id);
    if ($user == null) {
        header("location:index.php?option=user");
    }
    //Lấy từ form
    $user->name = $_user['name'];
    $user->email = $_user['email'];
    $user->phone = $_user['phone'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        //xoa hinh cu


        //them hinh moi
        $target_dir = "../public/images/user/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $user->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $user->image = $filename;
        }
    }



    //tự sinh ra

    $user->updated_at = date('Y-m-d H:i:s');
    $user->updated_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($user);
    //Lưu vào CSDL
    //insert into user
    $user->save();
    //Chuyển hướng về index
    header("location:index.php?option=user");
}
