<?php
if(!$argv[1]){
    die('FAIL агрументы не переданы====');
}
$string=$argv[1];
$stack=array();
$result="---FAIL---";

if(substr_count($string,"(") == substr_count($string,")")){
    preg_match_all("[\(|\)]",$string,$found);
    $array = $found[0];
    foreach($array as $val){
        if($val == "("){
            array_push($stack, $val);
            $result = "---OK---";
        }else{
            if(empty($stack)){
                $result = "FAIL";
                break;
            }else{
                array_pop($stack);
            }
        }
    }
}echo $result;
