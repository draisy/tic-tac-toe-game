class Player
  attr_accessor :choice

  def minimax(board, player, opponent)
    return board.score if board.over
    
    scores = [] # an array of scores
    moves = []  # an array of moves

    # Populate the scores array, recursing as needed
    board.free_spaces.each do |move|
      possible_game = board.get_new_state(move, player)
      scores.push minimax(possible_game, opponent, player)
      moves.push move
    end

    # Do the min or the max calculation
    if player == Board::USER_KEY
      score = scores.max
    else
      score = scores.min
    end

    index = scores.index(score)
    @choice = moves[index]
    return scores[index]

  end

end