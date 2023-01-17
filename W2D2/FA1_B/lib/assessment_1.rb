# Define your methods here.

def string_map!(str, &prc)
  (0...str.length).each { |i| str[i] = prc.call(str[i]) }
end

def three?(arr, &prc)
  arr.count { |ele| prc.call(ele) } == 3
end

def nand_select(arr, prc_1, prc_2)
  arr.reject { |ele| prc_1.call(ele) && prc_2.call(ele) }
end

def hash_of_array_sum(hash)
  arr = []
  hash.each { |k, v| arr << v }
  arr.flatten.sum
end

def abbreviate(sentence)
  words = sentence.split(" ")
  result = []
  words.each do |word|
    if word.length > 4
      result << vowel_remover(word)
    else
      result << word
    end
  end

  result.join(" ")
end

def vowel_remover(word)
  vowels = "AEIOUaeiou"
  str = ""
  word.each_char do |char|
    if !vowels.include? char
      str += char
    end
  end

  str
end

def hash_selector(hash, *char)
  result = {}
  return hash if char.length <= 0
  char.each do |i|
    if hash[i]
      result[i] = hash[i]
    else
      result[i] = 0
    end
  end

  result
end
