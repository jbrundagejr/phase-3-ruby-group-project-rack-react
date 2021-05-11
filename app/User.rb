class User < ActiveRecord::Base
    has_many :groups
    has_many :reviews
    has_many :comics, through: :groups
    has_many :comics, through: :reviews

    def self.find_by_email(email)
        self.find_by(email: email)
    end
    
end