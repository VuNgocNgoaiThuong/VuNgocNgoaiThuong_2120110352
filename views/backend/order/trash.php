<?php

use App\Models\Order;

$list = Order::where('status', '=', 0)->orderBy('created_at', 'DESC')->get();

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
                  <a href="index.php?option=order">Tất cả</a> |
                  <a href="index.php?option=order&cat=trash">Thùng rác</a>
               </div>
               <div class="col-md-6 text-right">
                  <a href="index.php?option=order" class="btn btn-sm btn-info">
                     <i class="fa fa-arrow-left" aria-hidden="true"></i>
                     Về danh sách
                  </a>
               </div>
            </div>
         </div>
         <div class="card-body p-2">
            <table class="table table-bordered">
               <thead>
                  <tr>
                     <th class="text-center" style="width:30px;">
                        <input type="checkbox">
                     </th>
                     <th>Khách hàng</th>
                     <th>Điện thoại</th>
                     <th>Email</th>
                     <th>Địa chỉ</th>
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
                              <div class="deliveryname">
                                 <?= $item->deliveryname; ?>
                              </div>

                              <div class="function_style">
                                 
                                 <a href="index.php?option=order&cat=restore&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                    <i class="fas fa-undo"></i> Khôi phục
                                 </a>
                                 <a href="index.php?option=order&cat=destroy&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                    <i class="fas fa-trash"></i>Xoá VV
                                 </a>
                              </div>
                           </td>
                           <td>
                              <?= $item->deliveryphone; ?>
                           </td>
                           <td>
                              <?= $item->deliveryemail; ?>
                           </td>
                           <td>
                              <?= $item->deliveryaddress; ?>
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