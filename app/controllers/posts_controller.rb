require './config/environment'

class PostsController < ApplicationController

 get '/posts/index' do
   redirect_if_not_logged_in
   @posts = Post.all
   erb :'posts/index'
 end

 get '/posts/new' do
   redirect_if_not_logged_in
   erb :'posts/new'
 end

 post '/posts/index' do
   redirect_if_not_logged_in
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
    @id = params[:id][1..-1]
    @post = Post.find_by_id(@id)
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect to "/posts/#{@post.id}"
  end

  delete '/posts/:id/delete' do
    @id = params[:id][1..-1]
    Post.find_by_id(@id).delete
    redirect '/posts/index'
  end

  get '/error' do
    "Error"
  end

end
