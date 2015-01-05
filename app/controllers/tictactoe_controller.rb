class TictactoeController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
end