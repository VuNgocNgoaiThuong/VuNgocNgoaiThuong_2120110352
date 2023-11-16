<?php

use App\Models\User;
use App\Libraries\MyClass;

$id = $_REQUEST['id'];
$user = User::find($id);
if ($user == null) {
    MyClass::set_flash('message',['msg'=>'Lỗi trang 404','type'=>'danger']);
    header("location:index.php?option=user");
}
$user->delete();
MyClass::set_flash('message',['msg'=>'Xóa khỏi CSDL thành công','type'=>'success']);
header("location:index.php?option=user&cat=trash");
