<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FAQ;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class FAQController extends Controller
{
    
    public function allFAQ(){
        $list = new FAQ();
        $list = $list->getallFAQ();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['about_content']=strip_tags($item['about_content']);
            $item['about_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['about_content']);
        }
        return response()->json($list);
    }

}
