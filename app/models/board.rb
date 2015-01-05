class Board
  attr_accessor :board, :free, :over

  def initialize
    # initially, all positions are free
    @free = (0..8).to_a.shuffle!
    # initially, all fields are empty, i.e. they have arbitrary but distinct values
    @board = (10..18).to_a
  end

  def to_s
    @board.map.with_index do |val, idx|
      "#{val < 10 ? val : '_'}  #{idx == 2 || idx == 5 || idx == 8 ? "\n" : "| "}"
    end.join
  end

  #for CLI input
  def validate(choice)
    @free.include?(choice)
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

end
