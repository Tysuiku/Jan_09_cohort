def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(numbers)
  numbers.sum / (numbers.length * 1.0)
end

def repeat(str, num)
  new_str = ""
  num.times { new_str += str }
  new_str
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  arr = []
  sentence.split(" ").each_with_index do |word, i|
    if i % 2 == 0
      arr << word.upcase
    else
      arr << word.downcase
    end
  end

  arr.join(" ")
end
