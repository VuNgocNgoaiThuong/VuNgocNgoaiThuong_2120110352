<?php

use App\Models\Product;
use App\Libraries\MyClass;

if (isset($_POST['THEM'])) {
    $product = new Product();
    //Lấy từ form
    $product->name = $_POST['name'];
    $product->slug = (strlen($_POST['slug']) > 0) ? $_POST['slug'] : MyClass::str_slug($_POST['name']);
    $product->category_id=$_POST['category_id'];
    $product->brand_id=$_POST['brand_id'];
    $product->detail=$_POST['detail'];
    $product->price=$_POST['price'];
    $product->status = $_POST['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        $target_dir = "../public/images/product/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $product->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $product->image = $filename;
        }
    }



    //tự sinh ra

    $product->created_at = date('Y-m-d H:i:s');
    $product->created_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($product);
    //Lưu vào CSDL
    //insert into product
    $product->save();
    //Chuyển hướng về index
    header("location:index.php?option=product");
}

if (isset($_POST['CAPNHAT'])) {
    $id=$_POST['id'];
    $product = Product::find($id);
    if ($product == null) {
        header("location:index.php?option=product");
    }
    //Lấy từ form
    $product->name = $_POST['name'];
    $product->slug = (strlen($_POST['slug']) > 0) ? $_POST['slug'] : MyClass::str_slug($_POST['name']);
    $product->category_id=$_POST['category_id'];
    $product->brand_id=$_POST['brand_id'];
    $product->detail=$_POST['detail'];
    $product->price=$_POST['price'];
    $product->status = $_POST['status'];
    //Xử lý upload file
    if (strlen($_FILES['image']['name']) > 0) {
        //xoa hinh cu


        //them hinh moi
        $target_dir = "../public/images/product/";
        $target_file = $target_dir . basename($_FILES["image"]["name"]);
        $extension = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
        if (in_array($extension, ['jpg', 'jpeg', 'png', 'gif', 'webp'])) {
            $filename = $product->slug . '.' . $extension;
            move_uploaded_file($_FILES['image']['tmp_name'], $target_dir . $filename);
            $product->image = $filename;
        }
    }



    //tự sinh ra

    $product->updated_at = date('Y-m-d H:i:s');
    $product->updated_by = (isset($_SESSION['user_id'])) ? $_SESSION['user_id'] : 1;
    var_dump($product);
    //Lưu vào CSDL
    //insert into product
    $product->save();
    //Chuyển hướng về index
    header("location:index.php?option=product");
}
