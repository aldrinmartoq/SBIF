<?php

$url = $_SERVER[REQUEST_URI];
$url = str_replace("/huevapi/SBIF/api-sbif.php/", "", $url);

$cachefile = "cache/" . preg_replace("/[^a-zA-Z0-9\s]/", "-", $url);
$cachetime = 60 * 60 * 0.5; // 60 seg * 60 min * 0.5 = 30 min

if (file_exists($cachefile) && (time() - $cachetime < filemtime($cachefile))) {
	echo file_get_contents($cachefile);
} else {
	include(".apikey.php");
	$url = "http://api.sbif.cl/api-sbif/".$url."?apikey=".$apikey."&formato=json";
	$data = file_get_contents($url);
	$fp = fopen($cachefile, 'w');
	fwrite($fp, $data);
	fclose($fp);
	echo $data;
}
