class Review < ActiveRecord::Base
    belongs_to :comic
    belongs_to :user

  def reviewer_name
    self.user.name
  end

end