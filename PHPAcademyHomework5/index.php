<?php

require 'classes/Directory0/AbstractClass.php';
require 'classes/Directory1/ClassName1.php';
require 'classes/Directory1/ClassName2.php';
require 'classes/Directory1/ClassName3.php';
require 'classes/Directory2/ClassName1.php';
require 'classes/Directory2/ClassName2.php';
require 'classes/Directory2/ClassName3.php';
require 'classes/Directory3/ClassName1.php';
require 'classes/Directory3/ClassName2.php';
require 'classes/Directory3/ClassName3.php';
require 'classes/ExtraClass/Prefix.php';
require 'classes/App.php';

use classes\Directory1\ClassName1 as Dir1Class1;
use classes\Directory1\ClassName2 as Dir1Class2;
use classes\Directory1\ClassName3 as Dir1Class3;
use classes\Directory2\ClassName1 as Dir2Class1;
use classes\Directory2\ClassName2 as Dir2Class2;
use classes\Directory2\ClassName3 as Dir2Class3;
use classes\Directory3\ClassName1 as Dir3Class1;
use classes\Directory3\ClassName2 as Dir3Class2;
use classes\Directory3\ClassName3 as Dir3Class3;
use classes\ExtraClass\Prefix;
use classes\App;

//set class Prefix date property
$prefix = new Prefix;
$prefix->setDate('10.09.2020.');

//choose random class
$dirs = ['Directory1', 'Directory2', 'Directory3'];
$randomDirKey =array_rand($dirs, 1);

$files = ['ClassName1', 'ClassName2', 'ClassName3'];
$randomFileKey = array_rand($files, 1);

$dir = $dirs[$randomDirKey];
$file = $files[$randomFileKey];

$class = 'classes\\' . $dir . '\\' . $file;

//instantiate random object
$object = new $class;

echo App::go($prefix, $object);


