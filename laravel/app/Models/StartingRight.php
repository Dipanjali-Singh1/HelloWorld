<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class StartingRight extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'starting_rights';

    public function getAllStartingRight(){
        return $this->orderBy('id', 'DESC')->get();
    }
}