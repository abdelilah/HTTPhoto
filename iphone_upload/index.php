<?php
error_reporting(0);
//print_r($_FILES);
$uploaddir = './';

foreach($_FILES as $k =>$f)
{
	$file = basename($_FILES[$k]['name']);
	move_uploaded_file($_FILES['userfile']['tmp_name'], $uploaddir.$file);
	//echo "$file\n";
}
?>1