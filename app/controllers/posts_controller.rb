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
   @post=Post.create(:title => params[:title], :content => params[:content])
   redirect to "/posts/#{@post.id}"
end

  get '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find_by_id(params[:id])
    erb :'posts/edit'
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end


end
