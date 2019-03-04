require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "golfclubsaregreat"
  end

  get '/' do
    erb :index
  end

  get '/users/signup' do
    erb :"users/signup"
  end

  post '/users/signup' do
    @user = User.new(username: params["username"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect "/users/show"
  end

  get '/users/login' do
    erb :"users/login"
  end

  get '/users/show' do
      @user= User.find(session[:user_id])
      erb :"/users/show"
  end



end
