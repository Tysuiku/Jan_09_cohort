class Board
  def self.build_stacks(n)
    Array.new(n) { Array.new() }
  end

  attr_reader :max_height

  def initialize(stacks, max_height)
    @max_height = max_height
    @stacks = Array.new(stacks) { Array.new }
  end

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
    @stacks.each { |stack| p stack }
  end
end
