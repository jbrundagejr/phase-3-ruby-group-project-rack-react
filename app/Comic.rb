class Comic < ActiveRecord::Base
    has_many :groups
    has_many :reviews
    has_many :users, through: :groups
    has_many :users, through: :reviews
    
end