<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Workshop extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'workshops';

    public function getAllWorkshops(){
        return $this->orderBy('id', 'DESC')->get();
    }
}
