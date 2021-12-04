<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
//use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;

class ArticleType extends Model
{
    use DefaultDatetimeFormat;
   // use ModelTree;
    //table name
    protected $table = 'article_types';
    public function getAllArticles(){
        return $this->orderBy('id', 'DESC')->get();
    }
    public function getRecommended(){
        return $this->where(['order'=>6])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getReading(){
        return $this->where(['order'=>11])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getWriting(){
        return $this->where(['order'=>12])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getWorkSkills(){
        return $this->where(['order'=>13])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getReferencing(){
        return $this->where(['order'=>14])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getList(){
        return $this->get();
    }
}
