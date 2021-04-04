class AdminController < ApplicationController
#    layout "admin"

    def index
        @races =  Race.all
    end 

end