<?php

namespace classes\Directory3;

use classes\Directory0\AbstractClass;

class ClassName2 extends AbstractClass
{
    public function viewAction()
    {
        return get_class($this);
    }
}