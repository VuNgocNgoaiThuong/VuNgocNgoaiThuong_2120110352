<?php

use App\Models\Menu;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Topic;
use App\Models\Post;
use App\Libraries\MyClass;

if (isset($_POST['ADDCATEGORY'])) {
    if (isset($_POST['categoryid'])) {
        $list_categoryid = $_POST['categoryid'];
        foreach ($list_categoryid as $id) {
            $category = Category::find($id);
            $menu = new Menu();
            //Lấy từ form
            $menu->name = $category->name;
            $menu->link = 'index.php?option=product&cat=' . $category->slug;
            $menu->table_id = $id;
            $menu->type = 'category';
            $menu->sort_order = 1;
            $menu->position = $_POST['position'];
            $menu->parent_id = 0;
            $menu->level = 1;
            $menu->status = 2;
        

            $menu->created_at = date('Y-m-d H:i:s');
            $menu->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
            var_dump($menu);
            //Lưu vào CSDL
            //insert into menu
            $menu->save();
            //Chuyển hướng về index
            MyClass::set_flash('message', ['msg' => 'Thêm thành công', 'type' => 'success']);
        }
    } else {
        MyClass::set_flash('message', ['msg' => 'Chưa chọn danh mục', 'type' => 'danger']);
    }
    header("location:index.php?option=menu");
}

if (isset($_POST['ADDBRAND'])) {
    if (isset($_POST['brandid'])) {
        $list_brandid = $_POST['brandid'];
        foreach ($list_brandid as $id) {
            $brand = Brand::find($id);
            $menu = new Menu();
            //Lấy từ form
            $menu->name = $brand->name;
            $menu->link = 'index.php?option=brand&cat=' . $brand->slug;
            $menu->table_id = $id;
            $menu->type = 'brand';
            $menu->sort_order = 1;
            $menu->position = $_POST['position'];
            $menu->parent_id = 0;
            $menu->level = 1;
            $menu->status = 2;
            

            $menu->created_at = date('Y-m-d H:i:s');
            $menu->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
            var_dump($menu);
            //Lưu vào CSDL
            //insert into menu
            $menu->save();
            //Chuyển hướng về index
            MyClass::set_flash('message', ['msg' => 'Thêm thành công', 'type' => 'success']);
        }
    } else {
        MyClass::set_flash('message', ['msg' => 'Chưa chọn thương hiệu', 'type' => 'danger']);
    }
    header("location:index.php?option=menu");
}

if (isset($_POST['ADDTOPIC'])) {
    if (isset($_POST['topicid'])) {
        $list_topicid = $_POST['topicid'];
        foreach ($list_topicid as $id) {
            $topic = Topic::find($id);
            $menu = new Menu();
            //Lấy từ form
            $menu->name = $topic->name;
            $menu->link = 'index.php?option=post&cat=' . $topic->slug;
            $menu->table_id = $id;
            $menu->sort_order = 1;
            $menu->type = 'topic';
            $menu->position = $_POST['position'];
            $menu->parent_id = 0;
            $menu->level = 1;
            $menu->status = 2;
            

            $menu->created_at = date('Y-m-d H:i:s');
            $menu->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
            var_dump($menu);
            //Lưu vào CSDL
            //insert into menu
            $menu->save();
            //Chuyển hướng về index
            MyClass::set_flash('message', ['msg' => 'Thêm thành công', 'type' => 'success']);
        }
    } else {
        MyClass::set_flash('message', ['msg' => 'Chưa chọn chủ đề bài viết', 'type' => 'danger']);
    }
    header("location:index.php?option=menu");
}

if (isset($_POST['ADDPAGE'])) {
    if (isset($_POST['pageid'])) {
        $list_pageid = $_POST['pageid'];
        foreach ($list_pageid as $id) {
            $page = Post::find($id);
            $menu = new Menu();
            //Lấy từ form
            $menu->name = $page->title;
            $menu->link = 'index.php?option=page&cat=' . $page->slug;
            $menu->table_id = $id;
            $menu->type = 'page';
            $menu->sort_order = 1;
            $menu->position = $_POST['position'];
            $menu->parent_id = 0;
            $menu->level = 1;
            $menu->status = 2;
            

            $menu->created_at = date('Y-m-d H:i:s');
            $menu->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
            var_dump($menu);
            //Lưu vào CSDL
            //insert into menu
            $menu->save();
            //Chuyển hướng về index
            MyClass::set_flash('message', ['msg' => 'Thêm thành công', 'type' => 'success']);
        }
    } else {
        MyClass::set_flash('message', ['msg' => 'Chưa chọn tràn đơn', 'type' => 'danger']);
    }
    header("location:index.php?option=menu");
}

if (isset($_POST['ADDCUSTOM'])) {
    if (strlen($_POST['name']) > 0 && strlen($_POST['link']) > 0) {
            $menu = new Menu();
            //Lấy từ form
            $menu->name = $_POST['name'];
            $menu->link = $_POST['link']; 
            $menu->type = 'customer';
            $menu->sort_order = 1;
            $menu->position = $_POST['position'];
            $menu->parent_id = 0;
            $menu->level = 1;
            $menu->status = 2;

            $menu->created_at = date('Y-m-d H:i:s');
            $menu->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
            var_dump($menu);
            //Lưu vào CSDL
            //insert into menu
            $menu->save();
            //Chuyển hướng về index
            MyClass::set_flash('message', ['msg' => 'Thêm thành công', 'type' => 'success']);
        
    } else {
        MyClass::set_flash('message', ['msg' => 'Chưa nhập tên và link', 'type' => 'danger']);
    }
    header("location:index.php?option=menu");
}





if (isset($_menu['CAPNHAT'])) {
    $id = $_menu['id'];
    $menu = Post::find($id);
    if ($menu == null) {
        MyClass::set_flash('message', ['msg' => 'Lỗi trang 404', 'type' => 'danger']);
        header("location:index.php?option=post");
    }
    //Lấy từ form
    $menu->title = $_menu['title'];
    $menu->slug = (strlen($_menu['slug']) > 0) ? $_menu['slug'] : MyClass::str_slug($_menu['title']);
    $menu->detail = $_menu['detail'];
    $menu->topic_id = $_menu['topic_id'];
    $menu->status = $_menu['status'];
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
    MyClass::set_flash('message', ['msg' => 'Sửa thành công', 'type' => 'success']);
    header("location:index.php?option=menu");
}
