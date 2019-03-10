require './config/environment'

class PostsController < ApplicationController

 get '/posts/index' do
   @post = Post.all
   erb :'posts/index'
 end


end
