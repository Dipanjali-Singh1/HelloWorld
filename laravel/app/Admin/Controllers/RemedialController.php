<?php

namespace App\Admin\Controllers;

use App\Models\Remedial;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class RemedialController extends AdminController
{
   /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Remedial';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Remedial());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('title', __('Title'));
        $grid->column('description', __('Description'));
        $grid->column('type_id', __('Type id'));
        $grid->column('keywords', __('Keywords'));
        $grid->column('article_content', __('Article content'));
        $grid->column('img', __('Img'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Remedial::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('title', __('Title'));
        $show->field('description', __('Description'));
        $show->field('type_id', __('Type id'));
        $show->field('keywords', __('Keywords'));
        $show->field('article_content', __('Article content'));
        $show->field('img', __('Img'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Remedial());

        $form->text('title', __('Title'));
        $form->text('description', __('Description'));
        $form->number('type_id', __('Type id'));
        $form->text('keywords', __('Keywords'));
        $form->textarea('article_content', __('Article content'));
        $form->image('img', __('Img'));

        return $form;
    }
}
