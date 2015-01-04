class TictactoeController < Sinatra::Base
 # register Sinatra::ActiveRecordExtension
  register Gon::Sinatra
  set :views, Proc.new { File.join(root, "../views/") }
end