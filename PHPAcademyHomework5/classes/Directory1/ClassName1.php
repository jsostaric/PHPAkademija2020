<?php

namespace classes\Directory1;

use classes\Directory0\AbstractClass;

class ClassName1 extends AbstractClass
{
    public function viewAction()
    {
        return get_class($this);
    }
}