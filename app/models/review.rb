# review.rb
class Review < ActiveRecord::Base
  belongs_to :movie

  def show_stars
    stars = ""
    self.score.times do
      stars += "&#9733"
    end
    (5 - self.score).times do
      stars += "&#9734"
    end
    return stars
  end

end
