class CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = current_user.categories.all
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

    def category_params
        params.require(:category).permit(:category_name)
    end
end
