<?php require_once 'inc/head.php' ?>

<div class="row">
    <div class="columns large-8 large-centered">
        <h1>Hello world!</h1>
        <p>This is paragraph</p>

        <img src="https://media1.tenor.com/images/0b3a8edc92155364dff77032c361e7ac/tenor.gif"
                alt="Budgie" />

        <hr>

        <?php
            $a = 5;
            $b = 4;
         ?>

         <!-- table with standard elements and some arithmetic operators  -->
        <table>
            <thead>
                <tr>
                    <th>Adding</th>
                    <th>Multiply</th>
                    <th>Divide</th>
                    <th>Modulo</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?= $a + $b // result 9?></td>
                    <td><?= $a * $b //result 20?></td>
                    <td><?= $a / $b //result 1.25 ?></td>
                    <td><?= $a % $b //result 1 ?></td>
                </tr>
                <tr>
                    <td><?= $a += 16 // result $a = 21?></td>
                    <td><?= $a *= 10  //result 210?></td>
                    <td><?= ($a /= $b) - 50.5  //result 2 ?></td>
                    <td><?= $a % $b //result 0 - doesn't work with doubles ?></td>
                </tr>
            </tbody>
        </table>

        <!-- <pre> element for preformatted text -->
        <pre>
        <?php
            $array = [12,23,25,5,7,8];
            print_r($array);
        ?>
        </pre>

        <!-- elements for organized list -->
        <h3>Todo list:</h3>
        <ol>
            <li>Learn PHP</li>
            <li>Don't forget to eat</li>
            <li>Take a break from time to time</li>
            <li>Rehydrate</li>
        </ol>

    </div>
</div>

<?php require_once 'inc/footer.php' ?>

