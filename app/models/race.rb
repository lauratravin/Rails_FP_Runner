class Race < ActiveRecord::Base
    has_many :registrations
    has_many :users, through: :registrations
   
def self.update_status
    Race.all.each do |r|
           if Date.today >= r.date
            r.status = false 
            r.save
           end 
    end    
end

def self.activeraces
    Race.where(status: true)
end    

def self.inactiveraces
    Race.where(status: false)
end    



end
