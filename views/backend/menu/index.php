<?php

use App\Models\Menu;
use App\Models\Category;
use App\Models\Topic;
use App\Models\Post;
use App\Models\Brand;

//SELECT * FROM menu WHERE satus!=0 and ... order created_at desc

$list_menu = Menu::where('status', '!=', 0)
   ->orderBy('position', 'ASC')
   ->orderBy('sort_order', 'ASC')
   ->get();
$list_category = Category::where('status', '!=', 0)->orderBy('created_at', 'DESC')->get();
$list_topic = Topic::where('status', '!=', 0)->orderBy('created_at', 'DESC')->get();
$list_page = Post::where([['status', '!=', 0], ['type', '=', 'page']])->orderBy('created_at', 'DESC')->get();
$list_brand = Brand::where('status', '!=', 0)->orderBy('created_at', 'DESC')->get();

$brand_id_html = '';
$category_id_html = '';
$topic_id_html = '';
$page_id_html = '';
foreach ($list_brand as $brand) {
   $brand_id_html .= "<input type='checkbox' value='$brand->id'>$brand->name</input> <br>";
}
foreach ($list_category as $category) {
   $category_id_html .= "<input type='checkbox' value='$category->id'>$category->name</input> <br>";
}
foreach ($list_topic as $topic) {
   $topic_id_html .= "<input type='checkbox' value='$topic->id'>$topic->name</input> <br>";
}
foreach ($list_page as $post) {
   $page_id_html .= "<input type='checkbox' value='$post->id'>$post->title</input> <br>";
}
?>
<?php require_once '../views/backend/header.php'; ?>
<from action="index.php?option=menu&cat=process" name="form1" method="post">
   <!-- CONTENT -->
   <div class="content-wrapper">
      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-12">
                  <h1 class="d-inline">Tất cả menu</h1>
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
                     <a href="index.php?option=menu">Tất cả</a> |
                     <a href="index.php?option=menu&cat=trash">Thùng rác</a>

                  </div>
                  <div class="col-md-6 text-right">
                     <button class="btn btn-sm btn-success" type="submit" name="THEM">
                        <i class="fa fa-save" aria-hidden="true"></i>
                        Lưu
                     </button>
                  </div>
               </div>
            </div>
            <div class="card-body p-2">
            <?php require_once '../views/backend/message.php'; ?>
               <div class="row">
                  <div class="col-md-3">
                     <div class="accordion" id="accordionExample">
                        <div class="card mb-0 p-3">
                           <select name="menuion" class="form-control">
                              <option value="mainmenu">Main Menu</option>
                              <option value="footermenu">Footer Menu</option>
                           </select>
                        </div>
                        <div class="card mb-0">
                           <div class="card-header" id="headingCategory">
                              <strong data-toggle="collapse" data-target="#collapseCategory" aria-expanded="true" aria-controls="collapseCategory">
                                 Danh mục sản phẩm
                              </strong>
                           </div>
                           <div id="collapseCategory" class="collapse" aria-labelledby="headingCategory" data-parent="#accordionExample">
                              <div class="card-body p-3">
                                 <div class="form-check">
                                    <label class="form-check-label" for="categoryId">
                                       <?= $category_id_html; ?>
                                    </label>
                                 </div>
                                 <div class="my-3">
                                    <button name="ADDCATEGORY" class="btn btn-sm btn-success form-control">Thêm</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card mb-0">
                           <div class="card-header" id="headingBrand">
                              <strong data-toggle="collapse" data-target="#collapseBrand" aria-expanded="true" aria-controls="collapseBrand">
                                 Thương hiệu
                              </strong>
                           </div>
                           <div id="collapseBrand" class="collapse" aria-labelledby="headingBrand" data-parent="#accordionExample">
                              <div class="card-body p-3">
                                 <div class="form-check">
                                    <label class="form-check-label" for="BrandId">
                                       <?= $brand_id_html; ?>
                                    </label>
                                 </div>
                                 <div class="my-3">
                                    <button name="ADDBRAND" class="btn btn-sm btn-success form-control">Thêm</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card mb-0">
                           <div class="card-header" id="headingTopic">
                              <strong data-toggle="collapse" data-target="#collapseTopic" aria-expanded="true" aria-controls="collapseTopic">
                                 Chủ đề bài viết
                              </strong>
                           </div>
                           <div id="collapseTopic" class="collapse" aria-labelledby="headingTopic" data-parent="#accordionExample">
                              <div class="card-body p-3">
                                 <div class="form-check">
                                    <label class="form-check-label" for="TopicId">
                                       <?= $topic_id_html; ?>
                                    </label>
                                 </div>
                                 <div class="my-3">
                                    <button name="ADDTOPIC" class="btn btn-sm btn-success form-control">Thêm</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card mb-0">
                           <div class="card-header" id="headingPage">
                              <strong data-toggle="collapse" data-target="#collapsePage" aria-expanded="true" aria-controls="collapsePage">
                                 Trang đơn
                              </strong>
                           </div>
                           <div id="collapsePage" class="collapse" aria-labelledby="headingPage" data-parent="#accordionExample">
                              <div class="card-body p-3">
                                 <div class="form-check">
                                    <label class="form-check-label" for="PageId">
                                       <?= $page_id_html; ?>
                                    </label>
                                 </div>
                                 <div class="my-3">
                                    <button name="ADDPAGE" class="btn btn-sm btn-success form-control">Thêm</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="card mb-0">
                           <div class="card-header" id="headingCustom">
                              <strong data-toggle="collapse" data-target="#collapseCustom" aria-expanded="true" aria-controls="collapseCustom">
                                 Tuỳ liên kết
                              </strong>
                           </div>
                           <div id="collapseCustom" class="collapse" aria-labelledby="headingCustom" data-parent="#accordionExample">
                              <div class="card-body p-3">
                                 <div class="mb-3">
                                    <label></label>
                                    <input type="text" name="name" class="form-control">
                                 </div>
                                 <div class="mb-3">
                                    <label>Liên kết</label>
                                    <input type="text" name="link" class="form-control">
                                 </div>
                                 <div class="mb-3">
                                    <button name="ADDCUSTOM" class="btn btn-sm btn-success form-control">Thêm</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-9">
                     <table class="table table-bordered">
                        <thead>
                           <tr>
                              <th class="text-center" style="width:30px;">
                                 <input type="checkbox">
                              </th>
                              <th>Tên menu</th>
                              <th>Liên kết</th>
                              <th>Vị trí</th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php if (count($list_menu) > 0) : ?>
                              <?php foreach ($list_menu as $item) : ?>
                                 <tr class="datarow">
                                    <td>
                                       <input type="checkbox">
                                    </td>
                                    <td>
                                       <div class="name">
                                          <?= $item->name; ?>
                                       </div>
                                       <?php if ($item->status == 1) : ?>
                                          <a href='index.php?option=menu&cat=status&id=<?= $item->id; ?>' class="btn btn-success btn-xs">
                                             <i class="fas fa-toggle-on"></i> Hiện
                                          </a>
                                       <?php else : ?>
                                          <a href='index.php?option=menu&cat=status&id=<?= $item->id; ?>' class="btn btn-danger btn-xs">
                                             <i class="fas fa-toggle-off"></i> Ẩn
                                          </a>
                                       <?php endif; ?>
                                       <a href="index.php?option=menu&cat=edit&id=<?= $item->id; ?>" class="btn btn-primary btn-xs">
                                          <i class="fas fa-edit"></i> Chỉnh sửa
                                       </a>
                                       <a href="index.php?option=menu&cat=show&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                          <i class="fas fa-eye"></i> Chi tiết
                                       </a>
                                       <a href="index.php?option=menu&cat=delete&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                          <i class="fas fa-trash"></i>Xoá
                                       </a>
                                    </td>
                                    <td><?= $item->link; ?></td>
                                    <td><?= $item->type; ?></td>
                                 </tr>
                              <?php endforeach; ?>
                           <?php endif; ?>
                        </tbody>

                     </table>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>
   <!-- END CONTENT-->
</from>

<?php require_once '../views/backend/footer.php'; ?>