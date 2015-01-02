class Player

  attr_accessor :choice, :id, :board

  def initialize(board)
    @board = board
    @choice = nil
    @id = 0
  end

  # find and perform the next move for a player, return true if game is over
  def next_move

    # while !@board.validate(@choice)
    #   puts "Please enter a (valid free) space to play on:"
    #   @choice = gets.strip!.to_i - 1
    # end

    @board.board[@choice] = id
    @board.free.delete(@choice)

    puts "player #{id + 1} chooses #{@choice}"
    puts @board

    @board.free.empty? || @board.winner
  end

end
