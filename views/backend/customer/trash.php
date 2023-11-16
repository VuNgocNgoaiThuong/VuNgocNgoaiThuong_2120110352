<?php

use App\Models\User;

//SELECT * FROM post WHERE satus!=0 and ... order created_at desc

$list = User::where([['status', '=', 0], ['roles', '=', 0]])->orderBy('created_at', 'DESC')->get();
?>

<?php require_once '../views/backend/header.php'; ?>

<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Thùng rác khách hàng</h1>
               <a href="index.php?option=customer&cat=create" class="btn btn-sm btn-primary">Thêm khách hàng</a>
            </div>
         </div>
      </div>
   </section>
   <!-- Main content -->
   <section class="content">
      <div class="card">
         <div class="card-header">
            <div class="row">
               <div class="col-md-6">
                  <a href="index.php?option=customer">Tất cả</a> |
                  <a href="index.php?option=customer&cat=trash">Thùng rác</a>

               </div>
               <div class="col-md-6 text-right">
                  <a href="index.php?option=customer" class="btn btn-sm btn-info">
                     <i class="fa fa-arrow-left" aria-hidden="true"></i>
                     Về danh sách
                  </a>
               </div>
            </div>
         </div>
         <div class="card-body">
            <?php require_once '../views/backend/message.php'; ?>
            <table class="table table-bordered">
               <thead>
                  <tr>
                     <th class="text-center" style="width:30px;">
                        <input type="checkbox">
                     </th>
                     <th class="text-center" style="width:90px;">Hình ảnh</th>
                     <th>Tên khách hàng</th>
                     <th>Điện thoại</th>
                     <th>Email</th>
                     <th>Ngày tạo</th>
                  </tr>
               </thead>
               <tbody>
                  <?php if (count($list) > 0) : ?>
                     <?php foreach ($list as $item) : ?>
                        <tr class="datarow">
                           <td>
                              <input type="checkbox">
                           </td>
                           <td>
                              <img style="width: 40px; height: 40px;" src="../public/images/customer/<?= $item->image; ?>" alt="<?= $item->image; ?>">
                           </td>
                           <td>
                              <div class="name">
                                 <?= $item->name; ?>
                              </div>

                              <div class="function_style">
                                 <a href="index.php?option=customer&cat=restore&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                    <i class="fas fa-undo"></i> Khôi phục
                                 </a>
                                 <a href="index.php?option=customer&cat=destroy&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                    <i class="fas fa-trash"></i>Xoá VV
                                 </a>
                              </div>
                           </td>
                           <td>
                              <?= $item->phone; ?>
                           </td>
                           <td>
                              <?= $item->email; ?>
                           </td>
                           <td>
                              <?= $item->created_at; ?>
                           </td>
                        </tr>
                     <?php endforeach; ?>
                  <?php endif; ?>
               </tbody>
            </table>
         </div>
      </div>
   </section>
</div>
<!-- END CONTENT-->
<?php require_once '../views/backend/footer.php'; ?>