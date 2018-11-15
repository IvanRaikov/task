<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style.css">
    <title>books</title>
</head>

<body>
   
    <?php require_once 'mainController.php';?>
    <div id="bookListContent">
        <h3>Книги жанра фантастика</h3>
        <ul>
        <?php foreach($arrBooks as $val):?>
            <li><strong><?= $val['title']?></strong><p>Автор: <?=$val['name']?></p></li>
            <hr>
        <?php endforeach;?>
        </ul>
    </div>    
        <div id="maxAutor">
            <h4>Автор написавший наибольшее количество книг:</h4><p><?=$maxAutor['name']?></p>
        </div>
</body>
</html>
