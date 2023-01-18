class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    count = 0
    @grid.each do |row|
      row.each do |ele|
        if ele == :S
          count += 1
        end
      end
    end
    count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p "you sunk my battleship!"
      return true
    else
      self[pos] = :X
    end
    false
  end

  def place_random_ships
    total_ships = @size * 0.25
    while num_ships < total_ships
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      pos = [row, col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end

  def cheat
    self.class.print_grid(@grid)
  end

  def print
    self.class.print_grid(hidden_ships_grid)
  end
end
