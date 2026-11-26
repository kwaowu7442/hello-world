<?php $pageTitle = $pageTitle ?? 'Inventory System'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo htmlspecialchars($pageTitle); ?></title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
    <h1>Retail Ordering &amp; Inventory System</h1>
    <nav>
        <a href="index.php">Home</a>
        <a href="products.php">Products</a>
        <a href="customers.php">Customers</a>
        <a href="orders.php">Orders</a>
        <a href="reports.php">Reports</a>
    </nav>
</header>
<main>
