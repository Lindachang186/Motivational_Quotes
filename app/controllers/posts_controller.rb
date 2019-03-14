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
    if params[:title].size > 0 && params[:content] > 0
    @post= Post.create(:title => params[:title], :content => params[:content], :user_id => current_user.id)
    erb :'posts/show'
  else
    redirect '/error/input'
  end
end

  get '/posts/:id' do
    redirect_if_not_logged_in
    @id = params[:id][1..-1]
    @post = Post.find_by_id(@id)
    erb :'posts/show'
  end

  get '/posts/:id/edit' do
      @id = params[:id]
      @post = Post.find_by_id(@id)
      if @post.user_id == current_user.id
        erb :"posts/edit"
      else
        redirect '/error'
      end
  end

  patch '/posts/:id/edit' do
    @id = params[:id]
    @post = Post.find_by_id(@id)
    if @post.user_id == current_user.id
      @post.title = params[:title]
      @post.content = params[:content]
      @post.save
      redirect to "/posts/index"
    else
      redirect '/error'
    end
  end

  delete '/post/:id/delete' do
    @id = params[:id]
    @post = Post.find_by_id(@id)
    if @post.user_id == current_user.id
      @post.delete
      redirect '/posts/index'
    else
      redirect '/error'
    end
  end

  get '/error' do
    erb :usererror
  end

  get '/error/input' do
    erb :inputerror
  end



end
