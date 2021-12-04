<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use DefaultDatetimeFormat;
    //table name
    protected $table = 'quizzes';

    public function getAllQuiz(){
        return $this->orderBy('id', 'DESC')->get();
    }
}
