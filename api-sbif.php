<?php

$url = $_SERVER[REQUEST_URI];
$url = str_replace("/huevapi/SBIF/api-sbif.php", "", $url);

$cache = "cache/" . preg_replace("/[^a-zA-Z0-9\s]/", "-", $url);
$cachetime = 120 * 60; // 2 horas

if (file_exists($cache) && (time() - $cachetime < filemtime($cache))) {
	//echo file_get_contents($cache);
} else {
	$url = "http://api.sbif.cl/api-sbif".$url."?apikey=b7e4ef2d3b8ed7e62a1fba8bcc50a97a536e6d98&formato=json";
	$data = file_get_contents($url);
	$fp = fopen($cache, 'w');
	fwrite($fp, $data);
	fclose($fp);
}
echo file_get_contents($cache);
