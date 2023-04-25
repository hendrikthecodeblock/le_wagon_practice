require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "../config/application"

set :root, File.expand_path("..", __dir__)
set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

after do
  ActiveRecord::Base.connection.close
end

get "/" do
  # TODO
  # 1. fetch posts from database.
  @posts = Post.by_most_popular
  # 2. Store these posts in an instance variable
  @post = Post.new
  # 3. Use it in the `app/views/posts.erb` view
  erb :posts # Do not remove this line
end

# Post creation
post '/posts' do
  @post = Post.new
  @post.title = params[:title]
  @post.url = params[:url]
  @post.user = User.first
  @post.save

  if @post.save
    redirect to('/')
  else
    erb :new_post
  end
end

# Post upvote
put '/posts/:id/upvote' do
  post = Post.find(params[:id])
  post.votes += 1
  post.save

  redirect to('/')
end
