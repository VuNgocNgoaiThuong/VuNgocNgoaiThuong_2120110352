<?php

use App\Models\User;
use App\Libraries\MyClass;

if (isset($_POST['THEM'])) {
    $customer = new User();
    //Lấy từ form
    $customer->name = $_POST['name'];
    $customer->username = $_POST['username'];
    $customer->password = sha1($_POST['password']);
    $customer->email = $_POST['email'];
    $customer->address = $_POST['address'];
    $customer->phone = $_POST['phone'];
    $customer->roles = 0;

    $customer->status = $_POST['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        $target_dir = "../public/images/customer/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $customer->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $customer->image = $filename;
        }
    }



    //tự sinh ra

    $customer->created_at = date('Y-m-d H:i:s');
    $customer->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    if ($_POST['password'] != $_POST['password_re']) {
        MyClass::set_flash('message', ['msg' => 'Mật khẩu không khớp', 'type' => 'danger']);
        header("location:index.php?option=customer=create");
    }
    var_dump($customer);
    //Lưu vào CSDL
    //insert into customer
    $customer->save();
    //Chuyển hướng về index
    MyClass::set_flash('message', ['msg' => 'Thêm thành công', 'type' => 'success']);
    header("location:index.php?option=customer");
}

if (isset($_POST['CAPNHAT'])) {
    $id = $_POST['id'];
    $customer = User::find($id);
    if ($customer == null) {
        MyClass::set_flash('message', ['msg' => 'Lỗi trang 404', 'type' => 'danger']);
        header("location:index.php?option=customer");
    }
    //Lấy từ form
    $customer->name = $_POST['name'];
    $customer->username = $_POST['username'];
    $customer->password = sha1($_POST['password']);
    $customer->email = $_POST['email'];
    $customer->address = $_POST['address'];
    $customer->phone = $_POST['phone'];
    $customer->roles = 0;
    $customer->status = $_POST['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        //xoa hinh cu


        //them hinh moi
        $target_dir = "../public/images/customer/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $customer->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $customer->image = $filename;
        }
    }



    //tự sinh ra

    $customer->updated_at = date('Y-m-d H:i:s');
    $customer->updated_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($customer);
    //Lưu vào CSDL
    //insert into customer
    $customer->save();
    //Chuyển hướng về index
    MyClass::set_flash('message', ['msg' => 'Sửa thành công', 'type' => 'success']);
    header("location:index.php?option=customer");
}
