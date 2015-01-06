class Player

  attr_accessor :choice, :id, :board

  def initialize(board, id)
    @board = board
    @choice = nil
    @id = id
  end

  # find and perform the next move for a player, return true if game is over
  def next_move

    @board.board[@choice] = id
    @board.free.delete(@choice)
    p self
    puts "player #{id + 1} chooses #{@choice}"
    puts @board

    @board.winner || @board.free.empty?
  end

end
