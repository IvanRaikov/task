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

$query1 = "SELECT b.title, a.name
        FROM book b
        INNER JOIN book_id_autor_id ba
        ON b.id=ba.book_id 
        INNER JOIN autor a
        ON ba.autor_id=a.id
        INNER JOIN book_id_genre_id bg
        ON bg.book_id = b.id
        INNER JOIN genre g
        ON bg.genre_id = g.id
        WHERE g.title='фантастика'";

$books = mysqli_query($connect, $query1);
while($row = mysqli_fetch_array($books)){
        $arrBooks[]=$row;
    }
$query2="SELECT * FROM autor WHERE id=( "
        . "SELECT autor_id "
        . "FROM book_id_autor_id "
        . "GROUP BY autor_id "
        . "ORDER BY count(book_id) "
        . "DESC LIMIT 1)";

$result = mysqli_query($connect, $query2);
$maxAutor= mysqli_fetch_array($result);