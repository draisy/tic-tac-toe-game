class Computer

  ID_USER = 0
  ID_COMP = 1

  # win scores for user and computer
  WIN_SCORES = [10, -10]
  WIN_NONE = 0

  # inital score values for loop (below and above of possible range for user and computer, respectively)
  INIT_SCORES = [-1000, 1000]

  # helpful to switch between user and computer
  ID_SUM = ID_USER + ID_COMP

  attr_accessor :choice, :id, :board

  def initialize(board, id)
    @board = board
    @id = id
  end

  # find and perform the next move for a player, return true if game is over
  def next_move
    minimax(self.id)

    @board.board[@choice] = id
    
    @board.free.delete(@choice)
    p self
    puts "player #{id + 1} chooses #{@choice}"
    puts board

    board.free.empty? || board.winner
  end

  def minimax(id)

    # if there is a winner or the board is full, we're done.
    won = @board.winner #temp var not to call method twice

    return WIN_SCORES[won] if won
    return WIN_NONE if @board.free.empty?

    # initialize with impossible value
    best = INIT_SCORES[id]
    move = nil

    for i in 0 ... @board.free.size

      # modify free positions and board, remember old values
      pos = @board.free.delete_at(i)
      old = @board.board[pos]
      @board.board[pos] = id

      # switch player (1 - 0 => 1, 1 - 1 => 0), recurse
      score = minimax(ID_SUM - id)

      # undo changes to free positions and board
      @board.free.insert(i, pos)
      @board.board[pos] = old

      # have we found a better score?
      if (id == ID_USER && score > best) || (id == ID_COMP && score < best)
        best = score
        move = pos
      end

      # if we found the best possible score, we can stop looking
      break if best == WIN_SCORES[id] #alpha-beta pruning

    end

    @choice = move
    return best

  end

end
