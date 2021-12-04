<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Resources;
use App\Models\ArticleType;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ResourcesController extends Controller
{
    public function getReading(){
        $list = new Resources();
        $list = $list->getReading();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function getWriting(){
        $list = new Resources();
        $list = $list->getWriting();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function getWorkSkills(){
        $list = new Resources();
        $list = $list->getWorkSkills();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function getReferencing(){
        $list = new Resources();
        $list = $list->getReferencing();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function getNumeracy(){
        $list = new Resources();
        $list = $list->getNumeracy();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function allResources(){
        $list = new Resources();
        $list = $list->getAllResources();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
}
