require './app/config/environment.rb'

use Rack::Static, :urls => ['/stylesheets', '/js'], :root => 'public'
use Rack::MethodOverride
use RootController
run TictactoeController
