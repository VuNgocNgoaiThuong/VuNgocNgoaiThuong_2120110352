<?php

use App\Libraries\MyClass;
?>
<div style="width:200px; height:350px;" class="product-item border">
    <div class="product-item-image">
        <a href="index.php?option=product&slug=<?= $product->slug; ?>">
            <img style="width:200px; height:220px;" src="public/images/product/<?= $product->image; ?>" class="img-fluid" alt="<?= $product->image; ?>" id="img1">
            <img style="width:200px; height:220px;" class="img-fluid" src="public/images/product/<?= $product->image; ?>" alt="<?= $product->image; ?>" id="img2">
        </a>
    </div>
    <h2 class="product-item-name text-main text-center fs-5 py-1">
        <a href="index.php?option=product&slug=<?= $product->slug; ?>"><?= MyClass::word_limit($product->name, 8); ?></a>
    </h2>
    <h3 class="product-item-price fs-6 p-2 d-flex">
        <div class="flex-fill"><del><?= number_format($product->price); ?>đ</del></div>
        <div class="flex-fill text-end text-main"><?= number_format($product->pricesale); ?></div>
    </h3>
</div>