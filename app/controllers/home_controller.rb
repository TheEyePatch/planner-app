class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category
    def index
        @urgent_tasks = []
        @overdue_tasks = []
        get_overdue_and_urgent_tasks
    end
    private

    def get_category
        @categories = current_user.categories.all
    end

    def get_overdue_and_urgent_tasks
        @categories.each do |category|
            iterate_category_tasks(category)
        end
    end
    def iterate_category_tasks(category)
        category.tasks.each do |task|
            unless task.deadline.nil?
                if task.deadline.past? && !task.completed
                    @overdue_tasks.push(task)
                elsif task.deadline == Date.today && !task.completed
                    @urgent_tasks.push(task)
                end
            end
        end
    end    
end
