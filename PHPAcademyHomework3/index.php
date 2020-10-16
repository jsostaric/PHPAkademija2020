<!DOCTYPE html>
<html lang="en">
<head>
    <title>Homework 3</title>
</head>
<body>


<?php
// 1. Create a custom function that accepts one string parameter and returns it reversed. Example input: "random string" => output: "gnirts modnar". Don't use built-in strrev() function

// first method: split to array, reverse and put it back to string and return
function reverse(string $string): string{
    $stringArr = str_split($string);
    $reversedArr = array_reverse($stringArr);

    return $reveresedString = implode('', $reversedArr);
}


// second method: for loop from back to front
function reverseString(string $string): string {
    $reversedString = '';
    $length = strlen($string);
    for ($i= $length-1; $i >= 0 ; $i--) {
        $reversedString .= $string[$i];
    }
    return $reversedString;
}

echo reverse('random string to test gibberish');
echo '<hr>';


// 2. Create a custom function to calculate and return the factorial of a number. Example input: 5 => output: 120. Using recursion gives extra points.

// recursive function
function factorial($number) {
    echo $number == 1 ? $number . ' = ' : $number . '*';
    if($number < 2){
        return 1;
    }else{
        return ($number * factorial($number-1));
    }
}


function getFactorial(int $num) {
    if($num == 0) {
        return '0! is: 1';
    }
    $result = 1;
    $process = '';
    for ($i=$num; $i >0 ; $i--) {
       $result *= $i;
       $i == 1 ? $process .= $i : $process .= $i . '*';
    }
    return $num . '! = ' . $process . ' = ' . $result;
}


echo factorial(5);
echo '<br>';
echo '<br>';
echo getFactorial(5);

echo '<hr>';


// 3. Generate and display this string: My favorite color is $color. $color from the string needs to be value that is submitted from the attached form:

if(isset($_POST['color'])) {
   $color = $_POST['color'];

   echo "<h3>
            <span style='color:" . $_POST['color'] . "'>
                My favorite color is {$color}
            </span>
        </h3>"; //yellow doesn't work for some reason
}
?>

<form action="<?= $_SERVER['PHP_SELF'] ?>" method="post">
    <input type="radio" id="white" name="color" value="white">
    <label for="white">White</label><br>
    <input type="radio" id="black" name="color" value="black">
    <label for="black">Black</label><br>
    <input type="radio" id="red" name="color" value="red">
    <label for="red">Red</label><br>
    <input type="radio" id="blue" name="color" value="blue">
    <label for="blue">Blue</label><br>
    <input type="radio" id="green" name="color" value="green">
    <label for="green">Green</label><br>
    <input type="radio" id="yellow" name="color" value="yellow">
    <label for="yellow">Yellow</label><br>

    <button>Submit</button>
</form>
<hr>

<?php
// 5. Create image upload form and backend functionality to save an image on the server. The Image can be uploaded only if it's less than 1MB and is one of these formats: jpg, jpeg, png.
?>
<h2>Upload an image:</h2>
<form action="<?= $_SERVER['PHP_SELF'] ?>" method="post" enctype="multipart/form-data">
    <input type="file" name="image">
    <button>Submit</button>
</form>

<?php
if (isset($_FILES['image'])) {
    $imageName = $_FILES['image']['name'];
    $imageSize = $_FILES['image']['size'];
    $imageTmpName = $_FILES['image']['tmp_name'];
    $extension = explode('.', $imageName);
    $imageExtension = strtolower(end($extension));
    $message = '';
    if ($imageSize > 1000000) {
        $message = 'image must be less than 1mb';
    }

    if($imageExtension != 'jpg' && $imageExtension != 'jpeg' && $imageExtension != 'png' ) {
        $message = 'image must be jpg,jpeg or png format';
    }
    if($message != ''){
        echo $message;
    }else{
        $filepath = "images/{$imageName}";

        move_uploaded_file($imageTmpName, 'images/'.$imageName);

        echo 'file have been stored in images directory';

        var_dump($_FILES);
    }
}
?>

</body>
</html>