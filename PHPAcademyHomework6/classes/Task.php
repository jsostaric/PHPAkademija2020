<?php

/*
 * second assigment
*/
namespace classes;

class Task
{
    private $data = [];

    public function __call($name, $arguments){
        $prefix = substr($name, 0, 3);
        $name = substr($name, 3);
        $args = implode(', ', $arguments);

        if ($prefix == 'set') {
            $this->data[$name] = $args;
        }else if($prefix === 'get'){
            return $this->data[$name];
        }else if($prefix === 'has'){
            return array_key_exists($name, $this->data) ? 'true' : 'false';
        }else if($prefix === 'uns'){
            unset($this->data[$name]);
        }else{
            throw new \Exception("Method does not exists");
        }
    }
}