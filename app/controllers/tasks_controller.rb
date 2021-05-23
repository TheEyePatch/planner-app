class TasksController < ApplicationController
    before_action :get_category 
    def index
        @tasks = @category.tasks.all
    end
    def new
        @task = @category.tasks.build
    end
    def create 
        @task = @category.tasks.build(task_params)
        if @task.valid?
        @task.save
        redirect_to categories_path(@category)
        else 
            redirect_to new_category_task_path(@category), notice: @task.errors.full_messages
        end
    end
    def show
        @task = @category.tasks.find(params[:id])
    end
    def edit
        @task = @category.tasks.find(params[:id])
    end
    def update
        @task = @category.tasks.find(params[:id])

        if @task.update(task_params)
            @task.save
            redirect_to category_task_path(@category, @task)
        else
            redirect_to edit_category_task_path(@category, @task), notice: @task.errors.full_messages
        end
    end
    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to category_tasks_path(@category)
    end
    private 
    def get_category
        @category =Category.find(params[:category_id])
    end
    def task_params
        params.require(:task).permit(:title, :description, :deadline, :category_id)
    end
end
