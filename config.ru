require './app/config/environment.rb'

use Rack::Static, :urls => ['/stylesheets', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::MethodOverride
use RootController
run TictactoeController
