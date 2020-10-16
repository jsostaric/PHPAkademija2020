<?php

//************** first assigment **********************
require 'classes/Movie.php';
require 'classes/Task.php';

use classes\Movie;
use classes\Task;

$movie = new Movie();

$movie->title = 'Serenity';
$movie->test = 'Something';
$movie->title = 'Firefly';
$movie->lengthTime = 220;

// echo '<pre>';
// var_dump($movie);
// echo '</pre><br>';

echo $movie->title;
echo '<br>';
echo $movie->lengthTime;

echo '<hr>';

//************** second assigment *********************
$task = new Task();

try {
    // $task->doWhile(); //will throw exception

    $task->setTask('House Chores', 5, 'done');
    $task->setChore('Cook dinner');

    echo $task->hasChore();
    echo '<br>';
    echo $task->getChore();
    echo '<br>';

    $task->unsChore();

    echo $task->hasChore();


} catch (\Exception $e) {
    echo $e->getMessage();
}