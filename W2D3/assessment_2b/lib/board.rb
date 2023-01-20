class Board
  def self.build_stacks(n)
    Array.new(n) { Array.new() }
  end

  attr_reader :max_height

  def initialize(stacks, max_height)
    raise ArgumentError.new "rows and cols must be >= 4" unless max_height > 4 && stacks > 4
    @max_height = max_height
    @stacks = self.class.build_stacks(stacks)
  end

  def add(token, idx)
    if @stacks[idx].length < @max_height
      @stacks[idx] << token
      return true
    end
    false
  end

  def vertical_winner?(token)
    @stacks.any? do |arr|
      arr.length == max_height && arr.all? { |ele| ele == token }
    end
  end

  def horizontal_winner?(token)
    (0...@max_height).any? do |level_idx|
      @stacks.each_index.all? do |stack_idx|
        @stacks[stack_idx][level_idx] == token
      end
    end
  end

  def winner?(token)
    horizontal_winner?(token) || vertical_winner?(token)
  end

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
    @stacks.each { |stack| p stack }
  end
end
