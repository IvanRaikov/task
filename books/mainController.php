<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$params = require_once 'params.php';
$connect = mysqli_connect($params['host'],
                          $params['user'],
                          $params['password'],
                          $params['db_name']);
mysqli_set_charset($connect, 'utf8');
$query1 = "SELECT b.id, b.title,b.genre_id, a.name "
        . "FROM book b "
        . "INNER JOIN book_id_autor_id ba "
        . "ON b.id=ba.book_id and b.genre_id=2 "
        . "INNER JOIN autor a ON ba.autor_id=a.id";

$books = mysqli_query($connect, $query1);
while($row = mysqli_fetch_array($books)){
        $arrBooks[]=$row;
    }
$qurey2="SELECT COUNT(book_id) AS count,autor_id "
        . "FROM book_id_autor_id "
        . "GROUP BY(autor_id) "
        . "ORDER BY book_id DESC";
$maxRows= mysqli_query($connect, $qurey2);
$arrMaxRows = [];
while($row = mysqli_fetch_array($maxRows)){
        $arrMaxRows[]=$row;
    }
$maxAutorID=0;
$count=0;
foreach ($arrMaxRows as $val){
    if($val['count']>$count){
        $count = $val['count'];
        $maxAutorID=$val['autor_id'];
    }
}
$query3="SELECT * FROM autor WHERE id=".$maxAutorID;
$result3 = mysqli_query($connect, $query3);
$maxAutorName= mysqli_fetch_array($result3);