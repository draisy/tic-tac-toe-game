require_relative './tictactoe_controller.rb'

class RootController < TictactoeController


  get '/' do
    erb :'index'
  end

  get '/start' do
  	@@game = Game.new
  end

  get '/play' do
    @@game.player1.choice = params[:val].to_i
	@@game.player1.next_move
    @@game.player2.next_move

    @choice = @@game.player2.choice
    content_type :js
     erb :'move.js'
  end

end
