<?php

use App\Models\Menu;
use App\Models\Category;
use App\Models\Topic;
use App\Models\Post;
use App\Models\Brand;

//SELECT * FROM menu WHERE satus!=0 and ... order created_at desc

$list_menu = Menu::where('status', '=', 0)
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
   <!-- CONTENT -->
   <div class="content-wrapper">
      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-12">
                  <h1 class="d-inline">Thùng rác menu</h1>
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
                     <a href="index.php?option=brand">Tất cả</a> |
                     <a href="index.php?option=menu&cat=trash">Thùng rác</a>

                  </div>
                  <div class="col-md-6 text-right">
                     <a href="index.php?option=menu" class="btn btn-sm btn-info">
                        <i class="fa fa-arrow-left" aria-hidden="true"></i>
                        Về danh sách
                     </a>
                  </div>
               </div>
            </div>
            <div class="card-body p-2">
               <div class="row">
                 
                  <div class="col-md-12">
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
                                       <div class="function_style">
                                       <a href="index.php?option=menu&cat=restore&id=<?= $item->id; ?>" class="btn btn-info btn-xs">
                                       <i class="fas fa-undo"></i> Khôi phục
                                       </a>
                                       <a href="index.php?option=menu&cat=destroy&id=<?= $item->id; ?>" class="btn btn-danger btn-xs">
                                          <i class="fas fa-trash"></i>Xoá VV
                                       </a>
                                       </div>
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

<?php require_once '../views/backend/footer.php'; ?>