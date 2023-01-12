# Define your methods here.

def first_letter_vowel_count(setence)
  vowels = "aeiouAEIOU"
  setence.split(" ").count { |word| vowels.include? word[0] }
end

def count_true(arr, proc)
  arr.count { |ele| proc.call(ele) }
end

def procformation(arr, prc_1, prc_2, prc_3)
  results = []
  arr.each do |ele|
    if prc_1.call(ele)
      results << prc_2.call(ele)
    else
      results << prc_3.call(ele)
    end
  end
  results
end

def array_of_array_sum(arr)
  arr.flatten.sum
end

def selective_reverse(sentence)
  sentence.split(" ").map { |word| reverse(word) }.join(" ")
end

def reverse(word)
  vowels = "aeiouAEIOU"
  return word if vowels.include?(word[0]) || vowels.include?(word[-1])
  word.reverse
end

def hash_missing_keys(hash, *arr)
  result = []
  arr.each do |ele|
    if !hash[ele]
      result << ele
    end
  end

  result
end
