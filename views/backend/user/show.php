<?php

use App\Libraries\MyClass;
use App\Models\User;

$id = $_REQUEST['id'];
$user = User::find($id);
if ($user == null) {
   MyClass::set_flash('message',['msg'=>'Lỗi trang 404','type'=>'danger']);
   header("location:index.php?option=user");
}

?>
<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Chi tiết thành viên</h1>
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
                  <a href="index.php?option=user" class="btn btn-sm btn-info">
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
                     <td><?= $user->id; ?></td>
                  </tr>
                  <tr>
                     <td>Họ tên</td>
                     <td><?= $user->name; ?></td>
                  </tr>
                  <tr>
                     <td>Tên đăng nhập</td>
                     <td><?= $user->username; ?></td>
                  </tr>
                  <tr>
                     <td>Mật khẩu</td>
                     <td><?= $user->password; ?></td>
                  </tr>
                  <tr>
                     <td>Email</td>
                     <td><?= $user->email; ?></td>
                  </tr>
                  <tr>
                     <td>Điện thoại</td>
                     <td><?= $user->phone; ?></td>
                  </tr>
                  <tr>
                     <td>Đia chỉ</td>
                     <td><?= $user->address; ?></td>
                  </tr>
                  <tr>
                     <td>Hình</td>
                     <td><img style="width: 50px; height: 50px;" src="../public/images/user/<?= $user->image; ?>" alt="<?= $user->image; ?>">
                     </td>
                  </tr>
                  <tr>
                     <td>Ngày tạo</td>
                     <td><?= $user->created_at; ?></td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </section>
</div>

<!-- END CONTENT-->
<?php require_once '../views/backend/footer.php'; ?>