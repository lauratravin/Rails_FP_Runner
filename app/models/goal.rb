class Goal < ActiveRecord::Base
    belongs_to :user
    validates :year, :uniqueness => true
  
end    