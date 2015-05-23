<?php
  class MyDB extends SQLite3 {
	  function __construct() {
	  	$this->open('db/report_contents.db');
	  }
  }
  
  $db = new MyDB();
  if(!$db){
  	echo $db->lastErrorMsg();
  }
  
//  fetch all people 
 	$people = $db->prepare('SELECT distinct(subject_id),subject_name FROM report');		 

//	show person report

	$subject_id = $_GET['person'];
?>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link href="style.css" media="all" rel="stylesheet" type="text/css"/>
</head>
<body>

<form action="index.php?person=$subject_id" method="GET">
<select name="person">
	<?php
		$person = $people->execute();
	
		while ($row = $person->fetchArray()) {
			echo '<option value="'.$row['subject_id'].'">' . $row['subject_name'] . '</option>';
		}

	?>
</select>

<input type="submit">
</form>

</body>
</html>

