<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class AboutUs extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'about_us';

    public function getAllAbout(){
        return $this->orderBy('id', 'DESC')->get();
    }
}
