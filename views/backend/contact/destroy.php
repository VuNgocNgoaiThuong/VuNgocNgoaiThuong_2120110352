<?php

use App\Models\Contact;
use App\Libraries\MyClass;

$id = $_REQUEST['id'];
$contact = Contact::find($id);
if ($contact == null) {
    MyClass::set_flash('message',['msg'=>'Lỗi trang 404','type'=>'danger']);
    header("location:index.php?option=contact&cat=trash");
}
//
$contact->delete();//Xóa khỏi csdl
MyClass::set_flash('message',['msg'=>'Xóa khỏi CSDL thành công','type'=>'success']);
header("location:index.php?option=contact&cat=trash");
