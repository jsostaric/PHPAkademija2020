<?php require_once 'inc/head.php' ?>

<div class="row">
    <div class="columns large-6 large-centered">
        <h1>Logical Operators</h1>
        <hr>

        <!-- form takes two numbers and tells if numbers are between 0 and 5 -->
        <form method="post" action="<?= $_SERVER['PHP_SELF'] ?>">
            <fieldset class="fieldset">
                <legend>Enter numbers:</legend>
                <label for="num1">Enter first number:</label>
                <input type="number" name="num1" id="num1">

                <label for="num2">Enter second number:</label>
                <input type="number" name="num2" id="num2">

                <button class="success button">Submit</button>
            </fieldset>
        </form>

        <?php
            if(isset($_POST['num1']) && isset($_POST['num2'])){
                $num1 = $_POST['num1'];
                $num2 = $_POST['num2'];

                if(($num1 > 0 && $num2 > 0) && ($num1 <= 5 && $num2 <= 5)): ?>
                    <strong><?= 'numbers are between 0 and 5'; ?> </strong>
                <?php else: ?>
                    <span style="color:red"><?= 'numbers are not in 0 to 5 range'?></span>
                <?php endif;
            }
        ?>

    </div>
</div>

<?php require_once 'inc/footer.php' ?>