class User < ActiveRecord::Base
    has_many :registrations
    has_many :races, through: :registrations
    has_secure_password

end
