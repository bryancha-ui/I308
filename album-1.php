<!DOCTYPE html>
<html>
<body>
<h1> Album Table</h1>
<h2>Insert a new Album</h2>
<form action="albuminsert.php" method="post">
	Title:  <input type="text" name="form_title" maxlength="50"  size="50" required><br>
	
Band: <select name="form_band" required>
<?php
// NOah Spencer, Camille Taylor
$conn=mysqli_connect("db.soic.indiana.edu","i308s21_clt4","my+sql=i308s21_clt4", "i308s21_clt4");
// Check connection
if (!$conn){
	die("Failed to connect to MySQL: " . mysqli_connect_error()); 
}
$result = mysqli_query($conn,"SELECT distinct title, id from band order by title asc");
            while ($row = mysqli_fetch_assoc($result)){
                unset($id,$title);
                $id= $row['id'];
                $title=$row['title'];
                echo '<option value="'.$id.'">'.$title.'</option>';
            }

?>
		</select> 
	</br>

	Published Year: <input type="number" name="form_year" min="1900" max="2025" required><br>
	Publisher:  <input type="text" name="form_publisher" required><br>
	Format: <select name="form_format">
		<option value="s">Single</option>
<option value="d">Double</option>
  	</select>
  	<br><br>
 <button type "submit" value = "Submit">Insert Album</button>

</form>
<h2>Select All Albums</h2>
<form action="albumselect.php" method="post">
  </select>
  <button type "submit" value = "Submit">Select Album Table</button>
</form>

</body>
</html>