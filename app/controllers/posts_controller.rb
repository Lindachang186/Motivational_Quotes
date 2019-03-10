require './config/environment'

class PostsController < Sinatra::Base

 get '/posts' do
   @post = Post.all
   erb :'posts/index'
 end


end
