<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập quản trị</title>
    <link rel="stylesheet" href="public/bootstrap/css/bootstrap.min.css">

</head>
<body>
    <form action="login.php" method="post">
        <input type="text" name="username" placeholder="Tên đăng nhập hoặc email" require>
        <input type="password" name="password" placeholder="Mật khẩu" require>
        <input type="submit" value="Đăng nhập" name="DANGNHAP">
    </form>
</body>
</html>