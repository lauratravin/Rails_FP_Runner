class AdminController < ApplicationController
#    layout "admin"

    def index
        @races =  Race.all
        @registrations = Registration.all
    end 

end