class TasksController < ApplicationController
    before_action :authenticate_user!
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
        redirect_to category_tasks_path(@category), notice: "Successfully created new Task!"
        else 
            redirect_to new_category_task_path(@category), alert: @task.errors.full_messages
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
            redirect_to category_tasks_path(@category), notice: "Successfully edited Task!"
        else
            redirect_to edit_category_task_path(@category, @task), alert: @task.errors.full_messages
        end
    end
    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to categories_path
    end
    private 
    def get_category
        @category =current_user.categories.find(params[:category_id])
    end
    def task_params
        params.require(:task).permit(:title, :description, :deadline, :category_id, :completed)
    end
end
