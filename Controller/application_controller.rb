class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
      set :session_secret, "motivational_quotes"
  end

  get '/' do
    "Hello world"
  end

end
