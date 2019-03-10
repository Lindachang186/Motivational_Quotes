require './config/environment'

class PostsController < ApplicationController

 get '/posts/index' do
   @posts = Post.all
   erb :'posts/index'
 end

 get '/posts/new' do
   erb :'posts/new'
 end

 post '/posts/index' do
   @posts = Post.create(:title => params[:title], :content => params[:content])
   redirect to "/posts/#{@posts.id}"
end

  get '/posts/:id' do
    @posts = Post.find_by_id(params[:id])
    erb :'posts/show'
  end


end
