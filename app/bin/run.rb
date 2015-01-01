require_relative '../config/environment.rb'

player = Player.new
board = Board.new

while(true) do
  player.minimax(board, Board::USER_KEY, Board::COMPUTER_KEY)
  move = player.choice
  board = board.get_new_state(move, Board::USER_KEY)
  puts Board::USER_KEY + " " + move.to_s + " " + board.board.to_s
  break if board.over

  player.minimax(board, Board::COMPUTER_KEY, Board::USER_KEY)
  move = player.choice
  board = board.get_new_state(move, Board::COMPUTER_KEY)
  puts Board::COMPUTER_KEY + " " + move.to_s + " " + board.board.to_s
  break if board.over
end


time = Benchmark.realtime do
  player.minimax(board, Board::USER_KEY, Board::COMPUTER_KEY)
  player.minimax(board, Board::COMPUTER_KEY, Board::USER_KEY)
end
puts "Time elapsed #{time*1000} milliseconds"
