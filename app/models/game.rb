class Game

  attr_accessor :player1, :player2

  def initialize
    @board = Board.new
  end

  def set_two_players
    @player1 = Player.new(@board, 0)
    @player2 = Player.new(@board, 1)
  end

  def set_computer_first
    @player1 = Computer.new(@board, 0)
    @player2 = Player.new(@board, 1)
  end

  def set_player_first
    @player1 = Player.new(@board, 0)
    @player2 = Computer.new(@board, 1)
  end

end
