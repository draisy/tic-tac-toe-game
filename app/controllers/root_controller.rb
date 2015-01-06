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

    #make first move immediately
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

    if @player1.class == Player && @player2.class == Player
      @won = @player.next_move

    elsif @player2.class == Computer
      @won = @@game.get_player_moves_first
      @moves = [@player1.choice, @player2.choice]

    elsif @player1.class == Computer
      @won = @@game.get_computer_moves_first
      @moves = [@player1.choice, @player2.choice]
    end

    puts "Game Over!" if @won

    erb :'play.js'
  end

end
