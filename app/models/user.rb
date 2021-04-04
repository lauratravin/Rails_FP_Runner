class User < ActiveRecord::Base
    devise :omniauthable, :omniauth_providers => [:facebook]

    has_many :registrations
    has_many :races, through: :registrations

    has_secure_password

    # validates :name, presence: true
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true
    validates :pace, :presence => true
    validates :dob, :presence => true



    def self.new_with_session(params, session)
        super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
                user.email = data["email"] if user.email.blank?
            end
        end
    end
    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
            user.name = auth.info.name # assuming the user model has a name
            user.image = auth.info.image # assuming the user model has an image
        end
    end

   #other methods
   def find_available_races
          @races = Race.all

   end

   def  generatememberid       
 
        update_attribute(:member_num, "NYRR"+self.dob.strftime("%m%d%Y")+self.id.to_s)   
       
   end 

   def cal_estimated_time(distance) 
     (distance.to_f/self.pace).round(2)
   end 

   #this method returs true if the user has not registered to this race
   def valid_race(rid)
        !Registration.where(user_id: self.id, race_id: rid).exists?
   end 


   def get_results
    return "a"
   end 
   

end
