<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('users', UserController::class);
    $router->resource('articles', ArticleController::class);
    $router->resource('article-types', ArticleTypeController::class);
    $router->resource('homes', HomesController::class);
    $router->resource('news', NewsController::class);
    $router->resource('remedials', RemedialController::class);
    $router->resource('testimonials', TestimonialController::class);
    $router->resource('numeracies', NumeracyController::class);
    $router->resource('about-uses', AboutController::class);
    $router->resource('quizzes', QuizController::class);
    $router->resource('workshops', WorkshopController::class);
    $router->resource('resources', ResourcesController::class);
    $router->resource('starting-rights', StartingRightController::class);
    $router->resource('f-a-qs', FAQController::class);
    $router->resource('surveys', SurveyController::class);
});
