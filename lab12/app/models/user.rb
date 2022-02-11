class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true

    #def update_last_login_at
        #self.last_login_at = DateTime.now
        #save
    #end 
end
