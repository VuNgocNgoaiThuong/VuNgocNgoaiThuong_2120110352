<?php

use App\Models\Post;
use App\Models\Topic;
use App\Libraries\MyClass;

//SELECT * FROM page WHERE satus!=0 and ... order created_at desc

$id = $_REQUEST['id'];
$page = Post::find($id);
if ($page == null) {
   MyClass::set_flash('message',['msg'=>'Lỗi trang 404','type'=>'danger']);
    header("location:index.php?option=page&cat=trash");
}
//

?>

<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Chi tiết bài viết</h1>
               <a href="index.php?option=page&cat=create" class="btn btn-sm btn-primary">Thêm bài viết</a>
            </div>
         </div>
      </div>
   </section>
   <!-- Main content -->
   <section class="content">
      <div class="card">
         <div class="card-header p-2">
            <div class="row">
               
               <div class="col-md-12 text-right">
               <a href="index.php?option=page" class="btn btn-sm btn-info">
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
                     <th style="width:30%">Tên trường</th>
                     <th>Giá trị</th>
                  </tr>
               </thead>
               <tbody>
               <tr>
                     <th>ID</th>
                     <td><?= $page->id; ?></td>
                  </tr>
                  <tr>
                     <th>ID</th>
                     <td><?= $page->topic_id; ?></td>
                  </tr>
                  <tr>
                     <th>ID</th>
                     <td><?= $page->title; ?></td>
                  </tr>
                  <tr>
                     <th>ID</th>
                     <td><?= $page->slug; ?></td>
                  </tr>
                  <tr>
                     <th>ID</th>
                     <td><img style="width: 50px; height: 50px;" src="../public/images/page/<?= $page->image; ?>" alt="<?= $page->image; ?>">
                     </td>
                  </tr>
                  <tr>
                     <th>ID</th>
                     <td><?= $page->detail; ?></td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </section>
</div>
<!-- END CONTENT-->
<?php require_once '../views/backend/footer.php'; ?>