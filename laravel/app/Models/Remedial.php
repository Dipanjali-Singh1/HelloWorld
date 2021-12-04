<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Remedial extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'remedials';
    public function ArticleType(){
        return $this->hasOne(ArticleType::class, 'id', 'type_id');
    }
    public function getReading(){
        return $this->where(['type_id'=>11])->orderBy('id', 'DESC')->limit(8)->get();
    }

    public function getWriting(){
        return $this->where(['type_id'=>12])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getWorkSkills(){
        return $this->where(['type_id'=>13])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getReferencing(){
        return $this->where(['type_id'=>14])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getNumeracy(){
        return $this->where(['type_id'=>15])->orderBy('id', 'DESC')->limit(8)->get();
    }
    public function getAllRemedial(){
        return $this->orderBy('id', 'DESC')->get();
    }
}
