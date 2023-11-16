<?php

use App\Models\Banner;

//SELECT * FROM post WHERE satus!=0 and ... order created_at desc

$list = Banner::where('status', '!=', 0)->orderBy('created_at', 'ASC')->get();

?>
<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Tất cả banner</h1>
               <a href="index.php?option=banner&cat=create" class="btn btn-sm btn-primary">Thêm banner</a>
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
                  <a href="index.php?option=banner">Tất cả</a> |
                  <a href="index.php?option=banner&cat=trash">Thùng rác</a>

               </div>
               <div class="col-md-6 text-right">
                  <button class="btn btn-sm btn-success" type="submit" name="THEM">
                     <i class="fa fa-save" aria-hidden="true"></i>
                     Lưu
                  </button>
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
                     <th style="width:20px;">ID</th>
                     <th class="text-center" style="width:90px;">Hình ảnh</th>
                     <th style="width:300px;">Tên banner</th>
                     <th>Liên kết</th>
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
                              <?= $item->id; ?>
                           </td>
                           <td>
                              <img style="width: 40px; height: 40px;" src="../public/images/banner/<?= $item->image; ?>" alt="<?= $item->image; ?>">
                           </td>
                           <td>
                              <div class="name">
                                 <?= $item->name; ?>
                              </div>
                              <div class="function_style">
                                 <?php if ($item->status == 1) : ?>
                                    <a href='index.php?option=banner&cat=status&id=<?= $item->id; ?>' class="btn btn-success btn-xs">
                                       <i class="fas fa-toggle-on"></i> Hiện
                                    </a>
                                 <?php else : ?>
                                    <a href='index.php?option=banner&cat=status&id=<?= $item->id; ?>' class="btn btn-danger btn-xs">
                                       <i class="fas fa-toggle-off"></i> Ẩn
                                    </a>
                                 <?php endif; ?>
                                 <a href="index.php?option=banner&cat=edit&id=<?= $item->id; ?>" class="btn btn-primary btn-xs">
                                    <i class="fas fa-edit"></i> Chỉnh sửa
                                 </a>
                                 <a href="index.php?option=banner&cat=show&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                    <i class="fas fa-eye"></i> Chi tiết
                                 </a>
                                 <a href="index.php?option=banner&cat=delete&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                    <i class="fas fa-trash"></i>Xoá
                                 </a>
                              </div>
                           </td>
                           <td><?= $item->link; ?></td>
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