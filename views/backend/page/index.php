<?php

use App\Models\Page;
use App\Models\Topic;

//SELECT * FROM post WHERE satus!=0 and ... order created_at desc

$list = Topic::where('status', '!=', 0)->orderBy('created_at', 'DESC')->get();

?>
<?php require_once '../views/backend/header.php'; ?>
      <!-- CONTENT -->
      <div class="content-wrapper">
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-12">
                     <h1 class="d-inline">Tất cả trang đơn</h1>
                     <a href="page_create.html" class="btn btn-sm btn-primary">Thêm trang đơn</a>
                  </div>
               </div>
            </div>
         </section>
         <!-- Main content -->
         <section class="content">
            <div class="card">
               <div class="card-header p-2">
                  Noi dung
               </div>
               <div class="card-body p-2">
                  <table class="table table-bordered">
                     <thead>
                        <tr>
                           <th class="text-center" style="width:30px;">
                              <input type="checkbox">
                           </th>
                           <th class="text-center" style="width:130px;">Hình ảnh</th>
                           <th>Tên trang đơn</th>
                           <th>slug</th>
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
                              <img src="../public/images/page.jpg" alt="page.jpg">
                           </td>
                           <td>
                              <div class="name">
                                 Tên trang đơn
                              </div>
                              <div class="function_style">
                              <?php if ($item->status == 1) : ?>
                                    <a href='index.php?option=page&cat=status&id=<? $item->id; ?>' class="btn btn-success btn-xs">
                                       <i class="fas fa-toggle-on"></i> Hiện
                                    </a>
                                 <?php else : ?>
                                    <a href='index.php?option=page&cat=status&id=<? $item->id; ?>' class="btn btn-danger btn-xs">
                                       <i class="fas fa-toggle-off"></i> Ẩn
                                    </a>
                                 <?php endif; ?>
                                 <a href="index.php?option=page&cat=edit&id=<? $item->id; ?>" class="btn btn-primary btn-xs">
                                    <i class="fas fa-edit"></i> Chỉnh sửa
                                 </a>
                                 <a href="index.php?option=page&cat=show&id=<? $item->id; ?>" class="btn btn-info btn-xs">
                                    <i class="fas fa-eye"></i> Chi tiết
                                 </a>
                                 <a href="index.php?option=page&cat=delete&id=<? $item->id; ?>" class="btn btn-danger btn-xs">
                                    <i class="fas fa-trash"></i>Xoá
                                 </a>
                              </div>
                           </td>
                           <td>Slug</td>
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
