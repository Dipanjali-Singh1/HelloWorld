<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class FAQ extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'f_a_q_s';

    public function getAllFAQ(){
        return $this->orderBy('id', 'DESC')->get();
    }
}