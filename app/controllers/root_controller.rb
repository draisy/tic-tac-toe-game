require_relative './tictactoe_controller.rb'

class RootController < TictactoeController

  get '/' do
    erb :'index'
  end

  get '/start_two_players' do
    @@game = Game.new
    @@game.set_two_players
  end

  get '/start_computer' do 
    content_type :js

    @@game = Game.new
    @@game.set_computer_first

    @player1 = @@game.player1
    @player2 = @@game.player2

    @won = @player1.next_move
    @choice = @player1.choice

    erb :'start_computer.js'
  end

  get '/start_player' do 

    @@game = Game.new
    @@game.set_player_first

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
    elsif @player1.class == Computer
      @won = @player1.next_move
      @choice = @player1.choice
    end

    erb :'play.js'
  end

end
