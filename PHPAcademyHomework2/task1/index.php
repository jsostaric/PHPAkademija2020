<!DOCTYPE html>
<html lang="en">
<head>
    <title>Task1</title>
</head>
<body>


<?php

// Output given alphabet: 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z' in each row without commas. Number of rows equals number of letters in your name.

// Each row will have one letter from your name bolded, starting from first letter and proceeding in order. Example tomislav, will have "t" bolded in first row, "o" in second, etc.

// Each row will have one letter from your name underlined, starting from last letter and proceeding in reversed order. Example tomislav, will have "v" underlined in first row, "a" in second, etc.

// Start with variable $name='yourname'; with your name assigned as string, and proceed to work with it until you get what you need.

// See homework2_task1.png for wanted result.

// Use loops to complete the task.

function dnd($name){
    echo '<pre>';
    var_dump($name);
    echo '</pre>';
    die();
}

$name = 'jurica';
$nameLength = strlen($name); // is 6
$nameArr = str_split($name); //string to array
$inverseName = array_reverse($nameArr);


$alphabet = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z';
$alphabetArr = explode(',', $alphabet);
$alphabetLength = count($alphabetArr);

for ($i=0; $i < $nameLength ; $i++) {
    for ($j=0; $j < $alphabetLength ; $j++) {
        if($nameArr[$i] == $alphabetArr[$j]) {
            if($nameArr[$i] == $inverseName[$i]){ //solving a problem where names have odd number of letters
                echo '<b><u>' . $nameArr[$i] . '</u></b>';
                continue;
            }
            echo '<b>' . $nameArr[$i] . '</b>';
        }

        if($inverseName[$i] == $alphabetArr[$j]){
            echo '<u>' . $inverseName[$i] . '</u>';
            continue;
        }

        echo $alphabetArr[$j];
    }

    echo '<br>';
}
?>
</body>
</html>