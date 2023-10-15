<?php

use App\Models\Topic;
use App\Libraries\MyClass;

if (isset($_topic['THEM'])) {
    $topic = new Topic();
    //Lấy từ form
    $topic->name = $_topic['name'];
    $topic->slug = (strlen($_topic['slug']) > 0) ? $_topic['slug'] : MyClass::str_slug($_topic['title']);
    $topic->description = $_topic['description'];

    $topic->status = $_topic['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        $target_dir = "../public/images/topic/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $topic->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $topic->image = $filename;
        }
    }



    //tự sinh ra

    $topic->created_at = date('Y-m-d H:i:s');
    $topic->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($topic);
    //Lưu vào CSDL
    //insert into topic
    $topic->save();
    //Chuyển hướng về index
    header("location:index.php?option=topic");
}

if (isset($_topic['CAPNHAT'])) {
    $id = $_topic['id'];
    $topic = topic::find($id);
    if ($topic == null) {
        header("location:index.php?option=topic");
    }
    //Lấy từ form
    $topic->name = $_topic['name'];
    $topic->slug = (strlen($_topic['slug']) > 0) ? $_topic['slug'] : MyClass::str_slug($_topic['title']);
    $topic->description = $_topic['description'];

    $topic->status = $_topic['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        //xoa hinh cu


        //them hinh moi
        $target_dir = "../public/images/topic/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $topic->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $topic->image = $filename;
        }
    }



    //tự sinh ra

    $topic->updated_at = date('Y-m-d H:i:s');
    $topic->updated_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($topic);
    //Lưu vào CSDL
    //insert into topic
    $topic->save();
    //Chuyển hướng về index
    header("location:index.php?option=topic");
}
