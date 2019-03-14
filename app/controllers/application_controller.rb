require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
     set :public_folder, 'public'
     set :views, 'app/views'
     enable :sessions
     set :session_secret, ENV.fetch('SESSION_SECRET')
  end

  get '/' do
    erb :index
  end

  get '/users/signup' do
    erb :"users/signup"
  end

  post '/users/signup' do
    if !User.find_by(username: params[:username])
    @user = User.new(username: params["username"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
    redirect "/users/show"
      else
    redirect "user/exists"
    end
  end

  get  '/user/exists' do
    erb :"users/exists"
  end

  get '/users/login' do
    erb :"users/login"
  end

  post '/users/users/login' do
    @user= User.find_by(username: params[:username])
    if @user.username == params[:username]
      session[:user_id] = @user.id
      redirect "/users/show"
    else
      puts "That username does not exist"
      redirect "/"
    end
  end

  get '/users/logout' do
   session.clear
   redirect '/'
 end

  get '/users/show' do
      @user= User.find(session[:user_id])
      @posts = []
      Post.all.each do |post|
        if post.user_id == @user.id
          @posts << post
        end
      end
      erb :"/users/show"
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/?error=You have to be logged in to do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end


end
