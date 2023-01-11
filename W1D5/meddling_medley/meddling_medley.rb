def duos(string)
  count = 0
  (0...string.length - 1).each do |i|
    count += 1 if string[i] == string[i + 1]
  end
  count
end

#p duos("bootcamp")      # 1
#p duos("wxxyzz")        # 2
#p duos("hoooraay")      # 3
#p duos("dinosaurs")     # 0
#p duos("e")             # 0

def sentence_swap(sentence, hash)
  arr = sentence.split(" ").map do |word|
    if hash[word]
      hash[word]
    else
      word
    end
  end

  arr.join(" ")
end

#p sentence_swap("anything you can do I can do",
#                "anything" => "nothing", "do" => "drink", "can" => "shall") # 'nothing you shall drink I shall drink'
#
#p sentence_swap("what a sad ad",
#                "cat" => "dog", "sad" => "happy", "what" => "make") # 'make a happy ad'
#
#p sentence_swap("keep coding okay",
#               "coding" => "running", "kay" => "pen") # 'keep running okay'

def hash_mapped(hash, proc, &block)
  new_hash = {}
  hash.each do |k, v|
    new_hash[block.call(k)] = proc.call(v)
  end
  new_hash
end

#double = Proc.new { |n| n * 2 }
#p hash_mapped({ "a" => 4, "x" => 7, "c" => -3 }, double) { |k| k.upcase + "!!" }
## {"A!!"=>8, "X!!"=>14, "C!!"=>-6}
#
#first = Proc.new { |a| a[0] }
#p hash_mapped({ -5 => ["q", "r", "s"], 6 => ["w", "x"] }, first) { |n| n * n }
## {25=>"q", 36=>"w"}

def counted_characters(string)
  count = Hash.new(0)
  arr = []
  string.each_char { |char| count[char] += 1 }
  count.each { |k, v| arr << k if v > 2 }
  arr
end

#p counted_characters("that's alright folks") # ["t"]
#p counted_characters("mississippi") # ["i", "s"]
#p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
#p counted_characters("runtime") # []

def triplet_true(string)
  (0...string.length - 2).each do |i|
    return true if string[i..i + 2] == string[i] * 3
  end

  false
end

#p triplet_true("caaabb")        # true
#p triplet_true("terrrrrible")   # true
#p triplet_true("runninggg")     # true
#p triplet_true("bootcamp")      # false
#p triplet_true("e")             # false

def energetic_encoding(string, hash)
  str = ""
  string.each_char do |i|
    if hash[i]
      str += hash[i]
    elsif i == " "
      str += i
    else
      str += "?"
    end
  end
  str
end

#p energetic_encoding("sent sea",
#                     "e" => "i", "s" => "z", "n" => "m", "t" => "p", "a" => "u") # 'zimp ziu'
#
#p energetic_encoding("cat",
#                     "a" => "o", "c" => "k") # 'ko?'
#
#p energetic_encoding("hello world",
#                     "o" => "i", "l" => "r", "e" => "a") # '?arri ?i?r?'
#
#p energetic_encoding("bike", {}) # '????'

def uncompress(string)
  letters = []
  numbers = []
  str = ""
  (0...string.length).each do |i|
    if i % 2 == 0
      letters << string[i]
    else
      numbers << string[i]
    end
  end

  (0...letters.length).each do |i|
    str += letters[i] * numbers[i].to_i
  end

  str
end

uncompress("a2b4c1") # 'aabbbbc'
uncompress("b1o2t1") # 'boot'
uncompress("x3y1x2z4") # 'xxxyxxzzzz'
