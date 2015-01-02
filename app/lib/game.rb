class Game
  VALID_TYPES = [1, 2]
  
  attr_accessor :player1, :player2

  def initialize
    @board = Board.new
    set_player_types
    start
  end

  def set_player_types
    puts "enter 1 to play with another player, 2 to play against computer"
    player_type = gets.strip!.to_i

    while !VALID_TYPES.include?(player_type)
      puts "please enter valid option"
      player_type = gets.strip!
    end

    set_players(player_type)
  end

  def set_players(player_type)
    @player1 = Player.new(@board)
    if player_type == 1
      @player2 = Player.new(@board)
      @player2.id = 1
    else
      @player2 = Computer.new(@board)
    end
  end

  #play until win or draw
  def start
    while true
      break if @player1.next_move
      break if @player2.next_move
    end
  end

end
