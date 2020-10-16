<?php
/*
 * first assigment
*/
namespace classes;

class Movie
{
    private $title;
    private $lengthTime;

    public function __construct($title = '', $lengthTime = 0)
    {
        $this->title = $title;
        $this->lengthTime = $lengthTime;
    }

    public function __get($name)
    {
        return $this->$name ?? null;
    }

    public function __set($name, $value)
    {
        property_exists($this, $name) ? $this->$name = $value : null;
    }
}