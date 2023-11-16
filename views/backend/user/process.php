<?php

use App\Models\User;
use App\Libraries\MyClass;

if (isset($_POST['THEM'])) {
    $user = new User();
    //Lấy từ form
    $user->name = $_POST['name'];
    $user->username = $_POST['username'];
    $user->password = sha1($_POST['password']);
    $user->email = $_POST['email'];
    $user->address = $_POST['address'];
    $user->phone = $_POST['phone'];
    $user->roles = 1;

    $user->status = $_POST['status'];
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
    if ($_POST['password'] != $_POST['password_re']) {
        MyClass::set_flash('message', ['msg' => 'Mật khẩu không khớp', 'type' => 'danger']);
        header("location:index.php?option=user=create");
    }
    var_dump($user);
    //Lưu vào CSDL
    //insert into user
    $user->save();
    //Chuyển hướng về index
    MyClass::set_flash('message', ['msg' => 'Thêm thành công', 'type' => 'success']);
    header("location:index.php?option=user");
}

if (isset($_POST['CAPNHAT'])) {
    $id = $_POST['id'];
    $user = User::find($id);
    if ($user == null) {
        MyClass::set_flash('message', ['msg' => 'Lỗi trang 404', 'type' => 'danger']);
        header("location:index.php?option=user");
    }
    //Lấy từ form
    $user->name = $_POST['name'];
    $user->username = $_POST['username'];
    $user->password = sha1($_POST['password']);
    $user->email = $_POST['email'];
    $user->address = $_POST['address'];
    $user->phone = $_POST['phone'];
    $user->roles = 1;
    $user->status = $_POST['status'];
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
    MyClass::set_flash('message', ['msg' => 'Sửa thành công', 'type' => 'success']);
    header("location:index.php?option=user");
}
