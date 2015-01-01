ID_USER = 0
ID_COMP = 1

# win scores for user and computer
WIN_SCORES = [10, -10]
WIN_NONE = 0

# inital score values for loop (below and above of possible range for user and computer, respectively)
INIT_SCORES = [-1000, 1000]

# helpful to switch between user and computer
ID_SUM = ID_USER + ID_COMP

# initially, all positions are free
@free = (0..8).to_a.shuffle!

# initially, all fields are empty, i.e. they have arbitrary but distinct values that are also different from ID_USER and ID_COMP.
@board = (10..18).to_a

@choice = nil

def minimax(player)

  # if there is a winner or the board is full, we're done.
  won = winner #temp var not to call method twice

  return WIN_SCORES[won] if won
  return WIN_NONE if @free.empty?

  # initialize with impossible value
  best = INIT_SCORES[player]
  move = nil

  for i in 0 ... @free.size

    # modify free positions and board, remember old values
    pos = @free.delete_at(i)
    old = @board[pos]
    @board[pos] = player

    # switch player (1 - 0 => 1, 1 - 1 => 0), recurse
    score = minimax(ID_SUM - player)

    # undo changes to free positions and board
    @free.insert(i, pos)
    @board[pos] = old

    # have we found a better score?
    if (player == ID_USER && score > best) || (player == ID_COMP && score < best)
      best = score
      move = pos
    end

    # if we found the best possible score, we can stop looking
    break if best == WIN_SCORES[player] #alpha-beta pruning

  end

  @choice = move
  return best

end

# if there is a winner, return the id; otherwise, return nil
def winner

  # shortcut for less typing
  b = @board

  # rows
  return b[0] if b[0] == b[1] && b[1] == b[2]
  return b[3] if b[3] == b[4] && b[4] == b[5]
  return b[6] if b[6] == b[7] && b[7] == b[8]

  # cols
  return b[0] if b[0] == b[3] && b[3] == b[6]
  return b[1] if b[1] == b[4] && b[4] == b[7]
  return b[2] if b[2] == b[5] && b[5] == b[8]

  # diagonals
  return b[4] if b[0] == b[4] && b[4] == b[8]
  return b[4] if b[2] == b[4] && b[4] == b[6]

end

# nicer presentation of the board: use underscores for empty fields, vertical bars to separate rows
def board_to_s
  @board.map.with_index{|v, i| "#{v < 10 ? v : '_'}#{i == 2 || i == 5 ? '|' : ''}" }.join
end

# find and perform the next move for a player, return true iff game is over
def next_move(player)
  minimax(player)
  @board[@choice] = player
  @free.delete(@choice)
  puts "player #{player} chooses field #{@choice} -> #{board_to_s}"
  return @free.empty? || winner
end

puts "                     start: #{board_to_s}"
player = ID_USER
while true
  break if next_move(ID_USER)
  break if next_move(ID_COMP)
end

puts "winner: #{winner}"