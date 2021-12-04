<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Survey extends Model
{
    use DefaultDatetimeFormat;
    protected $table = 'surveys';
    protected $fillable = [
        'description','article_content',
    ];
    public function getAllSurveys(){
        return $this->orderBy('id', 'DESC')->get();
    }
}