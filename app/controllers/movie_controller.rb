class MovieController < Sinatra::Base

  set :views, "app/views/movies"
  set :method_override, true

  get "/movies/new" do
    erb :new
  end

  get "/movies" do
    @movies = Movie.all
    erb :index
  end

  get "/movies/:id" do
    @movie = Movie.find(params[:id])
    erb :show
  end

  post "/movies" do
    m = Movie.create(title: params[:title])
    redirect "movies/#{m.id}"
  end
end
