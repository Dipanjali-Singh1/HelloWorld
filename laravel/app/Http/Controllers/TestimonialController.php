<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Testimonial;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
class TestimonialController extends Controller
{
    public function allTestimonial(){
        $list = new Testimonial();
        $list = $list->getAllTestimonial();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function feedback(Request $request)
    {
    //     return $request->all();
    $testimonial = new Testimonial();
    $testimonial->description=$request->post("description");

    if($testimonial->save()){

        return response()->json([
            'success' => true
        ]);

    }else{
        return response()->json([
            'success' => false
        ]);

    }
    //    $input = $request->only( 'description');
    //  //  $input=$request->all;
    //    return response()->json([
    //     'success' => true,
    //     'message' => 'Testimonial has been updated successfully!'
    // ]);
    }

}
