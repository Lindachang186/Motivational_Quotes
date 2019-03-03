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

  get '/users/login' do
    erb :'users/login'
  end

  get '/users/signin' do
    erb :'users/signin'

  end



end
