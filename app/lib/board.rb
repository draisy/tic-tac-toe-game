require 'benchmark'
class Board

  USER_KEY = "O"
  COMPUTER_KEY = "X"

  attr_accessor :board, :free_spaces, :over

  def initialize
    @board = [ %w(1 2 3), %w(4 5 6), %w(7 8 9)]
    @free_spaces = 3.times.map {|row| 3.times.map {|col| [row, col]} }.flatten(1)
  end

  def score
    if @winner == USER_KEY
      return 10
    elsif @winner == COMPUTER_KEY
      return -10
    else
      return 0
    end
  end

  def get_new_state(move, player)
    x,y = move
    new_state = dup
    new_state.board = @board.map(&:dup)
    new_state.board[x][y] = player
    new_state.free_spaces = @free_spaces.dup
    new_state.free_spaces.delete(move)
    new_state.analyze
    new_state
  end

  def analyze
    @winner = row_win || column_win || first_diagonal_win || second_diagonal_win
    @over = @winner != nil || @free_spaces.empty?
  end

  private

  def row_win
    winning_row = @board.select do |row|
      (row[0] == row[1]) && (row[1] == row[2])
    end
    !winning_row.empty? ? winning_row[0] : nil
  end

  def column_win
    winning_column = @board[0].select.with_index do |row, index|
      (@board[0][index] == @board[1][index]) && (board[1][index] == @board[2][index])
    end
    !winning_column.empty? ? winning_column[0] : nil
  end

  def first_diagonal_win
    @board[0][0] if (@board[0][0] == @board[1][1]) && (board[1][1] == @board[2][2])
  end

  def second_diagonal_win
    @board[0][2] if (@board[0][2] == @board[1][1]) && (board[1][1] == @board[2][0])
  end

end 