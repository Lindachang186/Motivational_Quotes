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
    erb :'posts/show'
end

  get '/posts/:id' do
    @id = params[:id][1..-1]
    @post = Post.find_by_id(@id)
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
    @id = params[:id][1..-1]
    @post = Post.find_by_id(@id)
    erb :'posts/edit'
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id][1])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    Post.find(params[:id]).delete
    redirect '/posts/index'
  end

  get '/error' do
    "Error"
  end

end
