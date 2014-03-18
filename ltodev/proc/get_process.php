<?php

$link = mysqli_connect("localhost","lto","p3@ktr@m","LTO") or die("Error wew" . mysqli_error($link));

if(isset($_POST['register'])) {
	$data = $_POST;
	$path = "/var/www/db/data_ins/{$data['user_email']}";
	echo "wew";
	var_dump($data);

	$fh					= fopen($path, 'a') or die("can't open file"); // w => write; a => append;
	$stringData = "<type_insurance>{$data['type_insurance']}</type_insurance><firstname>{$data['firstname']}</firstname><lastname>{$data['lastname']}</lastname><address>{$data['address']}</address><user_email>{$data['user_email']}</user_email><telnum>{$data['telnum']}</telnum><years>{$data['years']}</years><make>{$data['make']}</make><models>{$data['models']}</models><trans>{$data['trans']}</trans><plate_number>{$data['plate_number']}</plate_number><color>{$data['color']}</color><chasis>{$data['chasis']}</chasis><engine>{$data['engine']}</engine><mv>{$data['mv']}</mv>\n";

	if(fwrite($fh, $stringData)) {
		fclose($fh);
		$key = md5(microtime().rand());

		$insert_key = md5($key);
		$query = "INSERT INTO insurance_keycode (key_code, email) VALUES ('{$insert_key}','{$data['user_email']}')";
		# execute the query.
		if ($result = $link->query($query) or die("Error in the consult.." . mysqli_error($link))) {
			/* Start Mail */
			//$from    = "no-reply@ltoinsurance.test";
	    $subject = "Insurance Activation Code";
	    $message = "Thank you for buying insurance!\n\nHere is your Activation Code: ".$key;
	    $header	 = "From: LTO Insurance<no-reply@lto.com>\r\n";
	    // $message = wordwrap($message, 70); // optional (wrap message, 70 characters)
	    if(mail($data['user_email'], $subject, $message, $header)) {
				header('Location: http://207.29.229.21/ltodev/thank_you.html');
				mysqli_close($link);// close connection
				exit;
	    } else {
	    	echo "Error!";
	    }
		}
	}
} elseif (isset($_POST['conf_submit'])) {
	$check_key = md5($_POST['conf_code']);
	$query 		 = "SELECT * FROM insurance_keycode WHERE key_code = '{$check_key}'";
	$result 	 = $link->query($query) or die("Error in the consult.." . mysqli_error($link));
	$row_cnt 	 = mysqli_num_rows($result);
	if ($row_cnt != 0) {
		session_start();
		$obj = mysqli_fetch_object($result);
		$_SESSION['user_insmail'] = $obj->email;
		echo "<center><br><br><h3 style='color:green'>Loading ...</h3><br><script>parent.location.href = 'http://207.29.229.21/ltodev/view_insurance.php';</script>";
		mysqli_close($link); // close connection
		exit;
	} else {
		echo "<center><br><br><h3 style='color:red'>Invalid Key!</h3><br><a href='/ltodev/confirmation.html'>Back</a><center>";
		mysqli_close($link); // close connection
	}
} else {
	echo 'Nothing to see here :-)';
}

/* close connection */
mysqli_close($link);
?>