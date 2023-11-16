<?php

use App\Models\Menu;
use App\Libraries\MyClass;

if (isset($_POST['THEM'])) {
    $menu = new Menu();
    //Lấy từ form
    $menu->name = $_POST['name'];
    $menu->slug = (strlen($_POST['slug']) > 0) ? $_POST['slug'] : MyClass::str_slug($_POST['name']);
    $menu->parent_id=$_POST['parent_id'];
    //$menu->sort_order=$_POST['sort_order'];
    //$menu->level=1;

    $menu->status = $_POST['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        $target_dir = "../public/images/menu/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $menu->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $menu->image = $filename;
        }
    }



    //tự sinh ra

    $menu->created_at = date('Y-m-d H:i:s');
    $menu->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($menu);
    //Lưu vào CSDL
    //insert into menu
    $menu->save();
    //Chuyển hướng về index
    MyClass::set_flash('message',['msg'=>'Thêm thành công','type'=>'success']);
    header("location:index.php?option=menu");
}

if (isset($_POST['CAPNHAT'])) {
    $id=$_POST['id'];
    $menu = menu::find($id);
    if ($menu == null) {
        MyClass::set_flash('message',['msg'=>'Lỗi trang 404','type'=>'danger']);
        header("location:index.php?option=menu");
    }
    //Lấy từ form
    $menu->name = $_POST['name'];
    $menu->slug = (strlen($_POST['slug']) > 0) ? $_POST['slug'] : MyClass::str_slug($_POST['name']);
    $menu->description = $_POST['description'];
    $menu->status = $_POST['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        //xoa hinh cu


        //them hinh moi
        $target_dir = "../public/images/menu/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $menu->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $menu->image = $filename;
        }
    }



    //tự sinh ra

    $menu->updated_at = date('Y-m-d H:i:s');
    $menu->updated_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($menu);
    //Lưu vào CSDL
    //insert into menu
    $menu->save();
    //Chuyển hướng về index
    MyClass::set_flash('message',['msg'=>'Sửa thành công','type'=>'success']);
    header("location:index.php?option=menu");
}
