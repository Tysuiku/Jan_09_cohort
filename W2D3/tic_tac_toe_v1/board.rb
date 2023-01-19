class Board
  def initialize
    @board = Array.new(3) { Array.new(3) { "_" } }
  end

  def valid?(pos)
    row, col = pos
    @board[row][col] != nil
  end

  def empty?(pos)
    row, col = pos
    @board[row][col] == "_"
  end

  def place_mark(pos, mark)
    unless valid?(pos)
      raise ArgumentError.new "Out of bounds"
    end

    unless empty?(pos)
      raise ArgumentError.new "Spot is taken"
    end

    row, col = pos
    @board[row][col] = mark
  end

  def print
    @board.each { |row| puts row.join(" ") }
    puts "\n"
  end

  def win_row?(mark)
    @board.each do |row|
      return row.all? { |ele| ele == mark }
    end
  end

  def win_col?(mark)
    arr = Array.new(3) { [] }
    (0...@board.length).each do |i|
      (0...@board.length).each do |j|
        arr[i] << @board[j][i]
      end
    end
    arr.each do |row|
      return row.all? { |ele| ele == mark }
    end
  end

  def win_diagonal?(mark)
    left = []
    right = []
    (0...@board.length).each do |i|
      left << @board[i][i]
      right << @board[i][(@board.length - 1) - i]
    end

    return left.all? { |ele| ele == mark } || right.all? { |ele| ele == mark }
  end

  def win?(mark)
    return win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @board.each do |row|
      return row.any? { |ele| ele == "_" }
    end
  end
end
