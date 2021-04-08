class AdminController < ApplicationController
    before_action  :redirect_ifnotadmin
    

#    layout "admin"

    def index
        @races =  Race.all
        @registrations = Registration.all

    end 

end