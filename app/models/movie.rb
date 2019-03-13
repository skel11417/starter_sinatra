# movie.rb
class Movie < ActiveRecord::Base
  has_many :reviews

  def average_rating
    if self.has_reviews?
      return self.reviews.average(:score).round
    else
      return 0
    end
  end

  def has_reviews?
    self.reviews.length > 0 ? true : false
  end

  def show_average_stars
    stars = ""
    avg_reviews = self.average_rating
    if avg_reviews > 0
      avg_reviews.times do
        stars += "&#9733"
      end
      (5 - avg_reviews).times do
        stars += "&#9734"
      end
    end
    return stars
  end

end
