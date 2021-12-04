<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Homes extends Model
{
    use DefaultDatetimeFormat;
    protected $table = 'homes';
    public function getAllHomes(){
        return $this->orderBy('id', 'DESC')->get();
    }
}
