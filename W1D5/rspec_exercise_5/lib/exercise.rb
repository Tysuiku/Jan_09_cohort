def zip(*arr)
  length = arr.first.length
  new_arr = Array.new(length) { [] }
  (0...length).each do |i|
    arr.each do |sub_arr|
      new_arr[i] << sub_arr[i]
    end
  end

  new_arr
end

def prizz_proc(array, proc_1, proc_2)
  array.select { |ele| (proc_1.call(ele) || proc_2.call(ele)) && !((proc_1.call(ele) && proc_2.call(ele))) }
end

def zany_zip(*arr)
  length = arr.map(&:length).max
  new_arr = Array.new(length) { [] }
  (0...length).each do |i|
    arr.each do |sub_arr|
      new_arr[i] << sub_arr[i]
    end
  end

  new_arr
end

def maximum(arr, &block)
  return nil if arr.length == 0
  result = arr[0]
  (0...arr.length).each { |i| result = arr[i] if block.call(arr[i]) >= block.call(result) }
  result
end

def my_group_by(arr, &block)
  hash = {}
  arr.each do |ele|
    if !hash[block.call(ele)]
      hash[block.call(ele)] = [ele]
    else
      hash[block.call(ele)] << ele
    end
  end

  hash
end

def max_tie_breaker(arr, proc, &block)
  return nil if arr.length == 0

  max = arr[0]

  arr.each do |i|
    result_ele = block.call(i)
    result_max = block.call(max)

    if result_ele > result_max
      max = i
    elsif result_ele == result_max && proc.call(i) > proc.call(max)
      max = i
    end
  end

  max
end

def silly_syllables(sentence)
  words = sentence.split(" ")
  new_words = words.map do |word|
    if vowel_indices(word).length < 2
      word
    else
      change_word(word)
    end
  end
  new_words.join(" ")
end

def vowel_indices(word)
  vowels = "aeiou"
  indices = []
  word.each_char.with_index do |char, i|
    indices << i if vowels.include? char
  end

  indices
end

def change_word(word)
  indices = vowel_indices(word)
  word[indices.first..indices.last]
end
