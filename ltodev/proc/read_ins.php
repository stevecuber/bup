<?php
session_start();

function within_str($subject, $lsearch, $rsearch) {
  $data = strstr($subject, $lsearch);
  $data = str_replace($lsearch, "", $data);
  $trim = strstr($data, $rsearch);
  return(str_replace($trim, "", $data));
}

	$insurance_dir 	= "/var/www/db/data_ins/";
	$file_insurance = "{$insurance_dir}{$_SESSION['user_insmail']}";
	$insurance_data = file($file_insurance);

	if(file_exists($file_insurance)) {
		for ($i=0; $i < count($insurance_data); $i++) {
			$type_insurance[$i] = within_str($insurance_data[$i], "<type_insurance>", "</type_insurance");
			$firstname[$i] 			= within_str($insurance_data[$i], "<firstname>", "</firstname>");
			$lastname[$i] 			= within_str($insurance_data[$i], "<lastname>", "</lastname>");
			$address[$i] 				= within_str($insurance_data[$i], "<address>", "</address>");
			$user_email[$i] 		= within_str($insurance_data[$i], "<user_email>", "</user_email>");
			$telnum[$i] 				= within_str($insurance_data[$i], "<telnum>", "</telnum>");
			$years[$i] 					= within_str($insurance_data[$i], "<years>", "</years>");
			$make[$i] 					= within_str($insurance_data[$i], "<make>", "</make>");
			$models[$i] 				= within_str($insurance_data[$i], "<models>", "</models>");
			$trans[$i] 					= within_str($insurance_data[$i], "<trans>", "</trans>");
			$plate_number[$i] 	= within_str($insurance_data[$i], "<plate_number>", "</plate_number>");
			$color[$i] 					= within_str($insurance_data[$i], "<color>", "</color>");
			$chasis[$i] 				= within_str($insurance_data[$i], "<chasis>", "</chasis>");
			$engine[$i] 				= within_str($insurance_data[$i], "<engine>", "</engine>");
			$mv[$i] 						= within_str($insurance_data[$i], "<mv>", "</mv>");
		}
	} else {
			$type_insurance = "";
			$firstname 			= "";
			$lastname			 	= "";
			$address		 		= "";
			$user_email			= "";
			$telnum					= "";
			$years					= "";
			$make						= "";
			$models					= "";
			$trans					= "";
			$plate_number		= "";
			$color					= "";
			$chasis					= "";
			$engine					= "";
			$mv							= "";
	}

	echo '<script type="text/javascript">/* <![CDATA[ */';
	echo 'var insurance = '.json_encode($insurance_data);
	echo '/* ]]> */</script>';

?>