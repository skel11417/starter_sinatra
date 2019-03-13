class ReviewController < Sinatra::Base
  set :views, "app/views/reviews"
  set :method_override, true

  get "/reviews" do
    @reviews = Review.all
    erb :index
  end

  get "/reviews/new" do
    @movie = Movie.find(params[:movie_id])
    erb :new
  end

  get "/reviews/:id" do
    @review = Review.find(params[:id])
    erb :show
  end

  post "/reviews" do
    # binding.pry
    review = Review.create(content: params[:content], score: params[:score],
                          movie_id: params[:movie])
    redirect "/reviews/#{review.id}"
  end

end
