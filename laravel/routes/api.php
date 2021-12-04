<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/register', 'App\Http\Controllers\UserController@register');
Route::post('/login', 'App\Http\Controllers\UserController@login');
Route::get('/user', 'App\Http\Controllers\UserController@getCurrentUser');
Route::post('/update', 'App\Http\Controllers\UserController@update');
Route::get('/logout', 'App\Http\Controllers\UserController@logout');

Route::get('/welcomeinfo/', 'App\Http\Controllers\ArticleController@welcomeInfo');
Route::get('/recommendedarticles/', 'App\Http\Controllers\ArticleController@getRecommended');
Route::get('/allarticles/', 'App\Http\Controllers\ArticleController@allArticles');
Route::get('/allarticlestypes/', 'App\Http\Controllers\ArticleTypeController@allArticlesTypes');
Route::get('/allnews/', 'App\Http\Controllers\NewsController@allNews');
Route::get('/announcements/', 'App\Http\Controllers\NewsController@getAnnouncements');
Route::get('/weeklynews/', 'App\Http\Controllers\NewsController@getWeeklyNews');
Route::get('/allhomes/', 'App\Http\Controllers\HomesController@allHomes');
Route::get('/allremedial/', 'App\Http\Controllers\RemedialController@allRemedial');
Route::get('/reading/', 'App\Http\Controllers\RemedialController@getReading');
Route::get('/numeracy/', 'App\Http\Controllers\RemedialController@getNumeracy');
Route::get('/writing/', 'App\Http\Controllers\RemedialController@getWriting');
Route::get('/workskills/', 'App\Http\Controllers\RemedialController@getWorkSkills');
Route::get('/referencing/', 'App\Http\Controllers\RemedialController@getReferencing');
Route::get('/alltestimonial/', 'App\Http\Controllers\TestimonialController@allTestimonial');
Route::get('/allabout/', 'App\Http\Controllers\AboutController@allAbout');
Route::get('/allquiz/', 'App\Http\Controllers\QuizController@allQuiz');
Route::get('/allworkshops/', 'App\Http\Controllers\WorkshopController@allWorkshops');

Route::get('/allresources/', 'App\Http\Controllers\ResourceslController@allResources');
Route::get('/reading1/', 'App\Http\Controllers\ResourcesController@getReading');
Route::get('/numeracy1/', 'App\Http\Controllers\ResourcesController@getNumeracy');
Route::get('/writing1/', 'App\Http\Controllers\ResourcesController@getWriting');
Route::get('/workskills1/', 'App\Http\Controllers\ResourcesController@getWorkSkills');
Route::get('/referencing1/', 'App\Http\Controllers\ResourcesController@getReferencing');
Route::get('/allstartingright/', 'App\Http\Controllers\StartingRightController@allStartingRight');
Route::get('/allfaq/', 'App\Http\Controllers\FAQController@allFAQ');
Route::get('/allsurvey/', 'App\Http\Controllers\SurveyController@allSurvey');

Route::post('/feedback', 'App\Http\Controllers\TestimonialController@feedback');//add feedback
Route::post('/feedback', 'App\Http\Controllers\SurveyController@feedback');
//Route::post('/feedback/', 'App\Http\Controllers\TestimonialController@feedback');

// Route::post('/feedback', function (Request $request){
//     return $request->all();
// });
