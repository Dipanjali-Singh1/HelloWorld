<?php

namespace App\Admin\Controllers;

use App\Models\AboutUs;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AboutController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'AboutUs';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutUs());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('title', __('Title'));
        $grid->column('description', __('Description'));
        $grid->column('keywords', __('Keywords'));
        $grid->column('about_content', __('About content'));
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
        $show = new Show(AboutUs::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('title', __('Title'));
        $show->field('description', __('Description'));
        $show->field('keywords', __('Keywords'));
        $show->field('about_content', __('About content'));
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
        $form = new Form(new AboutUs());

        $form->text('title', __('Title'));
        $form->textarea('description', __('Description'));
        $form->text('keywords', __('Keywords'));
        $form->textarea('about_content', __('About content'));
        $form->image('img', __('Img'));

        return $form;
    }
}
