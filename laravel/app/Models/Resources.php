<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Resources extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'resources';
    public function ArticleType(){
        return $this->hasOne(ArticleType::class, 'id', 'type_id');
    }
    public function getReading(){
        return $this->where(['type_id'=>1])->orderBy('id', 'DESC')->limit(8)->get();
    }

    public function getWriting(){
        return $this->where(['type_id'=>2])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getWorkSkills(){
        return $this->where(['type_id'=>3])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getReferencing(){
        return $this->where(['type_id'=>4])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getNumeracy(){
        return $this->where(['type_id'=>5])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getAllRemedial(){
        return $this->orderBy('id', 'DESC')->get();
    }
}
