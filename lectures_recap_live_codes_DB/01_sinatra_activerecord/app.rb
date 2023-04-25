require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :index # => render views/index.erb
end

get "/restaurants/:id" do
  id = params[:id] # => ex: 3
  @restaurant = Restaurant.find(id)
  erb :show # => render views/show.erb
end

