def palindrome?(string)
  str = ""
  string.each_char { |char| str = char + str }
  str == string
end

def substrings(string)
  arr = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      arr << string[i..j]
    end
  end
  arr
end

def palindrome_substrings(string)
  arr = substrings(string)
  arr.select { |ele| palindrome?(ele) && ele.length > 1 }
end
