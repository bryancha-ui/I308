<?php
// NOah Spencer, Camille Taylor
$con=mysqli_connect("db.soic.indiana.edu","i308s21_clt4","my+sql=i308s21_clt4", "i308s21_clt4");
// Check connection
if (mysqli_connect_errno())
	{die("Failed to connect to MySQL: " . mysqli_connect_error()); }
else 
	{ echo "Established Database Connection";}
	
$result = mysqli_query($conn,"SELECT distinct band FROM p_band");	
$santitle = mysqli_real_escape_string($con, $_POST['form_title']);
function sanitize($santitle) {
	$santitle = trim ($data);
	$santitle = stripslashes($data);
	$santitle = htmlspecialchars($data);
return $santitle;}
$sanband = mysqli_real_escape_string($con, $_POST['form_band']);
$sanyear = mysqli_real_escape_string($con, $_POST['form_year']);
$sanpublisher = mysqli_real_escape_string($con, $_POST['form_publisher']);
$sanformat = mysqli_real_escape_string($con,$_POST['form_format']);


$sql="INSERT INTO p_album (pub_year,title,publisher,format,band_id) VALUES ('$sanyear','$santitle','$sanpublisher','$sanformat','$sanband')";
if (mysqli_query($con, $sql))
	{echo "1 record added";}
else
	{die("SQL Error: " . mysqli_error($con)); }
mysqli_close($con);
?>

