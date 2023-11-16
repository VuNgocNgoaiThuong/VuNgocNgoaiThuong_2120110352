<?php

use App\Models\Order;

$list = Order::Join('orderdetail', 'orderdetail.order_id', '=', 'order.id')
   ->join('user', 'user.id', '=', 'order.user_id')
   ->where('order.status', '!=', 0)
   ->select('user.name', 'user.email', 'user.phone', 'order.*')
   ->distinct()->get();

?>

<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Tất cả đơn hàng</h1>
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
                                 <?php if ($item->status == 1) : ?>
                                    <a href='index.php?option=order&cat=status&id=<?= $item->id; ?>' class="btn btn-success btn-xs">
                                       <i class="fas fa-toggle-on"></i> Hiện
                                    </a>
                                 <?php else : ?>
                                    <a href='index.php?option=order&cat=status&id=<?= $item->id; ?>' class="btn btn-danger btn-xs">
                                       <i class="fas fa-toggle-off"></i> Ẩn
                                    </a>
                                 <?php endif; ?>
                                 <a href="index.php?option=order&cat=show&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                    <i class="fas fa-eye"></i> Chi tiết
                                 </a>
                                 <a href="index.php?option=order&cat=delete&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                    <i class="fas fa-trash"></i>Xoá
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