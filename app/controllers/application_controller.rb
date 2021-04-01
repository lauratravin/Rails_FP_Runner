class ApplicationController < ActionController::Base

#note: everyone can see race list
    def nyrr
        @races = Race.all
    end    
end
