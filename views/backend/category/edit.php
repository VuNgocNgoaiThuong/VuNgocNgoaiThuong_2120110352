<?php

use App\Models\Category;
//SELECT * FROM CATEGORY WHERE satus!=0 and ... order created_at desc

$id = $_REQUEST['id'];
$category = Category::find($id);
if ($category == null) {
}
$list = Category::where('status', '!=', 0)
   ->orderBy('created_at', 'DESC')
   ->get();
$parent_id_html = '';
foreach ($list as $category) {
   $parent_id_html .= "<option value='$category->id'>$category->name</option> ";
}
?>
<?php require_once '../views/backend/header.php'; ?>
<!-- CONTENT -->
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-12">
               <h1 class="d-inline">Tất cả danh mục</h1>
            </div>
         </div>
      </div>
   </section>
   <!-- Main content -->
   <section class="content">
      <div class="card">
         <div class="card-header text-right">
            <button class="btn btn-sm btn-success">
               <i class="fa fa-save" aria-hidden="true" name="THEM"></i>
               Lưu
            </button>
         </div>
         <div class="card-body">
            <div class="row">
               <div class="col-md-4">
                  <div class="mb-3">
                     <label>Tên danh mục (*)</label>
                     <input type="text" value="<?= $category->name; ?>" name="name" id="name" placeholder="Nhập tên danh mục" class="form-control">
                  </div>
                  <div class="mb-3">
                     <label>Slug</label>
                     <input type="text" value="<?= $category->slug; ?>" name="slug" id="slug" placeholder="Nhập slug" class="form-control">
                  </div>
                  <div class="mb-3">
                     <label>Danh mục cha (*)</label>
                     <select name="parent_id" class="form-control">
                        <option value="<?= $category->parent_id; ?>">None</option>
                        <option value="<?= $category->parent_id; ?>"><?= $parent_id_html; ?></option>
                     </select>
                  </div>
                  <div class="mb-3">
                     <label>Hình đại diện</label>
                     <input type="file" name="image" class="form-control">
                  </div>
                  <div class="mb-3">
                     <label>Trạng thái</label>
                     <select name="status" class="form-control">
                        <option value="1">Xuất bản</option>
                        <option value="2">Chưa xuất bản</option>
                     </select>
                  </div>
               </div>

            </div>
         </div>
      </div>
   </section>
</div>
<!-- END CONTENT-->
<?php require_once '../views/backend/footer.php'; ?>