def partition(arr, num)
  result = []
  result << arr.select { |ele| ele < num }
  result << arr.select { |ele| ele >= num }
  result
end

def merge(hash_1, hash_2)
  hash = {}
  hash_1.each { |k, v| hash[k] = v }
  hash_2.each { |k, v| hash[k] = v }
  hash
end

def censor(sentence, curses)
  new_arr = []
  words = sentence.split(" ")
  words.each do |word|
    if curses.include? word.downcase
      new_arr << suisei(word)
    else
      new_arr << word
    end
  end

  new_arr.join(" ")
end

def suisei(word)
  str = ""
  word.each_char do |i|
    if "aeiou".include? i.downcase
      str += "*"
    else
      str += i
    end
  end

  str
end

def power_of_two?(n)
  i = 1
  while i < n
    i * 2
  end

  i == n
end
