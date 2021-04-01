class User < ActiveRecord::Base
    has_many :registrations
    has_many :races, through: :registrations
    has_secure_password
    # validates :name, presence: true
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :unique=> true



end
