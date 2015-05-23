<?php
   class MyDB extends SQLite3
   {
      function __construct()
      {
         $this->open('db/report_contents.db');
      }
   }
   $db = new MyDB();
   if(!$db){
      echo $db->lastErrorMsg();
   }
   
   
 	 $statement = $db->prepare('SELECT distinct(subject_id),subject_name FROM report');		 

//   pull person names
//   select distinct(subject_id), subject_name from report
?>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
</head>
<body>

<form action="" method="GET">
<select>
	<?php 
		$results = $statement->execute();
	
		while ($row = $results->fetchArray()) {
			echo '<option value="'.$row['subject_id'].'">' . $row['subject_name'] . '</option>';
		}

	?>
	
	<option value=""></option>
</select>

<input type="submit">
</form>

</body>
</html>

