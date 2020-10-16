<?php

namespace classes;

use classes\ExtraClass\Prefix;

final class App extends Prefix
{
    public static function go($prefix, $name)
    {
        return $prefix->getDate() . ' - ' .$name->viewAction();
    }
}