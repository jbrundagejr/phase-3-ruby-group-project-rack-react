class Comic < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    
    def rating_average
      review_total = self.reviews.sum { |review_instance| review_instance.rating }
      (review_total / self.reviews.length.to_f).round(2)
    end
end