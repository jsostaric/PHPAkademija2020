<?php require_once 'inc/head.php' ?>

<div class="row">
    <div class="columns large-8 large-centered">
        <h2>Incrementing/Decrementing</h2>
        <hr>

        <!-- loops through $a and $b while incrementing $a by 2 and decrementing $b by 1 -->
        <?php
            $a = 0;
            $b = 10;

             while ( $a <= 10) {
                echo 'value of <b>$a</b> is: ' . $a . "<br>"; //output starts with 0 then increase

                echo 'value of <i>$b</i> is: ' . $b . "<br>"; //output starts with 10 then decrease

                echo '<br>';

                $a += 2;
                --$b;
            }
        ?>
    </div>
</div>

<?php require_once 'inc/footer.php' ?>