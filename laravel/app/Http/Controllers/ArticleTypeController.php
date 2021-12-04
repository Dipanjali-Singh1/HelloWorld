<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Article;
use App\Models\Remedial;
use App\Models\ArticleType;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ArticleTypeController extends Controller
{
    public function welcomeInfo(){
        $list = new Article();
        $list = $list->getWelcomeInfo();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }

    public function readingInfo(){
        $list = new Remedial();
        $list = $list->getReadingInfo();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function writingInfo(){
        $list = new Remedial();
        $list = $list->getWritingInfo();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function workSkillsInfo(){
        $list = new Remedial();
        $list = $list->getWorkSkillsInfo();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function referencingInfo(){
        $list = new Remedial();
        $list = $list->getReferencingInfo();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function numeracyInfo(){
        $list = new Remedial();
        $list = $list->getNumeracyInfo();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['article_content']=strip_tags($item['article_content']);
            $item['article_content']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['article_content']);
        }
        return response()->json($list);
    }
    public function allArticlesType(){
        $list = new ArticleType();
        $list = $list->getAllArticles();
       // $list['article_content']=html_entity_decode($list['article_content']);
        foreach ($list as $item){
            $item['description']=strip_tags($item['description']);
            $item['description']=$Content = preg_replace("/&#?[a-z0-9]+;/i"," ",$item['description']);
        }
        return response()->json($list);
    }
}
