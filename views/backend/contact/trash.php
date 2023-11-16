<?php

use App\Models\Contact;

$list = Contact::where('status', '=', 0)->orderBy('created_at', 'DESC')->get();

?>

<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Thùng rác đơn hàng</h1>
            </div>
         </div>
      </div>
   </section>
   <!-- Main content -->
   <section class="content">
      <div class="card">
         <div class="card-header p-2">
            <div class="row">
               <div class="col-md-6">
                  <a href="index.php?option=contact">Tất cả</a> |
                  <a href="index.php?option=contact&cat=trash">Thùng rác</a>
               </div>
            </div>
            <div class="col-md-12 text-right">
               <a href="index.php?option=contact" class="btn btn-sm btn-info">
                  <i class="fa fa-arrow-left" aria-hidden="true"></i>
                  Về danh sách
               </a>
            </div>
         </div>
         <div class="card-body p-2">
            <?php require_once '../views/backend/message.php'; ?>
            <table class="table table-bordered">
               <thead>
                  <tr>
                     <th class="text-center" style="width:30px;">
                        <input type="checkbox">
                     </th>
                     <th>Họ và tên </th>
                     <th>Email</th>
                     <th>Điện thoại</th>
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
                              <div class="name">
                                 <?= $item->name; ?>
                              </div>
                              <div class="function_style">
                                 <a href="index.php?option=contact&cat=restore&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                    <i class="fas fa-undo"></i> Khôi phục"
                                 </a>
                                 <a href="index.php?option=contact&cat=destroy&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                    <i class="fas fa-trash"></i>Xoá VV
                                 </a>
                              </div>
                           </td>
                           <td>
                              <?= $item->email; ?>
                           </td>
                           <td>
                              <?= $item->phone; ?>
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