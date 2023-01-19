class Human_Player
  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position()
    p "please enter a valid row,coloumn position such as '1 2' "
    result = []
    input = gets.chomp
    input.each_char { |ele| result << ele.to_i if ele != " " }

    unless result.length == 2
      raise ArgumentError.new "Not Correct Input"
    end

    result
  end
end
