class Goal < ActiveRecord::Base
    belongs_to :user
    validates :year, presence: true
    validates :miles, presence: true

   def self.exist_duplicate?(year,user)
  

    Goal.exists?(year: year, user: user)
    
  
   end
end    