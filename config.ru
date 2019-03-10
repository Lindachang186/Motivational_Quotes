use Rack::MethodOverride


require './config/environment'


run ApplicationController
run PostsController
