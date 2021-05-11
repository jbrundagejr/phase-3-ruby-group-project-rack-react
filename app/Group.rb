class Group < ActiveRecord::Base
    belongs_to :user
    belongs_to :comic
    has_many :posts
end