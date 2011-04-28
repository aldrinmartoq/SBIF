<?php

$url = $_SERVER[REQUEST_URI];
$url = str_replace("/huevapi/SBIF/api-sbif.php", "", $url);

$url = "http://api.sbif.cl/api-sbif".$url."?apikey=b7e4ef2d3b8ed7e62a1fba8bcc50a97a536e6d98&formato=json";

echo file_get_contents($url);
