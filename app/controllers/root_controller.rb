require_relative './tictactoe_controller.rb'

class RootController < TictactoeController

  get '/' do
    erb :'index'
  end

  get '/start' do
    @@game = Game.new
  end

  get '/play' do
    content_type :js

    @player1 = @@game.player1
    @player2 = @@game.player2

    @player1.choice = params[:val].to_i

    @won == @player1.next_move
    if @won #win draw
      @won == @player2.id ? @message = "Player#{@player2.id} wins!" : @message = "It's a tie"
      #make next move
    else @won = @player2.next_move
      @choice  = @player2.choice
      if @won #win draw
        @won == @player2.id ? @message = "Player#{@player2.id} wins!" : @message = "It's a tie"
        # erb :'winner.js'
      end
    end

    erb :'move.js'
  end

end
