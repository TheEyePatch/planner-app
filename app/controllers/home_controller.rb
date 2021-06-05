class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category
    def index
        @urgent_tasks = []
        get_all_urgent_tasks
    end
    private

    def get_category
        @categories = current_user.categories.all
    end

    def get_all_urgent_tasks
        @categories.each do |category|
            category.tasks.each do |task|
                if task.deadline == Date.today && !task.completed
                    @urgent_tasks.push(task)
                end
            end
        end
    end
    
end
