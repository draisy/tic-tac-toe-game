class TictactoeController < Sinatra::Base
 # register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
end