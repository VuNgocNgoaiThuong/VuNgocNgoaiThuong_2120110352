<?php

use App\Libraries\MyClass;
use App\Models\User;

$id = $_REQUEST['id'];
$customer = User::find($id);
if ($customer == null) {
   MyClass::set_flash('message',['msg'=>'Lỗi trang 404','type'=>'danger']);
   header("location:index.php?option=customer");
}

?>
<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Chi tiết Khách hàng</h1>
            </div>
         </div>
      </div>
   </section>
   <!-- Main content -->
   <section class="content">
      <div class="card">
         <div class="card-header">
            <div class="row">
               <div class="col-md-12 text-right">
                  <a href="index.php?option=customer" class="btn btn-sm btn-info">
                     <i class="fa fa-arrow-left" aria-hidden="true"></i>
                     Về danh sách
                  </a>
               </div>
            </div>
         </div>
         <div class="card-body">
            <table class="table table-bordered">
               <thead>
                  <tr>
                     <th>Tên trường</th>
                     <th>Giá trị</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>ID</td>
                     <td><?= $customer->id; ?></td>
                  </tr>
                  <tr>
                     <td>Họ tên</td>
                     <td><?= $customer->name; ?></td>
                  </tr>
                  <tr>
                     <td>Tên đăng nhập</td>
                     <td><?= $customer->username; ?></td>
                  </tr>
                  <tr>
                     <td>Mật khẩu</td>
                     <td><?= $customer->password; ?></td>
                  </tr>
                  <tr>
                     <td>Email</td>
                     <td><?= $customer->email; ?></td>
                  </tr>
                  <tr>
                     <td>Điện thoại</td>
                     <td><?= $customer->phone; ?></td>
                  </tr>
                  <tr>
                     <td>Đia chỉ</td>
                     <td><?= $customer->address; ?></td>
                  </tr>
                  <tr>
                     <td>Hình</td>
                     <td><img style="width: 50px; height: 50px;" src="../public/images/customer/<?= $customer->image; ?>" alt="<?= $customer->image; ?>">
                     </td>
                  </tr>
                  <tr>
                     <td>Ngày tạo</td>
                     <td><?= $customer->created_at; ?></td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </section>
</div>

<!-- END CONTENT-->
<?php require_once '../views/backend/footer.php'; ?>