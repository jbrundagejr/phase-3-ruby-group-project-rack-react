class Post < ActiveRecord::Base
    belongs_to :group
    belongs_to :user
end