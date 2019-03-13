class ReviewController < Sinatra::Base
  set :views, "app/views/reviews"
  set :method_override, true

  get "/reviews" do
    @reviews = Review.all
    erb :index
  end

  get "/reviews/new" do
    erb :new
  end


end
