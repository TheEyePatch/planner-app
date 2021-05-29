class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    def new
        @category = Category.new
    end
    def create
        @category = Category.new(category_params)

        if @category.valid?
            @category.save
            redirect_to categories_path

        else
            redirect_to new_category_path, notice: @category.errors.full_messages
        end
    end
    def show
        @category = Category.find(params[:id])
    end
    def edit 
        @category = Category.find(params[:id])
    end
    def update 
        @category = Category.find(params[:id])

        if @category.update(category_params)
            @category.save
            redirect_to categories_path

        else
            redirect_to edit_category_path, notice: @category.errors.full_messages
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
    end
    private

    def category_params
        params.require(:category).permit(:category_name)
    end
end
