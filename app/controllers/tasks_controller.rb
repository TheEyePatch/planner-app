class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category 
    before_action :get_overdue_tasks
    
    def index
        @tasks = @category.tasks.order(:deadline)
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

        if @task.update(task_params) && @task.completed
            @task.save
            redirect_to category_tasks_path(@category), notice: "Task completed!"
        elsif @task.update(task_params)
            @task.save
            redirect_to category_tasks_path(@category), notice: "Successfully edited Task!"
        else
            redirect_to edit_category_task_path(@category, @task), alert: @task.errors.full_messages
        end
    end
    def destroy
        @task = @category.tasks.find(params[:id])
        @task.destroy
        redirect_to categories_path, notice: "Successfully deleted Task!"
    end
    private 

    def get_overdue_tasks
        @overdue_tasks = []
        @category.tasks.each do |task|
            unless task.deadline.nil?
                if task.deadline.past? && !task.completed
                    @overdue_tasks.push(task)
                end
            end
        end
    end
    def get_category
        @category =current_user.categories.find(params[:category_id])
    end
    def task_params
        params.require(:task).permit(:title, :description, :deadline, :category_id, :completed)
    end
end
