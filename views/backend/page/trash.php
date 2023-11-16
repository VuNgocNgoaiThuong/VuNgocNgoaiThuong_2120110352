<?php

use App\Models\Post;
use App\Models\Topic;

//SELECT * FROM post WHERE satus!=0 and ... order created_at desc

$list = Post::join('topic', 'topic.id', '=', 'post.topic_id')
   ->where('post.status', '=', 0)
   ->orderBy('post.created_at', 'DESC')
   ->select("post.*", "topic.name as topic_name")
   ->get();

?>

<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Thùng rác trang đơn</h1>
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
                  <a href="index.php?option=post">Tất cả</a> |
                  <a href="index.php?option=post&cat=trash">Thùng rác</a>
               </div>
               <div class="col-md-6 text-right">
               <a href="index.php?option=post" class="btn btn-sm btn-info">
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
                     <th class="text-center" style="width:130px;">Hình ảnh</th>
                     <th>Tiêu đề bài viết</th>
                     <th>Tên danh mục</th>
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
                              <img style="width: 40px; height: 40px;" src="../public/images/post/<?= $item->image; ?>" alt="<?= $item->image; ?>">
                           </td>
                           <td>
                              <div class="name">
                                 <?= $item->title; ?>
                              </div>
                              <div class="function_style">
                                 <a href="index.php?option=post&cat=restore&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                    <i class="fas fa-undo"></i> Khôi phục  
                                 </a>
                                 <a href="index.php?option=post&cat=destroy&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                    <i class="fas fa-trash"></i>Xoá VV
                                 </a>
                              </div>
                           </td>

                           <td><?= $item->topic_name; ?></td>

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