<?php

namespace classes\ExtraClass;

class Prefix
{
    private $date;
    private $name;

    public function getdate()
    {
        return $this->date;
    }

    public function setDate($date)
    {
        $this->date = $date;
    }
}