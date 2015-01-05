require_relative './tictactoe_controller.rb'

class RootController < TictactoeController

  get '/' do
    erb :'index'
  end

  get '/start_one_player' do
    @@game = Game.new
    @@game.set_one_player
  end

  get '/start_two_players' do
    @@game = Game.new
    @@game.set_two_players
  end

  get '/play' do
    content_type :js

    @player1 = @@game.player1
    @player2 = @@game.player2

    @player = instance_variable_get ("@player" + params[:player])
    @choice = params[:val].to_i

    @player.choice = @choice
    @won = @player.next_move

    if @player2.class == Computer
      @won = @player2.next_move
      @choice = @player2.choice
    end

    erb :'play.js'
  end

end
