class HomeController < ApplicationController

    def index
        @urgent_tasks = Task.where(:deadline => Date.today)
    end
end
