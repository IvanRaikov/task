<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
if(count($_POST) != 0){
    $fname = $_POST['fname'];
    $sname = $_POST['sname'];
    $pname = $_POST['pname'];
    $email = $_POST['email'];
    $comment = $_POST['comment'];
    $phone = $_POST['phone'];
    $file = $_FILES['file'];
    $errors=[];
    validate($fname,'имя', $errors);
    validate($sname,'фамилия', $errors);
    validate($pname,'отчество', $errors);
    validate($comment,'комментарий', $errors);
    emailValidate($email, $errors);
    phoneValidate($phone, $errors);
    fileValidate($file, $errors);
    if(count($errors)>0){
        echo json_encode($errors);
    }else{
        echo "OK";
    }
}
function validate($arg, $atrName, &$errors){
    if(empty($arg)){
       array_push($errors, "поле ".$atrName."  должно быть заполнено");
    }
}
function emailValidate($string, &$errors){
    if(!preg_match("/[0-9a-z_-]+@[0-9a-z_-]+\.[a-z]{2,5}/i",$string)){
        array_push($errors, "email заполнен не корректно");
    }
}
function phoneValidate($phone, &$errors){
    if(!preg_match("/^\+?[7|8|9][0-9]{6,10}$/", $phone)){
        array_push($errors, "телефон заполнен не коректно");
    }
}
function fileValidate($file, &$errors){
    if(empty($file)){
       array_push($errors, "вы не выбрали файл");
    }
}    

