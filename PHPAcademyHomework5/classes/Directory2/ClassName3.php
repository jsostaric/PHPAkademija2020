<?php

namespace classes\Directory2;

use classes\Directory0\AbstractClass;

class ClassName3 extends AbstractClass
{
    public function viewAction()
    {
        return get_class($this);
    }
}