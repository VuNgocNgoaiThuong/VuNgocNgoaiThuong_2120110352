<?php

use App\Models\User;

$id = $_REQUEST['id'];
$user = User::find($id);
if ($user == null) {
    header("location:index.php?option=user");
}



?>
<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<form action="index.php?option=user&cat=process" method="post" enctype="multipart/form-data">
   <div class="content-wrapper">
      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-12">
                  <h1 class="d-inline">Thêm mới bài viết</h1>
               </div>
            </div>
         </div>
      </section>
      <section class="content">
         <div class="card">
            <div class="card-header text-right">
               <a href="index.php?option=user" class="btn btn-sm btn-info">
                  <i class="fa fa-arrow-left" aria-hidden="true"></i>
                  Về danh sách
               </a>
               <button class="btn btn-sm btn-success" name="CAPNHAT">
                  <i class="fa fa-save" aria-hidden="true"></i>
                  Lưu
               </button>
            </div>
            <div class="card-body">
               <div class="row">
                  <div class="col-md-9">
                     <div class="mb-3">
                        <label>Tiêu đề bài viết (*)</label>
                        <input type="text" value="<?= $user->title; ?>" name="title" class="form-control">
                     </div>
                     <div class="mb-3">
                        <label>Slug</label>
                        <input type="text" value="<?= $user->slug; ?>" name="slug" class="form-control">
                     </div>
                     <div class="mb-3">
                        <label>Chi tiết (*)</label>
                        <textarea name="detail" rows="5" class="form-control"> value=<?= $user->detail; ?></textarea>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="mb-3">
                        <label>Chủ đề (*)</label>
                        <select name="topic_id" class="form-control">
                           <option value="">None</option>
                           <?= $topic_id_html; ?>
                        </select>
                     </div>
                     <div class="mb-3">
                        <label>Hình đại diện</label>
                        <input type="file" name="image" class="form-control">
                     </div>
                     <div class="mb-3">
                        <label>Trạng thái</label>
                        <select name="status" class="form-control">
                           <option value="1" <?= ($user->status == 1) ? 'selected' : ''; ?>>Xuất bản</option>
                           <option value="2" <?= ($user->status == 2) ? 'selected' : ''; ?>>Chưa xuất bản</option>
                        </select>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>
</form>
<!-- END CONTENT-->
<?php require_once '../views/backend/footer.php'; ?>