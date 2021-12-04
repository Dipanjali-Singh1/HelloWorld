<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Survey;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
class SurveyController extends Controller
{
    public function allSurvey(){
        $list = new Survey();
        $list = $list->getAllSurvey();
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
    $survey = new Survey();
    $survey->description=$request->post("description");
    $survey->article_content=$request->post("article_content");

    if($survey->save()){

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

    public function feedback1(Request $request)
    {
    //     return $request->all();
    $survey = new Survey();
    //$survey->description=$request->post("description");
    $survey->article_content=$request->post("article_content");

    if($survey->save()){

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
