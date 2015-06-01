<?php
//Load original image
$filename="04_original.jpg";
$img = imagecreatefromjpeg ($filename);
// Get parameters:
$nw=$_GET["nw"]; // Number of sub images on Width
$nh=$_GET["nh"]; // Number of subimages on Height
$w=$_GET["w"]; // Index image of Width
$h=$_GET["h"]; // Index image of Height
// Get image properties
$size = getimagesize($filename);
$imgwith=$size[0];
$imgheight=$size[1];
// Calculate crop dimension and possiton
$wdim=$imgwith/$nw;
$hdim=$imgheight/$nh;
$wpos=(($w-1)*$wdim);
$hpos=(($h-1)*$hdim);

// Crop
$img = imagecrop($img, array('x' => $wpos, 'y' => $hpos, 'width' => $wdim, 'height' => $hdim));
// Send the image
header( "Content-type: image/jpg" );
imagejpeg( $img );
imagedestroy( $img );
?> 