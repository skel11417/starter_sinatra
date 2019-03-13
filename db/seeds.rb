Movie.destroy_all
Review.destroy_all

7.times do
  title = Faker::Movies::HarryPotter.book
  Movie.find_or_create_by(title: title)
end

Movie.all.each do |movie|
  rand(4).times do
    review = Review.create(content: Faker::Restaurant.review,
                          score: rand(1..5))
    movie.reviews << review
  end
end
