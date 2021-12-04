<?php

namespace App\Models;

use Encore\Admin\Traits\DefaultDatetimeFormat;
use Illuminate\Database\Eloquent\Model;

class Testimonial extends Model
{
    use DefaultDatetimeFormat;
    protected $table = 'testimonials';
    protected $fillable = [
        'description', 
    ];
    public function getAllTestimonials(){
        return $this->orderBy('id', 'DESC')->get();
    }
}