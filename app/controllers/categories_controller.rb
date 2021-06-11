class CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = current_user.categories.all
        @overdue_tasks = []
        get_overdue_tasks
    end
    def new
        @category = current_user.categories.build
    end
    def create
        @category = current_user.categories.build(category_params)

        if @category.valid?
            @category.save
            redirect_to categories_path, notice: "Successfully created new Category!"

        else
            redirect_to new_category_path, alert: @category.errors.full_messages
        end
    end
    def show
        @category = current_user.categories.find(params[:id])
    end
    def edit 
        @category = current_user.categories.find(params[:id])
    end
    def update 
        @category = current_user.categories.find(params[:id])

        if @category.update(category_params)
            @category.save
            redirect_to categories_path, notice: "Successfully updated Category!"

        else
            redirect_to edit_category_path, alert: @category.errors.full_messages
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
    end
    private
    def get_overdue_tasks
        @categories.each do |category|
            iterate_category_tasks(category)
        end
    end
    def iterate_category_tasks(category)
        category.tasks.each do |task|
            unless task.deadline.nil?
                if task.deadline.past? && !task.completed
                    @overdue_tasks.push(task)
                end
            end
        end
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
