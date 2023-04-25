require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require 'pry-byebug'

get "/" do
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  # binding.pry
  id = params[:id]
  @restaurant = Restaurant.find(id)
  erb :show
end
