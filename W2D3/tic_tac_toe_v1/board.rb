class Board
  def initialize
    @board = Array.new(3) { Array.new(3) { "_" } }
  end

  def valid?(pos)
    row, col = pos
    if @board[row][col] != nil
      return true
    end
    false
  end

  def empty?(pos)
    row, col = pos
    if @board[row][col] == "_"
      return true
    end
    false
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
      if row.all? { |ele| ele == mark }
        return true
      end
    end
    false
  end

  def win_col?(mark)
    (0...@board.length).each do |i|
        (0...@board.length).each do |j|
            
end
