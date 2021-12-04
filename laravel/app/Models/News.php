<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'news';
    public function getAllNews(){
        return $this->orderBy('id', 'DESC')->get();
    }
    public function getAnnouncements(){
        return $this->where(['description'=>'Announcements'])->orderBy('id', 'DESC')->limit(3)->get();
    }
    public function getWeeklyNews(){
        return $this->where(['description'=>'WeeklyNews'])->orderBy('id', 'DESC')->limit(3)->get();
    }
}
