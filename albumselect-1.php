<?php
// NOah Spencer, Camille Taylor
$con=mysqli_connect("db.soic.indiana.edu","i308s21_clt4","my+sql=i308s21_clt4", "i308s21_clt4");
// Check connection
if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
	
$santitle = mysqli_real_escape_string($con, $_POST['form_title']);
$sanband = mysqli_real_escape_string($con, $_POST['form_band']);
$sanyear = mysqli_real_escape_string($con, $_POST['form_year']);
$sanpublisher = mysqli_real_escape_string($con, $_POST['form_publisher']);
$sanformat = mysqli_real_escape_string($con,$_POST['form_format']);

$sql2 = "SELECT id, title, pub_year, publisher, format FROM p_album";
$result2 = mysqli_query($con, $sql2);
$num_rows = mysqli_num_rows($result2);

if ($result2->num_rows > 0) {
	Echo "<table>";
Echo "<tr><th>Albums<th><tr>";

while($row = $result2->fetch_assoc()) {
	Echo "<tr><td>" .$row["id"]."</td><td>".$row["title"]."</td>
			<td>" .$row["pub_year"]."</td><td>".$row["publisher"]."</td>
<td>" .$row["format"]."</td><td>".$row["band_id"]."</td></tr>";
		}
echo "</table>";
} else {
  echo "0 results";
}
Echo "$num_rows Rows\n";  
mysqli_close($con);
?>
