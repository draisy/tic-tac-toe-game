require './app/config/environment.rb'

use Rack::MethodOverride
run Sinatra::Application
