<!DOCTYPE html>
<html lang="en">
<head>
    <title>Task2</title>
</head>
<body>


<?php
// Output given alphabet: 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z' in each row without commas. Number of rows equals number of letters in an alphabet.

// Each next row will continue from next letter of alphabet (so that we can read alphabet when looking both horizontally and vertically).

// Once alphabet stops in a row it will start again, but only for number letters that need to match number of letters in the first line.

// Starting from 13th position (letter m), draw a snake like pattern that will bounce of edges.

// See homework2_task2.png for wanted result.

// Use loops to complete the task.

function dnd($name){
    echo '<pre>';
    var_dump($name);
    echo '</pre>';
    die();
}

$alphabet = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z';
$alphabetArr = explode(',', $alphabet);
$alphabetLength = count($alphabetArr);


$startingPosition = 12;

for ($i=0; $i < $alphabetLength ; $i++) {
    for ($j=0; $j < $alphabetLength; $j++) {
        if($startingPosition + $j == $i){
            echo '<b>' . $alphabetArr[$j] . '</b>';
            continue;
        }

        if($startingPosition - $i == $j) {
            echo '<b>' . $alphabetArr[$j] . '</b>';
            continue;
        }

        echo $alphabetArr[$j];
    }

    array_push($alphabetArr, $alphabetArr[0]);
    array_shift($alphabetArr);

    echo '<br>';
}
?>

</body>
</html>